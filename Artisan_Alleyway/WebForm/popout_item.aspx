<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popout_item.aspx.cs" Inherits="Artisan_Alleyway.WebForm.popout_item" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/Item.css" />
</head>
<body>
    <form id="form1" runat="server">  
        <div class="item-container">
            <div class="item-image">
                <img src="<%=((Artisan_Alleyway.WebForm.database.model_item)Session["Data"]).image %>" />
            </div>
            <div class="item-details">
                <h1><%=((Artisan_Alleyway.WebForm.database.model_item)Session["Data"]).name %></h1>
                <h2>RM <%=((Artisan_Alleyway.WebForm.database.model_item)Session["Data"]).price %></h2>
                <h3><%=((Artisan_Alleyway.WebForm.database.model_item)Session["Data"]).sold %> items sold</h3>
                <asp:Button ID ="item_button" runat="server" Text="Add to Cart" OnClick="addToCart"/>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </div>
            
        </div>
    </form>

    <style>
        body{
            background-color: #FFFFFF;
        }
    </style>
</body>
</html>
