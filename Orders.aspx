<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Orders" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-table {
            width: 100%;
            max-width: 600px;
            margin: auto;
            border-collapse: collapse;
        }

        .form-table td {
            padding: 8px;
        }

        .form-table label {
            font-weight: bold;
        }

        .form-container {
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            color: red;
            font-size: 14px;
        }

        /* Custom Background Color */
        body {
            background-color: #f0f8ff;
        }

        .header-text {
            text-align: center;
            margin-bottom: 20px;
        }

        .container-fluid {
            padding-top: 30px;
        }

        .form-container {
            background-color: #fff;
        }

        .form-table td input {
            width: 100%;
        }
    </style>

    <script>
        function validateForm() {
            let isValid = true;
            let errorMessage = "";

            let productName = document.getElementById('<%= txtProductServiceName.ClientID %>').value.trim();
            let itemID = document.getElementById('<%= txtItemID.ClientID %>').value.trim();
            let quantity = document.getElementById('<%= txtTotalQuantity.ClientID %>').value.trim();
            let fullName = document.getElementById('<%= txtFullName.ClientID %>').value.trim();
            let email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
            let phone = document.getElementById('<%= txtPhone.ClientID %>').value.trim();
            let address = document.getElementById('<%= txtAddress.ClientID %>').value.trim();

            if (productName === "" || itemID === "" || quantity === "" || fullName === "" || email === "" || phone === "" || address === "") {
                errorMessage = "All fields are required!";
                isValid = false;
            } else if (isNaN(quantity) || quantity <= 0) {
                errorMessage = "Total Quantity must be a valid number!";
                isValid = false;
            } else if (!/^\d{10}$/.test(phone)) {
                errorMessage = "Phone number must be 10 digits!";
                isValid = false;
            } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                errorMessage = "Invalid email format!";
                isValid = false;
            }

            document.getElementById("error-message").innerText = errorMessage;
            return isValid;
        }
    </script>

    <form runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Form Container -->
                <div class="col-md-8 offset-md-2 form-container">
                    <h2 class="header-text">Manage Orders</h2>

                    <table class="form-table">
                        <tr>
                            <td><label>Product/Service Name:</label></td>
                            <td><asp:TextBox ID="txtProductServiceName" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Item ID:</label></td>
                            <td><asp:TextBox ID="txtItemID" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Total Quantity:</label></td>
                            <td><asp:TextBox ID="txtTotalQuantity" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Full Name:</label></td>
                            <td><asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Email:</label></td>
                            <td><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Phone:</label></td>
                            <td><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Address:</label></td>
                            <td><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <asp:Button ID="btnAddOrder" runat="server" Text="Add Order" CssClass="btn btn-primary mt-2" OnClientClick="return validateForm();" OnClick="btnAddOrder_Click" />
                            </td>
                        </tr>
                    </table>

                    <p id="error-message" class="error-message" style="text-align: center;"></p>
                </div>
            </div>

            <hr>

            <!-- Orders Table -->
            <h3 class="header-text">Orders List</h3>
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                        OnRowEditing="gvOrders_RowEditing" OnRowUpdating="gvOrders_RowUpdating"
                        OnRowCancelingEdit="gvOrders_RowCancelingEdit" OnRowDeleting="gvOrders_RowDeleting"
                        DataKeyNames="OrderID">
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="True" />

                            <asp:TemplateField HeaderText="Product/Service">
                                <ItemTemplate>
                                    <%# Eval("ProductOrServiceName") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtProductOrServiceName" runat="server" Text='<%# Bind("ProductOrServiceName") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Item ID">
                                <ItemTemplate>
                                    <%# Eval("ItemID") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtItemID" runat="server" Text='<%# Bind("ItemID") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Total Quantity">
                                <ItemTemplate>
                                    <%# Eval("TotalQuantity") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTotalQuantity" runat="server" Text='<%# Bind("TotalQuantity") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Full Name">
                                <ItemTemplate>
                                    <%# Eval("FullName") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtFullName" runat="server" Text='<%# Bind("FullName") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <%# Eval("Email") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Phone">
                                <ItemTemplate>
                                    <%# Eval("Phone") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <%# Eval("Address") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <%# Eval("Status") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

