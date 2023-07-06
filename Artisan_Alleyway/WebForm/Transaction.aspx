<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="Artisan_Alleyway.WebForm.Transaction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/Cart.css" />
    <link rel="stylesheet" type="text/css" href="css/transaction.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class ="header">
                <span>Transaction Page</span>
            </div>
            
            <div class="transaction-container">
                <div class="cart-container">
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
                </div>
                <div class="transaction-details">
                    <h3>User Information</h3>
                    <div class ="user-information">
                        <div class="title">
                            <span>Name: </span><br />
                            <span>Phone Number: </span><br />
                            <span>Email: </span><br />
                            <span>Address: </span><br />
                        </div>
                        <div class ="content">
                            <asp:TextBox ID="user_name" runat="server" EnableViewState="true"></asp:TextBox><br />
                            <asp:TextBox ID="user_phone" runat="server"></asp:TextBox><br />
                            <asp:TextBox ID="user_email" runat="server"></asp:TextBox><br />
                            <asp:TextBox ID="user_address" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox><br />
                        </div>
                    </div>

                    <span>Total Price: RM </span>
                    <asp:Label ID="priceLabel" runat="server"></asp:Label> <br />

                    <asp:Button ID="submit_transaction" runat="server" Text="Submit" OnClick="submitTransaction" />
                </div>
            </div>
        </div>
    </form>

</body>
</html>
