using Artisan_Alleyway.WebForm.database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Schema;

namespace Artisan_Alleyway.WebForm
{
    public partial class popup_cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<model_cart> list = mydatabase.getCartByUserId(1);

            cartList.DataSource = list;
            cartList.DataBind();
        }
        
    }
}