using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Photo
    {
        public Guid ID { get; set; }
        public string ImageMimeType { get; set; }
        public byte[] PhotoFile { get; set; }
    }
}