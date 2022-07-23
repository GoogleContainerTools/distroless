using System.Globalization;
using System.IO.Compression;
using System.Runtime;

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

        CancellationTokenSource cts = new(60_000);

        try
        {
            switch (arg)
            {
                case "gcmode":
                    RunGcModeTest();
                    break;
                case "https":
                    await RunHttpsTestAsync(cts.Token);
                    break;
                case "gzip":
                    RunGzipTest();
                    break;
                case "tzdata":
                    RunTimeZoneTest();
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
        catch (Exception ex)
        {
            Console.Error.WriteLine(ex.ToString());
        }
    }

    private static void RunGcModeTest()
    {
        if (GCSettings.IsServerGC)
        {
            throw new TestException($"Unexpected GC mode: {nameof(GCSettings.IsServerGC)}: {GCSettings.IsServerGC}");
        }
        Console.WriteLine($"Success! Error: ''");
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

        HttpClient client = new() { Timeout = TimeSpan.FromSeconds(40) };

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
            // This will be handled below.
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
                try
                {
                    await task;
                }
                catch (Exception ex)
                {
                    if (error == "")
                    {
                        error = $"{wellKnownSecureSite} failed with {ex.GetType()}: {ex.Message}";
                    }
                    else
                    {
                        error = $"{error}, {wellKnownSecureSite} failed with {ex.GetType().Name}: {ex.Message}";
                    }
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

        throw new TestException($"{nameof(inEqualsOut)}: {inEqualsOut}, {nameof(compressedDifferent)}: {compressedDifferent}");

        static byte[] Compress(byte[] originalBytes)
        {
            using MemoryStream compressed = new();
            using MemoryStream original = new(originalBytes, writable: false);
            using (GZipStream compressor = new(compressed, CompressionMode.Compress, leaveOpen: true))
            {
                original.CopyTo(compressor);
            }

            compressed.Flush();
            compressed.Position = 0;

            return compressed.ToArray();
        }

        static byte[] Decompress(byte[] compressedBytes)
        {
            using MemoryStream compressed = new(compressedBytes, writable: false);
            using MemoryStream decompressed = new();
            using (GZipStream decompressor = new(compressed, CompressionMode.Decompress, leaveOpen: true))
            {
                decompressor.CopyTo(decompressed);
            }

            decompressed.Flush();
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

        throw new TestException($"Expected: 'Iİ ₺1,99', Actual: '{formatted}'");
    }

    private static void RunTimeZoneTest()
    {
        TimeZoneInfo tz = TimeZoneInfo.FindSystemTimeZoneById("Europe/Amsterdam");
        if (tz.SupportsDaylightSavingTime && tz.BaseUtcOffset == TimeSpan.FromHours(1))
        {
            Console.WriteLine("Success! Error: ''");
            return;
        }
        throw new TestException($"Expected: 'Id: Europe/Amsterdam, Offset: 01:00:00, DST: True', Actual: 'Id: {tz.Id}, Offset: {tz.BaseUtcOffset}, DST: {tz.SupportsDaylightSavingTime}'");
    }
    
    private sealed class TestException : Exception
    {
        public TestException(string message) : base($"Failure! {message}")
        {
        }
    }
}
