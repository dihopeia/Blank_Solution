using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace Web.Models
{
    public class Products
    {
        
        private string name;

        public Guid ID { get; set; }

        public string Name
        {
            get { return name; }
            set
            {
                name = value;
                this.UrlFriendlyName = EkezetesMenetesites(value);
            }
        }
        public string UrlFriendlyName { get; set; }

        public int Price { get; set; }

        public string Description { get; set; }

        private string EkezetesMenetesites(string valami)
        {
            StringBuilder sb = new StringBuilder(valami.ToLower());
            char[] ekezetek = new char[] { 'ö', 'ü', 'ó', 'ő', 'ú', 'é', 'á', 'ű', 'í' };
            for (int i = 0; i < ekezetek.Length; i++)
            {
                sb.Replace(ekezetek[i].ToString(),"");          
            }
            return sb.ToString();
        }
    }
}