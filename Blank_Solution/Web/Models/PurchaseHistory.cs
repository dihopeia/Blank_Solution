using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class PurchaseHistory
    {
        private DateTime purchaseTime;

        [Key]
        public int CustomerID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public string PhoneNumber { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string Address { get; set; }
        public int ProductID { get; set; }
        public int Count { get; set; }
        public int Price { get; set; }
        public string Status { get; set; }

        public DateTime PurchaseTime
        {
            get { return purchaseTime; }
            set { purchaseTime = value; }
        }

    }
}