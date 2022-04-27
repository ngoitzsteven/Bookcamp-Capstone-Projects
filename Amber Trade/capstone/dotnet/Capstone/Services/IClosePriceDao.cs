using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.Services
{
    public interface IClosePriceDao
    {

        ClosePrice GetPrice(string stockTicker);

        //List<ClosePrice.Rootobject> GetPrice(string stockTicker);

    }
}
