<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popup_cart.aspx.cs" Inherits="Artisan_Alleyway.WebForm.popup_cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link rel="stylesheet" type="text/css" href="css/Cart.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="cart-title">Shoping Cart</h1>
            <div class="cartList-container">
                <asp:Repeater ID="cartList" runat="server">
                    <ItemTemplate>
                        <div class="cart-item">
                            <div class="cart-image">
                            <img src="<%# Eval("item.image") %>" alt="<%# Eval("item.name") %>" />
                            </div>
                            <div class="item-details">
                                <h4 class ="item-data"><%# Eval("item.name") %></h4>
                                <asp:Label ID="pricelabel" CssClass ="item-data" runat="server" Text='<%# Eval("item.price") %>'></asp:Label>
                                <p class ="item-data">Amount: <%# Eval("amount") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>`
            <button id="submitCart" onclick="redirectToAnotherForm()">Check out</button>
        </div>

        <script>
            function submit_checkout() {
                var message = {
                    action: "closeAndOpen"
                };

                // Send message to the parent page
                window.parent.postMessage(message, "*");
            }

            function redirectToAnotherForm() {
                var url = "Transaction.aspx"; // Replace with the URL of the target form

                // Change the parent page's URL
                window.parent.location.href = url;
            }
        </script>



    </form>

    


</body>
</html>
