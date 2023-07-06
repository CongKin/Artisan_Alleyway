<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home page.aspx.cs" Inherits="Artisan_Alleyway.Home_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Artisan Alleyway</title>
    
    <link rel="stylesheet" type="text/css" href="css/HomePage.css" />
</head>
<body>

 <style>
  .popupPanel {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 20px;
    z-index: 1000;
    width: 70%;
    height:70%;
  }

  .modalBackground {
    background-color: rgba(0, 0, 0, 0.6);
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 980;
    display:none;
  }
</style>

    <form id="feedback" runat="server">
        <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <header>
      <nav class="navbar">
        <div class="left-items">
          <a href="#" class="logo">
            <img src="image/logo.png" alt="Logo"/>
            <span class="website-name">Artisan Alleyway</span>
          </a>
        </div>
        <div class="right-items">
          <a href="#" class="icon"><img src="image/address_book.png" alt="Address Book" /></a>
            <asp:ImageButton ID="cartImageButton" runat="server" CssClass="icon" ImageUrl="image/cart.png" OnClick="cartImageButton_Click"/>

            <asp:ImageButton ID="userImageButton" runat="server" CssClass="icon" ImageUrl="image/user.png" OnClick="userImageButton_Click" />
       </div>
      </nav>
    </header>

    <cc1:ModalPopupExtender ID="userModalPopupExtender" runat="server" TargetControlID="userImageButton" PopupControlID="userPanel"  BackgroundCssClass="modalBackground"/>
    <asp:Panel ID="userPanel" runat="server" CssClass="rightPopupPanel">
        
    </asp:Panel>

    <cc1:ModalPopupExtender ID="cartModalPopupExtender" runat="server" TargetControlID="cartImageButton" PopupControlID="cartPanel"  BackgroundCssClass="modalBackground" CancelControlID="ButtonCart"/>
    
    <asp:Panel ID="cartPanel" runat="server" CssClass="rightPopupPanel">
        <iframe id="cartFrame" src="popup_cart.aspx" frameborder="0" width="100%" height="90%"></iframe>
    <asp:Button ID="ButtonCart" runat="server" Text="Close" />  
    </asp:Panel>

    <div class="announcement">
        <div class ="announcement-text">
            <h1>Celebrate the Art of Handcrafted Excellence</h1>
            <h2>- Discover Unique Creations and Support Independent Artists at Artisan Alleyway!!!</h2>
        </div>
        <img src="image/annoucement.png" alt="announcement" />
    </div>

    

    <div class ="category">
        <h1 class="category-text">Categories</h1>
        
        <div class="horizontal-container">
            <asp:Repeater ID="categoryList" runat="server">
                <ItemTemplate>
                    <div class="category-item">
                        <div class="category-image">
                        <img src='<%# Eval("image") %>'  alt='<%# Eval("name") %>' />
                        </div>
                        <span class="category-name"><%# Eval("name") %></span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
        
    <div class="commodity">
        <h1 class="commodity-text">Jewelry</h1>
        <div class ="horizontal-container">
            <asp:Repeater ID="jewelryList" runat="server">
                <ItemTemplate>
                    <div id="item" class="commodity-item" runat="server" onclick='<%# "openPopup(" + Eval("id") + ");" %>'>
                        <img src='<%# Eval("image") %>'  alt='<%# Eval("name") %>' />
                        <p class="commodity-name"><%# Eval("name") %></p>
                        <div class ="commodity-details">
                            <span class="commodity-price">RM<%# Eval("price") %></span>
                            <span class="commodity-sold"><%# Eval("sold") %> sold</span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <div class="commodity">
        <h1 class="commodity-text">Home Decor</h1>
        <div class ="horizontal-container">
            <asp:Repeater ID="homeDecorList" runat="server">
                <ItemTemplate>
                    <div id="item" class="commodity-item" runat="server" onclick='<%# "openPopup(" + Eval("id") + ");" %>' >
                        <img src='<%# Eval("image") %>'  alt='<%# Eval("name") %>' />
                        <p class="commodity-name"><%# Eval("name") %></p>
                        <div class ="commodity-details">
                            <span class="commodity-price">RM<%# Eval("price") %></span>
                            <span class="commodity-sold"><%# Eval("sold") %> sold</span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <div class="commodity">
        <h1 class="commodity-text">Accessories</h1>
        <div class ="horizontal-container">
            <asp:Repeater ID="accessoriesList" runat="server">
                <ItemTemplate>
                    <div class="commodity-item" runat="server" onclick='<%# "openPopup(" + Eval("id") + ");" %>'>
                        <img src='<%# Eval("image") %>'  alt='<%# Eval("name") %>' />
                        <p class="commodity-name"><%# Eval("name") %></p>
                        <div class ="commodity-details">
                            <span class="commodity-price">RM<%# Eval("price") %></span>
                            <span class="commodity-sold"><%# Eval("sold") %> sold</span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    
    


    <footer>
        <div class="footerBar">
            <div class="footerContent">
                <h1 class="footerContent-title">About us</h1>
                <p class="footerContent-content"> This is SWE310 Programming Elective II (2) assignment 2 from Ong Cong Kin, SWE2004472. This online store aim to sell handmade products.</p>
            </div>
            <div class="footerContent">
                <h1 class="footerContent-title">Contact</h1>
                <p class="footerContent-content">Name: Ong Cong Kin</p>
                <p class="footerContent-content">Student ID: SWE2004472</p>
                <p class="footerContent-content">Phone: +6012-524 0052</p>
                <p class="footerContent-content">Email: SWE2004472@xmu.edu.my</p>
            </div>

            <div class="footerContent">
                
                    <h1 class="footerContent-title">Feedback</h1>
                    <asp:TextBox class="feedbackContent" ID="feedbackContent" runat="server" placeholder="Write your feedback here~" TextMode="MultiLine" Rows="6"></asp:TextBox>
                    <br />
                    <asp:Button class="feedbackButton" ID="feedbackButton" runat="server" Text="Submit" BorderStyle="Solid"/>
                
            </div>
        </div>
    </footer>

    

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:Panel ID="popupPanel" runat="server" CssClass="popupPanel">
    <iframe id="iframeContent" style=" width: 100%; height: 100%;" runat="server"></iframe> 
    <asp:Button ID="Button2" runat="server" Text="Close" />  
