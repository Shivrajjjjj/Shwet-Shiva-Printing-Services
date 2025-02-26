using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page Load logic (if any)
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get user input from form
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();
            string connectionString = ConfigurationManager.ConnectionStrings["PrintingDB"].ConnectionString;

            // Check if all required fields are filled
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
            {
                Response.Write("<script>alert('Please fill in all fields.');</script>");
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "INSERT INTO ContactMessages (Name, Email, Message, DateSubmitted) VALUES (@Name, @Email, @Message, GETDATE())";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Message", message);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Show success message and clear form
                Response.Write("<script>alert('Your message has been sent successfully!');</script>");
                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                // Handle any errors
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
