using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace Capstone
{
    public class VendingMachine
    {
        public List<VendorItem> VendorItems { get; set; }
        public bool IsOn { get; set; } = true;
        public double Balance { get; set; } = 0;
        private Display display = new Display();

        private FileIO fileIO= new FileIO();

        //public Dictionary<string, int> SalesReport { get; set; }

        public VendingMachine(List<VendorItem> items)
        {
            VendorItems = items;
            //SalesReport = salesReport;
        }
        
        
        public void StartVendingMachine()
        {
            string nonString = display.DisplayMainMenu();
            string input = Console.ReadLine();            
            
            if (input == "1")
            {
                display.DisplayProductList(VendorItems);
            }

            else if (input == "2")
            {
                StartPurchaseMenu();
            }

            else if (input == "3")
            {
                IsOn = false;
            }
           

            else
            {
                Console.WriteLine("Invalid Entry, please select 1, 2, or 3 \n");
                
               
                            
            }
        }
        public void StartPurchaseMenu()
        {

            string oldstring2 = display.DisplayPurchaseMenu(Balance);
            string input = Console.ReadLine();

            if (input == "1")
            {
                bool continueAddFunds = true;
                while (continueAddFunds)
                {
                    Console.WriteLine("How Much would you like to add?");
                    string inputString = Console.ReadLine();
                    int inputAmount;
                    bool isValueInt = int.TryParse(inputString, out inputAmount);

                    if (!isValueInt)
                    {
                        Console.WriteLine("Please enter a full dollar amount, your transaction cannot be completed. \n");
                        continueAddFunds = false;
                    }

                    else if (inputAmount <= 0)
                    {
                        Console.WriteLine("Cannot add negative funds, your transaction cannot be completed. \n");
                        continueAddFunds = false;
                    }
                    else
                    {
                        double originalBalance = Balance;
                        AddFunds(inputAmount);
                        fileIO.SalesLogWriter("FEED MONEY", Math.Round(originalBalance, 2), Math.Round(Balance, 2));
                        Console.WriteLine($"your current balance is ${Math.Round(Balance, 2)}. \n enter (y)es if you would to add more funds. if not, enter any other value to return to previous menu.");

                        string addMore = Console.ReadLine();

                        if (addMore.ToLower() != "y" && addMore.ToLower() != "yes")
                        {
                            continueAddFunds = false;
                        }
                    }
                } 
                StartPurchaseMenu();
            } 

            else if (input == "2")
            {
                display.DisplayProductList(VendorItems);
                Console.WriteLine("Which item would you like?");
                string selection = Console.ReadLine().ToUpper();
                BuyingMenu(selection);
            }

            else if (input == "3")
            {
                ChangeCalc();

            }
            else
            {
                Console.WriteLine("Invalid Entry, please select 1, 2, or 3 \n");
                StartPurchaseMenu();

            }


        }
        public void AddFunds(int addedFunds)
        {
           
                double originalBalance = Balance;
                Balance += addedFunds;
                
                //Console.WriteLine("Please Select how much money you wish to enter, full dollar ammounts only:");
                //string addedFundsString = Console.ReadLine();

                //bool isValueInt = int.TryParse(addedFundsString, out addedFunds);

                //if (!isValueInt)
                //{
                //    Console.WriteLine("Please enter a full dollar amount, your transaction cannot be completed. \n");
                //    continueAddFunds = false;
                //}

                //else if (addedFunds <= 0)
                //{
                //    Console.WriteLine("Cannot add negative funds, your transaction cannot be completed. \n");
                //    continueAddFunds = false;
                //}
                //else
                //{
         
        }

        public void BuyingMenu(string selection)
        {
            VendorItem selectedItem = new VendorItem();
            
            
            for (int i = 0; i < VendorItems.Count; i++)
            {

                if (selection == VendorItems[i].SlotLocation)
                {
              
                    selectedItem.SlotLocation = VendorItems[i].SlotLocation;
                    selectedItem.ProductName = VendorItems[i].ProductName;
                    selectedItem.Price = VendorItems[i].Price;
                    selectedItem.ItemType = VendorItems[i].ItemType;
                    selectedItem.Inventory = VendorItems[i].Inventory;
                   

                    if (selectedItem.Inventory <= 0)
                    {
                        Console.WriteLine("That item is SOLD OUT, your purchase could not be completed \n");

                    }
                    else if (selectedItem.Price > Balance)
                    {
                        Console.WriteLine("Insufficent funds, your puchase could not be completed \n");

                    }
                    else
                    {
                        Console.Write($"Thanks for buying {VendorItems[i].ProductName}");

                        switch (VendorItems[i].ItemType)
                        {
                            case "Chip":
                                Console.WriteLine(", Crunch Crunch, Yum! \n");
                                break;
                            case "Candy":
                                Console.WriteLine(", Munch Munch, Yum! \n");
                                break;
                            case "Drink":
                                Console.WriteLine(", Glug Glug, Yum! \n");
                                break;
                            case "Gum":
                                Console.WriteLine(", Chew Chew, Yum! \n");
                                break;
                        }

                        fileIO.SalesLogWriter($"{VendorItems[i].ProductName} {VendorItems[i].SlotLocation}", Math.Round(Balance, 2), Math.Round((Balance - VendorItems[i].Price), 2));

                        Balance -= selectedItem.Price;    
                        VendorItems[i].Inventory -= 1;   
                                                         

                        //SalesReport[VendorItems[i].ProductName] += 1;


                    }

                }

         
            }
            if (selectedItem.SlotLocation is null)
            {
                Console.WriteLine("You picked an invalid slot, your purchase could not be completed \n");
            }

            StartPurchaseMenu();
        }
        public void ChangeCalc()
        {
            fileIO.SalesLogWriter("GIVE CHANGE", Balance, 0.00);
            
            int coin = (int)(Math.Round(Balance,2) * 100);
            int quarters = coin / 25;
            int quarterRemainder = coin % 25;
            int dimes = quarterRemainder / 10;
            int dimeRemainder = quarterRemainder % 10;
            int nickles = dimeRemainder / 5;
            int pennies = dimeRemainder % 5;
  
            Console.WriteLine($"Your Change is {quarters} Quarters, {dimes} Dimes, {nickles} Nickels, {pennies} Pennies.");
            Balance = 0;

        }
        
    }
}
