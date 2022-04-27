using Microsoft.VisualStudio.TestTools.UnitTesting;
using Capstone;
using System;
using System.Collections.Generic;
using System.IO;

namespace CapstoneTests
{
    [TestClass]
    public class VendineMachineTests
    {
        [TestMethod]

        //Testing AddFunds
        public void AddFunds_5_Test()
        {
            //Arrange
            List<VendorItem> vendorTest = new List<VendorItem>();
            VendingMachine fundsTest = new VendingMachine(vendorTest);
            double expectedResult = 5.0;

            //Act
            fundsTest.AddFunds(5);
            double actualResult = fundsTest.Balance;

            //Assert
            Assert.AreEqual(expectedResult, actualResult);

        }
        [TestMethod]
        public void AddFunds_10_Test()
        {
            //Arrange
            List<VendorItem> vendorTest = new List<VendorItem>();
            VendingMachine fundsTest = new VendingMachine(vendorTest);
            double expectedResult = 10.0;

            //Act
            fundsTest.AddFunds(10);
            double actualResult = fundsTest.Balance;

            //Assert
            Assert.AreEqual(expectedResult, actualResult);

        }
        [TestMethod]
        public void AddFunds_15_Test()
        {
            //Arrange
            List<VendorItem> vendorTest = new List<VendorItem>();
            VendingMachine fundsTest = new VendingMachine(vendorTest);
            double expectedResult = 15.0;

            //Act
            fundsTest.AddFunds(15);
            double actualResult = fundsTest.Balance;

            //Assert
            Assert.AreEqual(expectedResult, actualResult);

        }
        [TestMethod]
        public void AddFunds_ExistingBalance_Test()
        {
            //Arrange
            List<VendorItem> vendorTest = new List<VendorItem>();
            VendingMachine fundsTest = new VendingMachine(vendorTest);
            fundsTest.Balance = 10.0;
            double expectedResult = 17.0;

            //Act
            fundsTest.AddFunds(7);
            double actualResult = fundsTest.Balance;

            //Assert
            Assert.AreEqual(expectedResult, actualResult);
        }

        //Testing Void Methods
        
        [TestMethod]
        public void ChangeCalcTests()
        {
            //arranged
            List<VendorItem> vendorTest = new List<VendorItem>();
            VendingMachine changeTest = new VendingMachine(vendorTest);
            //act
            changeTest.Balance = 100;
            int expectedValue = 0;
            changeTest.ChangeCalc();

            //assert
            Assert.AreEqual(expectedValue, changeTest.Balance, "zero");
        }
        [TestMethod]
        public void ChangeCalcTests2()
        {
            //arranged
            List<VendorItem> vendorTest = new List<VendorItem>();
            VendingMachine changeTest = new VendingMachine(vendorTest);
            //act
            changeTest.Balance = 50;
            int expectedValue = 0;
            changeTest.ChangeCalc();


            //assert
            Assert.AreEqual(expectedValue, changeTest.Balance, "zero");

        }

        [TestMethod]
        public void ChangeCalcTests3()
        {
            //arranged
            List<VendorItem> vendorTest = new List<VendorItem>();
            VendingMachine changeTest = new VendingMachine(vendorTest);
            //act
            changeTest.Balance = 50;
            int expectedValue = 0;
            changeTest.ChangeCalc();


            //assert
            Assert.AreEqual(expectedValue, changeTest.Balance, "zero");

        }
        

        //We tested out AddFunds as well as the balance clearing behavior of the void method ChangeCalcultor
        //In future, we would like to refactor our core program to make it more loosely coupled and allow for easier testing and mainentance

    }


}           
            
        
    

