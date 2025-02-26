using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{
    public partial class Payments : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["PrintingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentGrid();
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (!ValidatePayment())
            {
                lblMessage.Text = "Invalid input. Please check the details.";
                return;
            }

            string transactionID = "TXN" + DateTime.Now.Ticks.ToString();
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            decimal amount = Convert.ToDecimal(txtAmount.Text.Trim());
            string paymentMethod = ddlPaymentMethod.SelectedValue;
            string cardNumber = (paymentMethod == "CreditCard") ? txtCardNumber.Text.Trim() : null;
            string expiryDate = (paymentMethod == "CreditCard") ? txtExpiry.Text.Trim() : null;
            string cvv = (paymentMethod == "CreditCard") ? txtCVV.Text.Trim() : null;
            string upiID = (paymentMethod == "UPI") ? txtUPIID.Text.Trim() : null;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO Payments (TransactionID, FullName, Email, Phone, Amount, PaymentMethod, CardNumber, ExpiryDate, CVV, UPIID)
                                 VALUES (@TransactionID, @FullName, @Email, @Phone, @Amount, @PaymentMethod, @CardNumber, @ExpiryDate, @CVV, @UPIID)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TransactionID", transactionID);
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@Amount", amount);
                    cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    cmd.Parameters.AddWithValue("@CardNumber", (object)cardNumber ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@ExpiryDate", (object)expiryDate ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@CVV", (object)cvv ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@UPIID", (object)upiID ?? DBNull.Value);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "Payment Successful! Transaction ID: " + transactionID;
            ClearFields();
            LoadPaymentGrid();
        }

        private void LoadPaymentGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 10 TransactionID, FullName, Email, Phone, Amount, PaymentMethod, PaymentDate FROM Payments ORDER BY PaymentID DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridViewPayments.DataSource = dt;
                        GridViewPayments.DataBind();
                    }
                }
            }
        }

        private void ClearFields()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAmount.Text = "";
            txtCardNumber.Text = "";
            txtExpiry.Text = "";
            txtCVV.Text = "";
            txtUPIID.Text = "";
            ddlPaymentMethod.SelectedIndex = 0;
        }

        private bool ValidatePayment()
        {
            if (string.IsNullOrWhiteSpace(txtFullName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text) ||
                string.IsNullOrWhiteSpace(txtAmount.Text) ||
                string.IsNullOrWhiteSpace(ddlPaymentMethod.SelectedValue))
            {
                return false;
            }

            if (!decimal.TryParse(txtAmount.Text, out decimal amount) || amount <= 0)
                return false;

            if (!System.Text.RegularExpressions.Regex.IsMatch(txtPhone.Text, @"^\d{10}$"))
                return false;

            if (!System.Text.RegularExpressions.Regex.IsMatch(txtEmail.Text, @"^[^\s@]+@[^\s@]+\.[^\s@]+$"))
                return false;

            if (ddlPaymentMethod.SelectedValue == "CreditCard")
            {
                if (string.IsNullOrWhiteSpace(txtCardNumber.Text) ||
                    string.IsNullOrWhiteSpace(txtExpiry.Text) ||
                    string.IsNullOrWhiteSpace(txtCVV.Text))
                    return false;

                if (!System.Text.RegularExpressions.Regex.IsMatch(txtCardNumber.Text, @"^\d{16}$"))
                    return false;

                if (!System.Text.RegularExpressions.Regex.IsMatch(txtCVV.Text, @"^\d{3}$"))
                    return false;
            }

            if (ddlPaymentMethod.SelectedValue == "UPI")
            {
                if (string.IsNullOrWhiteSpace(txtUPIID.Text))
                    return false;
            }

            return true;
        }

        protected void GridViewPayments_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewPayments.EditIndex = e.NewEditIndex;
            LoadPaymentGrid();
        }

        protected void GridViewPayments_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewPayments.EditIndex = -1;
            LoadPaymentGrid();
        }

        protected void GridViewPayments_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewPayments.EditIndex = -1;
            LoadPaymentGrid();
        }

        protected void GridViewPayments_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            LoadPaymentGrid();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string transactionID = btn.CommandArgument;
            ScriptManager.RegisterStartupScript(this, GetType(), "PrintTransaction", "window.open('PrintTransaction.aspx?TransactionID=" + transactionID + "', '_blank');", true);
        }
    }
}
