using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Anonym
    {
        [Key]
        public int ID { get; set; }

        public string SessionID { get; set; }

        public Anonym(string SessionID)
        {
            this.SessionID = SessionID;
        }

        public Anonym()
        {

        }
    }

    
}