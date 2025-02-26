using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{
    public partial class PaymentReceipt : Page
    {
        private string connectionString = "your_connection_string_here"; // Replace with actual connection string

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecentPayments();
                string transactionID = Request.QueryString["TransactionID"];

                if (!string.IsNullOrEmpty(transactionID))
                {
                    FetchPaymentDetails(transactionID);
                }
            }
        }

        private void LoadRecentPayments()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 10 TransactionID, FullName, Email, Amount, PaymentMethod, PaymentDate FROM Payments ORDER BY PaymentDate DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewPayments.DataSource = dt;
                GridViewPayments.DataBind();
            }
        }

        private void FetchPaymentDetails(string transactionID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT TransactionID, FullName, Email, Amount, PaymentMethod FROM Payments WHERE TransactionID = @TransactionID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TransactionID", transactionID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblTransactionID.Text = reader["TransactionID"].ToString();
                    lblName.Text = reader["FullName"].ToString();
                    lblEmail.Text = reader["Email"].ToString();
                    lblAmount.Text = "₹" + reader["Amount"].ToString();
                    lblPaymentMethod.Text = reader["PaymentMethod"].ToString();
                    lblMessage.Text = "";
                }
                else
                {
                    lblMessage.Text = "❌ No receipt found for this Transaction ID.";
                }

                reader.Close();
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            GenerateImageReceipt();
        }

        private void GenerateImageReceipt()
        {
            int width = 600, height = 400;
            string fileName = "PaymentReceipt.png";
            string filePath = Server.MapPath("~/Receipts/") + fileName;

            if (!Directory.Exists(Server.MapPath("~/Receipts/")))
                Directory.CreateDirectory(Server.MapPath("~/Receipts/"));

            using (Bitmap bitmap = new Bitmap(width, height))
            using (Graphics g = Graphics.FromImage(bitmap))
            {
                g.Clear(Color.White);
                Font titleFont = new Font("Arial", 18, FontStyle.Bold);
                Font textFont = new Font("Arial", 12);
                Brush blackBrush = Brushes.Black;

                g.DrawString("Payment Receipt", titleFont, blackBrush, new PointF(200, 20));
                g.DrawString($"Transaction ID: {lblTransactionID.Text}", textFont, blackBrush, new PointF(50, 70));
                g.DrawString($"Name: {lblName.Text}", textFont, blackBrush, new PointF(50, 100));
                g.DrawString($"Email: {lblEmail.Text}", textFont, blackBrush, new PointF(50, 130));
                g.DrawString($"Amount: {lblAmount.Text}", textFont, blackBrush, new PointF(50, 160));
                g.DrawString($"Payment Method: {lblPaymentMethod.Text}", textFont, blackBrush, new PointF(50, 190));

                Font watermarkFont = new Font("Arial", 30, FontStyle.Bold);
                Brush watermarkBrush = new SolidBrush(Color.FromArgb(50, Color.Gray));
                g.TranslateTransform(200, 300);
                g.RotateTransform(-30);
                g.DrawString("Shwet Shiva Printing Services", watermarkFont, watermarkBrush, new PointF(0, 0));
                g.ResetTransform();

                bitmap.Save(filePath, ImageFormat.Png);
            }

            Response.ContentType = "image/png";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.TransmitFile(filePath);
            Response.End();
        }
    }
}
