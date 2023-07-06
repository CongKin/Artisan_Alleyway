using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Artisan_Alleyway.WebForm.database
{
    public class model_item
    {
        public int id { get; set; }
        public string name { get; set; }
        public string image { get; set; }
        public float price { get; set; }
        public int sold { get; set; }
        public int category { get; set; }
    }
}