using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Artisan_Alleyway.WebForm.database
{
    public class model_cart
    {
        public int userId { get; set; }
        public model_item item { get; set; }
        public int amount { get; set; }


    }
}