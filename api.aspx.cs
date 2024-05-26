using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace YourNamespace
{
    public class CovidDataService
    {
        private static readonly HttpClient client = new HttpClient();

        public async Task<JObject> GetCovidData()
        {
            try
            {
                // URL endpoint của Node-RED
                string url = "http://localhost:1880/getcoviddata";

                // Gọi HTTP GET để lấy JSON từ Node-RED
                HttpResponseMessage response = await client.GetAsync(url);
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();

                // Parse JSON response
                JObject json = JObject.Parse(responseBody);

                return json;
            }
            catch (HttpRequestException e)
            {
                Console.WriteLine("\nException Caught!");
                Console.WriteLine("Message :{0} ", e.Message);
                return null;
            }
        }
    }
}
