using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{

    public partial class AdminLogin : System.Web.UI.Page
    {
       
            protected void Page_Load(object sender, EventArgs e)
            {
            }

            protected void btnLogin_Click(object sender, EventArgs e)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["PrintingDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM Admins WHERE Username=@Username AND Password=@Password";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            Session["AdminUser"] = txtUsername.Text.Trim();
                            Response.Redirect("Dashboard.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Invalid login!";
                        }
                    }
                }
            }
        }
    }
