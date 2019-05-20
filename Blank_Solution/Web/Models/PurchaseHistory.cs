using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class PurchaseHistory
    {
        [Key]
        public int CustomerID { get; set; }
        public virtual OrderList OrderList { get; set; }
    }
}