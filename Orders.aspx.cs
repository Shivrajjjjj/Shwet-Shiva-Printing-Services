using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{
    public partial class Orders : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["PrintingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        // Load orders into GridView
        private void LoadOrders()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT OrderID, ProductOrServiceName, ItemID, TotalQuantity, FullName, Email, Phone, Address, OrderDate, Status FROM Orders";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvOrders.DataSource = dt;
                    gvOrders.DataBind();
                }
            }
        }

        // Add Order
        protected void btnAddOrder_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Orders (ProductOrServiceName, ItemID, TotalQuantity, FullName, Email, Phone, Address, OrderDate, Status) " +
                               "VALUES (@ProductOrServiceName, @ItemID, @TotalQuantity, @FullName, @Email, @Phone, @Address, GETDATE(), 'Pending')";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductOrServiceName", txtProductServiceName.Text);
                    cmd.Parameters.AddWithValue("@ItemID", txtItemID.Text);
                    cmd.Parameters.AddWithValue("@TotalQuantity", txtTotalQuantity.Text);
                    cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Refresh the GridView
            LoadOrders();
        }

        // Edit Order
        protected void gvOrders_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvOrders.EditIndex = e.NewEditIndex;
            LoadOrders();
        }

        // Update Order
        protected void gvOrders_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvOrders.Rows[e.RowIndex];
            int orderID = Convert.ToInt32(gvOrders.DataKeys[e.RowIndex].Value);

            // Check if controls exist before accessing their values
            TextBox txtProductServiceName = row.FindControl("txtProductOrServiceName") as TextBox;
            TextBox txtItemID = row.FindControl("txtItemID") as TextBox;
            TextBox txtTotalQuantity = row.FindControl("txtTotalQuantity") as TextBox;
            TextBox txtFullName = row.FindControl("txtFullName") as TextBox;
            TextBox txtEmail = row.FindControl("txtEmail") as TextBox;
            TextBox txtPhone = row.FindControl("txtPhone") as TextBox;
            TextBox txtAddress = row.FindControl("txtAddress") as TextBox;
            TextBox txtStatus = row.FindControl("txtStatus") as TextBox;

            if (txtProductServiceName == null || txtItemID == null || txtTotalQuantity == null ||
                txtFullName == null || txtEmail == null || txtPhone == null || txtAddress == null || txtStatus == null)
            {
                // Log or show error message
                return;
            }

            string productOrServiceName = txtProductServiceName.Text;
            string itemID = txtItemID.Text;
            int totalQuantity = Convert.ToInt32(txtTotalQuantity.Text);
            string fullName = txtFullName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            string address = txtAddress.Text;
            string status = txtStatus.Text;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Orders SET ProductOrServiceName=@ProductOrServiceName, ItemID=@ItemID, TotalQuantity=@TotalQuantity, FullName=@FullName, Email=@Email, Phone=@Phone, Address=@Address, Status=@Status WHERE OrderID=@OrderID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductOrServiceName", productOrServiceName);
                    cmd.Parameters.AddWithValue("@ItemID", itemID);
                    cmd.Parameters.AddWithValue("@TotalQuantity", totalQuantity);
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@OrderID", orderID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            gvOrders.EditIndex = -1;
            LoadOrders();
        }


        // Cancel Edit
        protected void gvOrders_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvOrders.EditIndex = -1;
            LoadOrders();
        }

        // Delete Order
        protected void gvOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int orderID = Convert.ToInt32(gvOrders.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Orders WHERE OrderID=@OrderID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            LoadOrders();
        }
    }
}
