using System;
using System.Collections.Generic;
using System.Linq;
using Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Models;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{
    public partial class Cart : System.Web.UI.Page
    {
        // Ensure cart session is initialized and handle the update/remove actions
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize Cart if it's not set
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<Product>();
                }
            }

            // Handle Remove action
            if (Request.Form["remove"] != null)
            {
                int productIDToRemove = int.Parse(Request.Form["productID"]);
                RemoveFromCart(productIDToRemove);
            }

            // Handle Update action
            if (Request.Form["quantity"] != null && Request.Form["productID"] != null)
            {
                int productIDToUpdate = int.Parse(Request.Form["productID"]);
                int newQuantity = int.Parse(Request.Form["quantity"]);
                UpdateCartQuantity(productIDToUpdate, newQuantity);
            }
        }

        // Function to remove a product from the cart
        private void RemoveFromCart(int productID)
        {
            var cart = (List<Product>)Session["Cart"];
            var productToRemove = cart.FirstOrDefault(p => p.ProductID == productID);
            if (productToRemove != null)
            {
                cart.Remove(productToRemove);
                Session["Cart"] = cart;
            }
        }

        // Function to update the quantity of a product in the cart
        private void UpdateCartQuantity(int productID, int quantity)
        {
            var cart = (List<Product>)Session["Cart"];
            var productToUpdate = cart.FirstOrDefault(p => p.ProductID == productID);
            if (productToUpdate != null)
            {
                productToUpdate.Quantity = quantity;
                Session["Cart"] = cart;
            }
        }
       
    }
}
