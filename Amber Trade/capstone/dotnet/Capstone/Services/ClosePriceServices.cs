using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using RestSharp;
using Capstone.Models;

namespace Capstone.Services
{
    public class ClosePriceServices : IClosePriceDao
    {
       
        private readonly RestClient client = new RestClient();

        public ClosePrice GetPrice(string stockTicker)
        {
            //string result = DateTime.Now.Date.AddDays(-1).ToString("yyyy-MM-dd");

            string result = "2022-04-13";


            string first = "https://api.polygon.io/v1/open-close/";
            string second = "?adjusted=true&apiKey=katsjNypap5pM3XpvIDU8ypcVp9EiMrx";

            RestRequest request = new RestRequest($"{first}{stockTicker}/{result}{second}");
            IRestResponse<ClosePrice> response = client.Get<ClosePrice>(request);

            return response.Data;
        }


        //DIFFRENT API STRING, THIS ONE ALWAYS GIVE THE LAST DAY CLOSE PRICE ETC....

        //public List<ClosePrice.Rootobject> GetPrice(string stockTicker)
        //{
        //    string first = "https://api.polygon.io/v2/aggs/ticker/";
        //    string second = "/prev?adjusted=true&apiKey=katsjNypap5pM3XpvIDU8ypcVp9EiMrx";

        //    RestRequest request = new RestRequest($"{first}{stockTicker}{second}");
        //    IRestResponse<List<ClosePrice.Rootobject>> response = client.Get<List<ClosePrice.Rootobject>>(request);

        //    return response.Data;
        //}
    }
}
