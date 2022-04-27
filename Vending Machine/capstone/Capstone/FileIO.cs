using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace Capstone
{
    public class FileIO
    {

        public List<VendorItem> VendorInventory()
        {
            try
            {
                List<VendorItem> productList = new List<VendorItem>();
                const string relativeFileName = @"../../../../vendingMachine.csv";
                string directory = Environment.CurrentDirectory;
                string fileName = Path.Combine(directory, relativeFileName);
                string fullPath = Path.GetFullPath(fileName);
                using (StreamReader reader = new StreamReader(fullPath))
                {
                    while (!reader.EndOfStream)

                    {
                        string line = reader.ReadLine();
                        string[] productData = line.Split('|');
                        productList.Add(new VendorItem(productData[0], productData[1], productData[2], productData[3]));
                    }
                }

                return productList;
            }
            catch (FileNotFoundException FileNotThere)
            {
                throw new FileNotFoundException("File not found, please Check file path");
            }
        }
        public void SalesLogWriter(string message, double startBalance, double endBalance)
        {
            const string relativeFileName = @"../../../../Log.txt";
            string directory = Environment.CurrentDirectory;
            string fileName = Path.Combine(directory, relativeFileName);
            string fullPath = Path.GetFullPath(fileName);

            using (StreamWriter logWriter = new StreamWriter(fullPath, true))
            {
                logWriter.WriteLine($"{DateTime.Now} {message}: ${startBalance} ${endBalance}");
            }

        }


    }
}