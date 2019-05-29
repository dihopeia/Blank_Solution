using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Images
    {
        [Key]
        public int ID { get; set; }
        public int productID { get; set; }
        public string imgURL { get; set; }

        public Images()
        {
            this.productID = productID;
            this.imgURL = imgURL;
        }
    }
}