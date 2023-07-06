using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Artisan_Alleyway.WebForm.database
{
    public class model_transaction
    {
        public int id { get; set; }
        public int userId { get; set; }
        public string name { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string address { get; set; }
        public List<transaction_item> Items { get; set; } = new List<transaction_item>();

        public class transaction_item
        {
            public int id {  get; set; }
            public int amount { get; set; }
        }
    }
}