</asp:Panel>
<cc1:ModalPopupExtender ID="popupExtender" runat="server" TargetControlID="dummyTarget"
  PopupControlID="popupPanel" BackgroundCssClass="modalBackground" CancelControlID="Button2"/>
<asp:Button ID="dummyTarget" runat="server" Style="display: none" />

        <asp:Panel ID="transactionPanel" runat="server" CssClass="popupPanel">
            <iframe if="transactionFrame" style=" width: 100%; height: 100%;" runat="server"></iframe> 
            <asp:Button ID="Button1" runat="server" Text="Close" />
        </asp:Panel>
        <cc1:ModalPopupExtender ID="transactionExtender" runat="server" TargetControlID="dummyTarget" 
             PopupControlID="transactionPanel" BackgroundCssClass="modalBackground" CancelControlID="Button1"></cc1:ModalPopupExtender>



<script type="text/javascript">

    function openPopup(itemId) {
        //var popup = $find('<%= popupExtender.ClientID %>');
        var panel = document.getElementById('<%= popupPanel.ClientID %>');
        var iframe = document.getElementById('iframeContent');

        // Set the source of the iframe
        iframe.src = "popout_item.aspx?itemId=" + itemId;

        // Show the panel and open the popup
        panel.style.display = 'block';
        //popup.show();
    }

    var itemFrame = document.getElementById("iframeContent");

    itemFrame.onload = function () {
        var itemFrameWindow = itemFrame.contentWindow;

        itemFrameWindow.document.getElementById("item_button").addEventListener("click", function () {
            $find("popupExtender").hide();
            alert("Your item had add to cart!");
        });
    }

    
    // Listen for messages from the iframe
    window.addEventListener("message", function (event) {
        var message = event.data;

        if (message.action === "closeAndOpen") {
            // Close Panel 1 and Open Panel 2
            cartModalPopupExtender.hide();
            transactionExtender.display();
        }
    }); 
</script>


</script>



            

    </form>
   


</body>

</html>
