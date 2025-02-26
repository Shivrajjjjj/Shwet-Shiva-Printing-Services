using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{
    public partial class Checkout : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["PrintingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartSummary();
            }
        }

        private void LoadCartSummary()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                SELECT COALESCE(p.ProductName, s.ServiceName) AS ItemName,
                       CASE WHEN p.ProductID IS NOT NULL THEN 'Product' ELSE 'Service' END AS Type,
                       COALESCE(p.Price, s.Price) AS Price,
                       c.Quantity,
                       (COALESCE(p.Price, s.Price) * c.Quantity) AS Total
                FROM Cart c
                LEFT JOIN Products p ON c.ProductID = p.ProductID
                LEFT JOIN Services s ON c.ServiceID = s.ServiceID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    CartSummaryGrid.DataSource = dt;
                    CartSummaryGrid.DataBind();

                    decimal totalAmount = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        totalAmount += Convert.ToDecimal(row["Total"]);
                    }
                    lblTotal.Text = totalAmount.ToString("C");
                }
            }
        }

        protected void PlaceOrder(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Insert Order
                string orderQuery = @"
        INSERT INTO Orders (FullName, Email, Phone, Address, TotalAmount)
        VALUES (@FullName, @Email, @Phone, @Address, @TotalAmount);
        SELECT SCOPE_IDENTITY();";

                int orderId; // Declare orderId

                using (SqlCommand cmd = new SqlCommand(orderQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);

                    // Safely parse the total amount
                    decimal totalAmount;
                    string totalText = lblTotal.Text.Replace("₹", "").Trim();

                    if (decimal.TryParse(totalText, out totalAmount))
                    {
                        cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                    }
                    else
                    {
                        // Handle invalid total amount format (e.g., show a message to the user)
                        Response.Write("Invalid total amount.");
                        return;
                    }

                    // Retrieve the newly inserted OrderID
                    orderId = Convert.ToInt32(cmd.ExecuteScalar());
                }

                // Insert Order Details
                string orderDetailsQuery = @"
        INSERT INTO OrderDetails (OrderID, Name, Type, Price, Quantity, Total)
        SELECT @OrderID, COALESCE(p.ProductName, s.ServiceName), 
               CASE WHEN p.ProductID IS NOT NULL THEN 'Product' ELSE 'Service' END,
               COALESCE(p.Price, s.Price), c.Quantity,
               (COALESCE(p.Price, s.Price) * c.Quantity)
        FROM Cart c
        LEFT JOIN Products p ON c.ProductID = p.ProductID
        LEFT JOIN Services s ON c.ServiceID = s.ServiceID";

                using (SqlCommand cmd = new SqlCommand(orderDetailsQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    cmd.ExecuteNonQuery();
                }

                // Clear Cart After Checkout
                string clearCartQuery = "DELETE FROM Cart";
                using (SqlCommand cmd = new SqlCommand(clearCartQuery, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }

            // Redirect to Order Confirmation with the OrderID
            Response.Redirect($"OrderConfirmation.aspx?orderId=123");
        }

    }
}
