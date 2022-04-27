using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace Capstone
{
    public class VendorItem
    {
        public string SlotLocation { get; set; }
        public string ProductName { get; set; }
        public double Price { get; set; }
        public int Inventory { get; set; } = 5;
        public string ItemType { get; set; }
        public VendorItem(string slotLocation, string productName, string price, string itemType)
        {
            SlotLocation = slotLocation;
            ProductName = productName;
            Price = double.Parse(price);
            ItemType = itemType;
        }
        public VendorItem()
        {

        }
    }
}
