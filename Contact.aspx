<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Include Bootstrap and jQuery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <div class="container py-5">
        <div class="text-center">
            <h1 class="text-primary font-weight-bold">Contact Us</h1>
            <p class="text-muted">We're here to assist you with all your printing and design needs.</p>
        </div>

        <!-- Contact Info Section -->
        <div class="row justify-content-center mt-4">
            <div class="col-md-6 text-center">
                <p>📧 Email: <a href="mailto:shivrajrandive1370@gmail.com" class="text-primary font-weight-bold">shivrajrandive1370@gmail.com</a></p>
                <p>📞 Phone: <a href="tel:+919422620351" class="text-primary font-weight-bold">9422620351</a></p>
            </div>
        </div>

        <!-- Contact Form Section -->
        <div class="row justify-content-center mt-4">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-body">
                        <h2 class="text-center text-primary">Send Us a Message</h2>
                        <form id="contactForm" runat="server" class="needs-validation" novalidate>
                            <div class="form-group">
                                <label>Full Name:</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter your name.</div>
                            </div>

                            <div class="form-group">
                                <label>Email Address:</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter a valid email.</div>
                            </div>

                            <div class="form-group">
                                <label>Your Message:</label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Write your message here..." required></asp:TextBox>
                                <div class="invalid-feedback">Please enter a message.</div>
                            </div>

                            <div class="text-center">
                                <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn btn-primary btn-block font-weight-bold py-2" OnClick="btnSubmit_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Advertisement Space -->
        <div class="text-center mt-5">
            <h2 class="font-weight-bold">Sponsored Ad</h2>
            <div class="bg-light p-4 rounded shadow-sm mx-auto" style="max-width: 400px;">
                <p class="text-muted">Your ad could be here! Contact us for advertising opportunities.</p>
            </div>
        </div>

        <!-- Google Maps Section -->
        <div class="mt-5 text-center">
            <h2 class="font-weight-bold">Find Us</h2>
            <p class="text-muted">Visit our office for personalized support.</p>
           <div class="embed-responsive embed-responsive-16by9 mt-3">
    <iframe class="embed-responsive-item rounded shadow-sm"
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3820.8885499175103!2d74.24197497461333!3d16.732411821344158!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc101cd9333fd05%3A0x853695fb1e1e83ba!2sSHWET%20SHIVA%20PRINTING%20SERVICES!5e0!3m2!1sen!2sin!4v1740557399644!5m2!1sen!2sin"
        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
    </iframe>
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
