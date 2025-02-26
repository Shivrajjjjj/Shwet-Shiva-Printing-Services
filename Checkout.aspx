<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="checkoutForm" runat="server">
        <div class="container mx-auto p-6 bg-gray-100 min-h-screen">
            
            <!-- Title -->
            <h1 class="text-4xl font-bold text-blue-700 text-center">Checkout</h1>

            <!-- Order Summary Table -->
            <div class="mt-6 bg-white p-6 rounded-lg shadow-lg">
                <h2 class="text-2xl font-semibold text-gray-800">Order Summary</h2>
                <asp:GridView ID="CartSummaryGrid" runat="server" CssClass="w-full border-collapse" AutoGenerateColumns="True" />
                <h3 class="text-xl font-bold mt-4">Total: <asp:Label ID="lblTotal" runat="server" CssClass="text-green-700"></asp:Label></h3>
            </div>

            <!-- Billing Details -->
            <div class="mt-6 bg-white p-6 rounded-lg shadow-lg">
                <h2 class="text-2xl font-semibold text-gray-800">Billing Information</h2>
                <label class="block font-medium mt-2">Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="w-full border p-2" />

                <label class="block font-medium mt-2">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full border p-2" />

                <label class="block font-medium mt-2">Phone</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="w-full border p-2" />

                <label class="block font-medium mt-2">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="w-full border p-2" TextMode="MultiLine" />

                <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="mt-4 bg-blue-600 text-white px-4 py-2 rounded-md shadow-md hover:bg-blue-700" OnClick="PlaceOrder" />
            </div>

        </div>
    </form>
</asp:Content>
