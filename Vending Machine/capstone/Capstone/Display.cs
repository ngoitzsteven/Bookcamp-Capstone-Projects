using System;
using System.Collections.Generic;
using System.Text;

namespace Capstone
{
    public class Display
    {

        public string  DisplayMainMenu()
        {
            Console.WriteLine("Welcome to Umbrella Corp. Please select from the main menu");
            Console.WriteLine("please choose from the following items");
            Console.WriteLine("=======================================");
            Console.WriteLine("1) Display Vending Machine Items");
            Console.WriteLine("2) Purchase Items");
            Console.WriteLine("3) Shop Elsewhere");
            return null;
        }

        public void DisplayProductList(List<VendorItem> vendorItems)
        {
            Console.WriteLine("Location | Name | Price | Type | Stock");
            foreach (VendorItem item in vendorItems)
            {
                if (item.Inventory == 0)
                {
                    Console.WriteLine($"{item.SlotLocation} | {item.ProductName} | {item.Price} | {item.ItemType} | SOLD OUT");
                }
                else 
                //Make this display whether things are sold out
                Console.WriteLine($"{item.SlotLocation} | {item.ProductName} | {item.Price} | {item.ItemType} | {item.Inventory}");

            }
        }

        public string DisplayPurchaseMenu(double balance)
        {
            Console.WriteLine("Please select from the following actions");
            Console.WriteLine("=======================================");
            Console.WriteLine("1) Feed Money");
            Console.WriteLine("2) Select Product");
            Console.WriteLine("3) Finish Transaction!");
            Console.WriteLine("\n");
            Console.WriteLine($"Current Money Provided: ${Math.Round(balance,2)}");

            //return Console.ReadLine();
            return null;
        }
    }
}
