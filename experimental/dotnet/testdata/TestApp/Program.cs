using System.Globalization;
using System.IO.Compression;

namespace TestApp;

public static class Program
{
    public static async Task Main(string[] args)
    {
        if (args.Length == 0)
            throw new ArgumentException("Missing test args", nameof(args));

        if (args.Length > 1)
            throw new ArgumentException($"Too many test args '{string.Join(' ', args)}'", nameof(args));

        string arg = args[0];

        CancellationTokenSource cts = new(20_000);

        switch (arg)
        {
            case "https":
                await RunHttpsTestAsync(cts.Token);
                break;
            case "gzip":
                RunGzipTest();
                break;
            case "i18n":
                RunGlobalizationTest();
                break;
            case "kerberos":
                throw new NotImplementedException("Kerberos test not implemented yet");
            default:
                throw new NotSupportedException($"Unknown test argument '{arg}'");
        }
    }

    private static async Task RunHttpsTestAsync(CancellationToken cancellationToken)
    {
        // We use these three because:
        // 1. excellent availability
        // 2. (hopefully) independent infrastructure
        // 3. different CAs
        string[] wellKnownSecureSites =
        {
            "https://amazon.com",
            "https://google.com",
            "https://microsoft.com"
        };

        HttpClient client = new() { Timeout = TimeSpan.FromSeconds(15) };

        List<(string, Task<HttpResponseMessage>)> tasks = new(wellKnownSecureSites.Length);
        foreach (string wellKnownSecureSite in wellKnownSecureSites)
        {
            Uri uri = new(wellKnownSecureSite, UriKind.Absolute);
            tasks.Add((wellKnownSecureSite, client.GetAsync(uri, HttpCompletionOption.ResponseHeadersRead, cancellationToken)));
        }

        try
        {
            await Task.WhenAll(tasks.Select(t => t.Item2));
        }
        catch
        {
            // This will be handled down below.

        }

        int failureCount = 0;
        string error = "";
        foreach ((string wellKnownSecureSite, Task<HttpResponseMessage> task) in tasks)
        {
            if (task.IsCompletedSuccessfully)
            {
                continue;
            }

            if (task.IsFaulted || task.IsCanceled)
            {
                failureCount++;
                if (error == "")
                {
                    error = $"{wellKnownSecureSite} failed with {task.Exception?.GetType().Name}: {task.Exception?.Message}";
                }
                else
                {
                    error = $"{error}, {wellKnownSecureSite} failed with {task.Exception?.GetType().Name}: {task.Exception?.Message}";
                }
            }
        }

        if (failureCount > 1)
        {
            throw new TestException(error);
        }

        Console.WriteLine($"Success! Error: '{error}'");
    }

    private static void RunGzipTest()
    {
        byte[] originalBytes = new byte[1500];
        Random.Shared.NextBytes(originalBytes);

        byte[] compressedBytes = Compress(originalBytes);
        byte[] decompressedBytes = Decompress(compressedBytes);

        bool inEqualsOut = originalBytes.AsSpan().SequenceEqual(decompressedBytes);
        bool compressedDifferent = !originalBytes.AsSpan().SequenceEqual(compressedBytes);

        if (inEqualsOut && compressedDifferent)
        {
            Console.WriteLine("Success! Error: ''");
            return;
        }

        throw new TestException($"Failure! {nameof(inEqualsOut)}: {inEqualsOut}, {nameof(compressedDifferent)}: {compressedDifferent}");

        static byte[] Compress(byte[] originalBytes)
        {
            MemoryStream compressed = new();
            MemoryStream original = new(originalBytes, writable: false);

            GZipStream compressor = new(compressed, CompressionMode.Compress, leaveOpen: true);
            original.CopyTo(compressor);
            compressor.Flush();

            compressed.Position = 0;
            return compressed.ToArray();
        }

        static byte[] Decompress(byte[] compressedBytes)
        {
            MemoryStream compressed = new(compressedBytes, writable: false);
            MemoryStream decompressed = new();

            GZipStream decompressor = new(compressed, CompressionMode.Decompress, leaveOpen: true);
            decompressor.CopyTo(decompressed);
            decompressor.Flush();

            decompressed.Position = 0;
            return decompressed.ToArray();
        }
    }

    private static void RunGlobalizationTest()
    {
        CultureInfo turkish = CultureInfo.GetCultureInfo("tr-TR");
        string formatted = string.Format(turkish, "{0} {1:C}", "ıi".ToUpper(turkish), 1.99m);

        if (formatted.Equals("Iİ ₺1,99", StringComparison.Ordinal))
        {
            Console.WriteLine("Success! Error: ''");
            return;
        }

        throw new TestException($"Failure! Expected: 'Iİ ₺1,99', Actual: '{formatted}'");
    }

    private sealed class TestException : Exception
    {
        public TestException(string message) : base(message)
        {
        }
    }
}
