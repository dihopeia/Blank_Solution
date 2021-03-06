﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class CustomerDetails
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public int CustomerID { get; set; }

        [Required]
        public string FirstName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        public string EmailAddress { get; set; }

        [Required]
        public string PhoneNumber { get; set; }

        public CustomerDetails()
        {

        }

        public CustomerDetails(string FirstName, string LastName, string EmailAddress, string PhoneNumber)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.EmailAddress = EmailAddress;
            this.PhoneNumber = PhoneNumber;
        }
    }
}