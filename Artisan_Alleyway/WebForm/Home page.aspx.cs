using Artisan_Alleyway.WebForm.database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Artisan_Alleyway
{
    public partial class Home_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<model_category> categoryData = mydatabase.getCategory();

            // Bind the category data to the ASP.NET page
            categoryList.DataSource = categoryData;
            categoryList.DataBind();

            List<model_item> jewelryItem = mydatabase.getItemsByCategory(1);
            jewelryList.DataSource = jewelryItem;
            jewelryList.DataBind();

            List<model_item> homeDecorItem = mydatabase.getItemsByCategory(2);
            homeDecorList.DataSource = homeDecorItem;
            homeDecorList.DataBind();

            List<model_item> accessoriesItem = mydatabase.getItemsByCategory(3);
            accessoriesList.DataSource = accessoriesItem;
            accessoriesList.DataBind();

            

        }

        protected void userImageButton_Click(object sender, EventArgs e)
        {
            userModalPopupExtender.Show();
        }

        protected void cartImageButton_Click(object sender, ImageClickEventArgs e)
        {
            //cartModalPopupExtender.Show();
        }

    }
}