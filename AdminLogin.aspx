<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.AdminLogin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function validateForm() {
            var username = document.getElementById('<%= txtUsername.ClientID %>').value;
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;
            if (username.trim() === "" || password.trim() === "") {
                document.getElementById('lblMessage').innerText = "Username and Password are required!";
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
    <form id="form1" runat="server" class="p-4 bg-white rounded shadow" onsubmit="return validateForm();">
        <div class="text-center mb-3">
            <h2>Admin Login</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="text-danger"></asp:Label>
        </div>
        <div class="mb-3">
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Username"></asp:TextBox>
        </div>
        <div class="mb-3">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Password"></asp:TextBox>
        </div>
        <div class="text-center">
            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>