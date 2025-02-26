<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Feedback" MasterPageFile="~/Site.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        body {
            background-color: #f4f7f6;
        }
        .card {
            background-color: #ffffff;
            border-radius: 10px;
        }
        .card-header {
            background-color: #28a745;
            color: white;
            border-radius: 10px 10px 0 0;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
            border-radius: 5px;
        }
        .form-group label {
            font-weight: bold;
        }
    </style>

    <!-- Feedback Form Section -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 col-sm-12">
                <div class="card p-4 shadow-sm">
                    <div class="card-header text-center">
                        <h2>We Value Your Feedback</h2>
                        <p>Your feedback helps us improve our services and provide better experiences. Please let us know what you think!</p>
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Leave Your Feedback</h3>
                        <form id="feedbackForm" runat="server" class="needs-validation" novalidate>
                            <div class="form-group">
                                <label for="Name">Your Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter your name.</div>
                            </div>
                            <div class="form-group">
                                <label for="Email">Your Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter a valid email.</div>
                            </div>
                            <div class="form-group">
                                <label for="Feedback">Your Feedback</label>
                                <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Write your feedback here..." required rows="5"></asp:TextBox>
                                <div class="invalid-feedback">Please enter your feedback.</div>
                            </div>
                            <div class="text-center">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="btn btn-success btn-lg" OnClick="btnSubmit_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Display Previous Feedback Section -->
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 col-sm-12">
                <div class="card p-4 shadow-sm">
                    <h3 class="text-center">Recent Feedback</h3>
                    <asp:Literal ID="feedbackList" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript for Form Validation -->
    <script>
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                var forms = document.getElementsByClassName('needs-validation');
                Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</asp:Content>

