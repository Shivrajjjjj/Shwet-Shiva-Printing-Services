using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{
    public partial class Feedback : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["PrintingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeedback();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(txtFeedback.Text))
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Feedback (Name, Email, Message, DateSubmitted) VALUES (@Name, @Email, @Message, GETDATE())";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Message", txtFeedback.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // Clear form fields after submission
                txtName.Text = "";
                txtEmail.Text = "";
                txtFeedback.Text = "";

                // Reload feedback
                LoadFeedback();
            }
        }

        private void LoadFeedback()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 5 Name, Message, CONVERT(VARCHAR, DateSubmitted, 103) AS DateSubmitted FROM Feedback ORDER BY DateSubmitted DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    string feedbackHtml = "<ul class='list-group list-group-flush'>";
                    while (reader.Read())
                    {
                        feedbackHtml += $"<li class='list-group-item'><strong>{reader["Name"]}:</strong> \"{reader["Message"]}\" <span class='text-muted'>({reader["DateSubmitted"]})</span></li>";
                    }
                    feedbackHtml += "</ul>";

                    con.Close();

                    // Assign feedback to Literal control (to be placed in Feedback.aspx)
                    feedbackList.Text = feedbackHtml;
                }
            }
        }
    }
}
