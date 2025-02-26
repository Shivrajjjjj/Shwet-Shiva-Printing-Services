<%@ Page Title="Payments" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Payments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .form-table {
            width: 100%;
            border-collapse: collapse;
        }
        .form-table td {
            padding: 8px;
        }
        .hidden {
            display: none;
        }
        .error-message {
            color: red;
            font-size: 14px;
        }
    </style>

    <script>
        function togglePaymentFields() {
            let method = document.getElementById('<%= ddlPaymentMethod.ClientID %>').value;
            document.getElementById("cardDetails").classList.toggle("hidden", method !== "CreditCard");
            document.getElementById("upiDetails").classList.toggle("hidden", method !== "UPI");
        }
    </script>
    <form id="form1" runat="server">
    <div class="form-container">
        <h2>Make a Payment</h2>

        <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>

        <table class="form-table">
            <tr>
                <td>Full Name:</td>
                <td><asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td><asp:TextBox ID="txtAmount" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Payment Method:</td>
                <td>
                    <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="form-control" AutoPostBack="false" onchange="togglePaymentFields();">
                        <asp:ListItem Text="Select" Value="" />
                        <asp:ListItem Text="Credit Card" Value="CreditCard" />
                        <asp:ListItem Text="UPI" Value="UPI" />
                        <asp:ListItem Text="PayPal" Value="PayPal" />
                    </asp:DropDownList>
                </td>
            </tr>

            <tbody id="cardDetails" class="hidden">
                <tr>
                    <td>Card Number:</td>
                    <td><asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Expiry Date:</td>
                    <td><asp:TextBox ID="txtExpiry" runat="server" CssClass="form-control" placeholder="MM/YY"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>CVV:</td>
                    <td><asp:TextBox ID="txtCVV" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
            </tbody>

            <tbody id="upiDetails" class="hidden">
                <tr>
                    <td>UPI ID:</td>
                    <td><asp:TextBox ID="txtUPIID" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
            </tbody>

            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="btn btn-success mt-2" OnClick="btnPay_Click" />
                </td>
            </tr>
        </table>
    </div>

    <h2>Recent Transactions</h2>
        <center>
    <asp:GridView ID="GridViewPayments" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="TransactionID" OnRowEditing="GridViewPayments_RowEditing" OnRowUpdating="GridViewPayments_RowUpdating" OnRowCancelingEdit="GridViewPayments_RowCancelingEdit" OnRowDeleting="GridViewPayments_RowDeleting">
        <Columns>
            <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" ReadOnly="True" />
            <asp:BoundField DataField="FullName" HeaderText="Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="₹{0:F2}" />
            <asp:BoundField DataField="PaymentMethod" HeaderText="Method" />
            <asp:BoundField DataField="PaymentDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            <asp:TemplateField HeaderText="Print">
                <ItemTemplate>
                    <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-primary" OnClick="btnPrint_Click" CommandArgument='<%# Eval("TransactionID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </center>
    </form>
</asp:Content>
