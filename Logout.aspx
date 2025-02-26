<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Logout" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="logout-container">
        <h2>Logging Out...</h2>
        <p>Please wait while we log you out.</p>
    </div>

    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session data to log the user out
            Session.Clear(); // Clear all session variables
            Session.Abandon(); // End the session

            // Option 1: Redirect to Home.aspx
            Response.Redirect("~/Home.aspx");

            // Option 2 (alternative): Close the window
            // ScriptManager.RegisterStartupScript(this, this.GetType(), "close", "window.close();", true);
        }
    </script>

    <!-- Additional Styling -->
    <style>
        .logout-container {
            text-align: center;
            margin-top: 100px;
            font-size: 24px;
            color: #333;
        }
        
        .logout-container h2 {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .logout-container p {
            font-size: 18px;
            color: #777;
        }
    </style>
</asp:Content>
