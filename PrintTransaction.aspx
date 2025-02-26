<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintTransaction.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.PrintTransaction" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Print Transaction</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            background: white;
            padding: 20px;
            width: 80%;
            max-width: 800px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .logo {
            width: 150px;
            margin-bottom: 20px;
        }
        .info {
            text-align: left;
            margin-top: 20px;
        }
        .info p {
            margin: 5px 0;
        }
        .contact {
            margin-top: 20px;
        }
        .contact a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .print-btn {
            margin-top: 20px;
            padding: 10px 20px;
            background: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        .print-btn:hover {
            background: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="images/1321.png" alt="Printing Services" class="logo">
        <h2>Transaction Receipt</h2>
        
        <div class="info">
            <p><strong>Transaction ID:</strong> <asp:Label ID="lblTransactionID" runat="server" /></p>
            <p><strong>Full Name:</strong> <asp:Label ID="lblFullName" runat="server" /></p>
            <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
            <p><strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server" /></p>
            <p><strong>Amount Paid:</strong> ₹<asp:Label ID="lblAmount" runat="server" /></p>
            <p><strong>Payment Method:</strong> <asp:Label ID="lblPaymentMethod" runat="server" /></p>
            <p><strong>Payment Date:</strong> <asp:Label ID="lblPaymentDate" runat="server" /></p>
        </div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>


        <!-- Contact Info -->
        <div class="contact">
            <p>📧 Email: <a href="mailto:shivrajrandive1370@gmail.com">shivrajrandive1370@gmail.com</a></p>
            <p>📞 Phone: <a href="tel:+919422620351">9422620351</a></p>
        </div>

        <button class="print-btn" onclick="window.print()">Print Receipt</button>
    </div>
</body>
</html>
