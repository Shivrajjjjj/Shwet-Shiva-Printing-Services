<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentReceipt.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.PaymentReceipt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Receipt</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .receipt-container { width: 80%; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 10px; }
        h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        .btn-download { display: block; width: 200px; margin: 20px auto; padding: 10px; text-align: center; background: #007bff; color: white; text-decoration: none; border-radius: 5px; }
        .message { color: red; text-align: center; }
    </style>
</head>
<body>
    <form runat="server">
        <div class="receipt-container">
            <h2>Payment Receipt</h2>
            
            <p class="message">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </p>

            <table>
                <tr>
                    <td><strong>Transaction ID:</strong></td>
                    <td><asp:Label ID="lblTransactionID" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><strong>Name:</strong></td>
                    <td><asp:Label ID="lblName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><strong>Email:</strong></td>
                    <td><asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><strong>Amount:</strong></td>
                    <td><asp:Label ID="lblAmount" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><strong>Payment Method:</strong></td>
                    <td><asp:Label ID="lblPaymentMethod" runat="server"></asp:Label></td>
                </tr>
            </table>

            <asp:Button ID="btnPrint" runat="server" Text="Download Receipt" CssClass="btn-download" OnClick="btnPrint_Click" />
        </div>

        <h2>Recent Payments</h2>
        <asp:GridView ID="GridViewPayments" runat="server" AutoGenerateColumns="False" CssClass="grid">
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" />
                <asp:BoundField DataField="PaymentDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
