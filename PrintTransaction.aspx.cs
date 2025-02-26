using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{
    public partial class PrintTransaction : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["PrintingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["TransactionID"] != null)
                {
                    string transactionID = Request.QueryString["TransactionID"];
                    LoadTransactionDetails(transactionID);
                }
                else
                {
                    lblMessage.Text = "Invalid Transaction ID.";
                }
            }
        }

        private void LoadTransactionDetails(string transactionID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT TransactionID, FullName, Email, Phone, Amount, PaymentMethod, PaymentDate FROM Payments WHERE TransactionID = @TransactionID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TransactionID", transactionID);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTransactionID.Text = reader["TransactionID"].ToString();
                            lblFullName.Text = reader["FullName"].ToString();
                            lblEmail.Text = reader["Email"].ToString();
                            lblPhone.Text = reader["Phone"].ToString();
                            lblAmount.Text = reader["Amount"].ToString();
                            lblPaymentMethod.Text = reader["PaymentMethod"].ToString();
                            lblPaymentDate.Text = reader["PaymentDate"] != DBNull.Value ? Convert.ToDateTime(reader["PaymentDate"]).ToString("dd-MM-yyyy") : "N/A";

                        }
                        else
                        {
                            lblMessage.Text = "Transaction not found.";
                        }
                    }
                }
            }
        }
    }
}
