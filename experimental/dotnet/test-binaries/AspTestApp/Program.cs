
namespace AspTestApp;

public static class Program
{
    public static async Task Main(string[] args)
    {
        const string CONTENT = "I'm an Active Server Page ;)";
        WebApplicationBuilder builder = WebApplication.CreateBuilder(args);
        builder.Logging.ClearProviders();
        WebApplication app = builder.Build();

        CancellationTokenSource cts = new CancellationTokenSource(20_000);
        app.MapGet("/", () => CONTENT);

        await app.StartAsync(cts.Token);
        
        HttpClient client = new HttpClient
        {
            Timeout = TimeSpan.FromSeconds(10),
            BaseAddress = new Uri("http://localhost:8080")
        };

        do
        {
            try
            {
               HttpResponseMessage response = await client.GetAsync("/", cts.Token);
               string content = await response.Content.ReadAsStringAsync(cts.Token);
               if (content == CONTENT)
               {
                   Console.WriteLine(content);
                   break;
               }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        } while (!cts.IsCancellationRequested);

        await app.StopAsync(cts.Token);
    }
}
