using Artisan_Alleyway.WebForm.database;
using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Artisan_Alleyway.WebForm
{
    public partial class popout_item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["itemId"] != null)
                {
                    int itemId = int.Parse(Request.QueryString["itemId"]);
                    
                    model_item item = mydatabase.getItemById(itemId);

                    Session["Data"] = item;

                }
            }
        }

        protected void addToCart(object sender, EventArgs e)
        {
            int itemId = int.Parse(Request.QueryString["itemId"]);
            mydatabase.addItemToCart(1, itemId, 1);
        }
    }
}