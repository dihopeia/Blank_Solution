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
        public virtual List<Basket> BasketList { get; set; }
        public virtual CustomerDetails CustomerDetails { get; set; }
        public virtual DeliveryAddress DeliveryAddress { get; set; }
        public DateTime DateCreated { get; set; }
        public string Status { get; set; }

        public OrderList()
        {

        }

        public OrderList(List<Basket> BasketList, CustomerDetails CustomerDetails, DeliveryAddress DeliveryAddress, DateTime DateCreated, string Status)
        {
            this.BasketList = BasketList;
            this.CustomerDetails = CustomerDetails;
            this.DeliveryAddress = DeliveryAddress;
            this.DateCreated = DateCreated;
            this.Status = Status;
        }
    } 
}