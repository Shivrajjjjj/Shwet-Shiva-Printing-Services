<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center p-6 bg-gray-100 min-h-screen relative">
        
        <!-- Title Section -->
        <h1 class="text-4xl font-bold text-blue-700">Your Cart</h1>
        <p class="text-lg text-gray-600 mt-2">Review your order before proceeding to checkout</p>

        <div class="mt-6 mx-auto max-w-6xl">
            <!-- Cart Table -->
            <table class="min-w-full table-auto bg-white border border-gray-300 rounded-lg shadow-md">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="p-4 text-left">Product</th>
                        <th class="p-4 text-left">Price</th>
                        <th class="p-4 text-left">Quantity</th>
                        <th class="p-4 text-left">Total</th>
                        <th class="p-4 text-left">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Cart items will be populated here dynamically --%>
                    <%
                        // Checking if there is a cart session or cookie
                        var cart = (List<Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Models.Product>)Session["Cart"];
                        if (cart != null && cart.Count > 0)
                        {
                            foreach (var product in cart)
                            {
                    %>
                    <tr>
                        <td class="p-4"><%= product.ProductName %></td>
                        <td class="p-4"><%= product.Price.ToString("C") %></td>
                        <td class="p-4">
                            <form action="Cart.aspx" method="post">
                                <input type="number" name="quantity" min="1" max="<%= product.Stock %>" value="<%= product.Quantity %>" class="w-16 p-2 border border-gray-300 rounded-md">
                                <input type="hidden" name="productID" value="<%= product.ProductID %>">
                                <button type="submit" class="mt-2 bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">
                                    Update
                                </button>
                            </form>
                        </td>
                        <td class="p-4"><%= (product.Price * product.Quantity).ToString("C") %></td>
                        <td class="p-4">
                            <form action="Cart.aspx" method="post">
                                <input type="hidden" name="productID" value="<%= product.ProductID %>">
                                <button type="submit" name="remove" class="bg-red-600 text-white px-4 py-2 rounded-md hover:bg-red-700">
                                    Remove
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                        else
                        {
                    %>
                    <tr>
                        <td colspan="5" class="p-4 text-center text-gray-600">Your cart is empty.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <%-- Cart Summary Section --%>
            <% 
                decimal totalAmount = 0;
                if (cart != null && cart.Count > 0)
                {
                    totalAmount = cart.Sum(p => p.Price * p.Quantity);
                }
            %>
            <div class="mt-6">
                <h2 class="text-2xl font-semibold">Cart Summary</h2>
                <p class="text-lg text-gray-700">Total: <strong><%= totalAmount.ToString("C") %></strong></p>
                
                <a href="Checkout.aspx" class="mt-4 bg-blue-600 text-white px-6 py-3 rounded-md shadow-md hover:bg-blue-700">
                    Proceed to Checkout
                </a>
            </div>
        </div>
    </div>
</asp:Content>
