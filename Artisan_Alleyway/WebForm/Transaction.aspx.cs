using Artisan_Alleyway.WebForm.database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Artisan_Alleyway.WebForm
{
    public partial class Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<model_cart> list = mydatabase.getCartByUserId(1);

            cartList.DataSource = list;
            cartList.DataBind();


            float total = 0;

            foreach(model_cart cart in list)
            {
                total += (cart.item.price * cart.amount);
            }

            priceLabel.Text = total.ToString("0.00");
        }

        protected void submitTransaction(object sender, EventArgs e)
        {
            model_transaction transaction = new model_transaction();

            transaction.name = user_name.Text;
            transaction.email = user_email.Text;
            transaction.phone = user_phone.Text;
            transaction.address = user_address.Text;

            transaction.userId = 1;

            List<model_cart> list = mydatabase.getCartByUserId(1);

            foreach(model_cart cart in list)
            {
                model_transaction.transaction_item transaction1 = new model_transaction.transaction_item();
                transaction1.id = cart.item.id;
                transaction1.amount = cart.amount;
                transaction.Items.Add(transaction1);
            }

            mydatabase.addTransaction(transaction);
            mydatabase.dropCart(1);

            Response.Write("<script>alert('You have done your transaction successfully'); window.location.href = 'Home Page.aspx';</script>");


        }
    }
}