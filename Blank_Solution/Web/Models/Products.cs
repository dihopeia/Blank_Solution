﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace Web.Models
{
    public class Products
    {
        [Key]
        public int ID { get; set; }
        public int Price { get; set; }
        private string brand;
        private string size;
        private string name;
        private string resolution;
        private string ratio;
        private string hz;
        public string Description { get; set; }

        public string Brand
        {
            get { return brand; }
            set { brand = value; }
        }

        public string Size
        {
            get { return size; }
            set { size = value; }
        }

        public string Name
        {
            get { return name; }
            set
            {
                name = EkezetesMenetesites(value);
            }
        }

        public string Resolution
        {
            get { return resolution; }
            set { resolution = value; }
        }

        public string Ratio
        {
            get { return ratio; }
            set { ratio = value; }
        }

        public string Hz
        {
            get { return hz; }
            set { hz = value; }
        }        

        private string EkezetesMenetesites(string valami)
        {
            StringBuilder sb = new StringBuilder(valami.ToLower());
            char[] ekezetek = new char[] { 'ö', 'ü', 'ó', 'ő', 'ú', 'é', 'á', 'ű', 'í' };
            for (int i = 0; i < ekezetek.Length; i++)
            {
                sb.Replace(ekezetek[i].ToString(),"");          
            }
            return sb.ToString().ToUpper();
        }
    }
}