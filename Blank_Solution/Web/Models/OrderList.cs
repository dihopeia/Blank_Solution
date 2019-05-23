using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class OrderList
    {
        [Key]
        public int ID { get; set; }
        public virtual Basket Basket { get; set; }
        public virtual CustomerDetails CustomerDetails { get; set; }
        public virtual DeliveryAddress DeliveryAddress { get; set; }
        public System.DateTime DateCreated { get; set; }
        public string Status { get; set; }

        public OrderList()
        {

        }
    } 
}