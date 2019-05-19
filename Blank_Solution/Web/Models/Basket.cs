using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Basket
    {
        [Key]
        public int ItemId { get; set; }

        public int CustomerID { get; set; }

        public int Quantity { get; set; }

        public System.DateTime DateCreated { get; set; }

        public virtual Products Products { get; set; }
    }
}