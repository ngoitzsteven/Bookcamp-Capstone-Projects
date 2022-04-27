using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace Capstone
{
    public class Program
    {
        static void Main(string[] args)
        {
            FileIO fileIO = new FileIO();
            List<VendorItem> productList = fileIO.VendorInventory();
            VendingMachine vendingMachine = new VendingMachine(productList);
        

            while (vendingMachine.IsOn)
            {
                vendingMachine.StartVendingMachine();
            }
        }
    }      
}

