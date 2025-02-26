<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Dashboard" MasterPageFile="~/Site.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="dashboard-container container mt-5">
        <div class="header text-center mb-5">
            <h2 class="display-4 text-primary">Welcome to Your Dashboard!</h2>
            <p class="lead text-muted">Monitor the key performance indicators and trends of your business in real-time.</p>
        </div>

       
        <div class="row row-cols-1 row-cols-md-3 g-4">
          
            <div class="col">
                <div class="card shadow-lg rounded-lg bg-light">
                    <div class="card-header bg-primary text-white">
                        <h3 class="card-title"><i class="fas fa-users"></i> Total Clients</h3>
                    </div>
                    <div class="card-body text-center">
                        <p class="card-text text-muted">Serving businesses with premium printing solutions.</p>
                        <h2 class="display-4 text-primary">100+</h2>
                        <p class="text-muted">Growing trust across various industries.</p>
                    </div>
                   
                </div>
            </div>

           
            <div class="col">
                <div class="card shadow-lg rounded-lg bg-light">
                    <div class="card-header bg-success text-white">
                        <h3 class="card-title"><i class="fas fa-print"></i> Ongoing Printing Jobs</h3>
                    </div>
                    <div class="card-body text-center">
                        <p class="card-text text-muted">Live tracking of active printing orders.</p>
                        <h2 class="display-4 text-success">320+</h2>
                        <p class="text-muted">Ensuring timely completion with high quality.</p>
                    </div>
                    
                </div>
            </div>

            
            <div class="col">
                <div class="card shadow-lg rounded-lg bg-light">
                    <div class="card-header bg-warning text-dark">
                        <h3 class="card-title"><i class="fas fa-rupee-sign"></i> Monthly Revenue</h3>
                    </div>
                    <div class="card-body text-center">
                        <p class="card-text text-muted">Tracking financial growth from printing services.</p>
                        <h2 class="display-4 text-warning">₹2,50,000+</h2>
                        <p class="text-muted">Consistent growth with satisfied clients.</p>
                    </div>
                   
                </div>
            </div>
        </div>

       
        <div class="row row-cols-1 row-cols-md-3 g-4 mt-4">
           
            <div class="col">
                <div class="card shadow-lg rounded-lg bg-light">
                    <div class="card-header bg-secondary text-white">
                        <h3 class="card-title"><i class="fas fa-check-circle"></i> Completed Orders</h3>
                    </div>
                    <div class="card-body text-center">
                        <p class="card-text text-muted">Successful deliveries of customized print jobs.</p>
                        <h2 class="display-4 text-secondary">5,000+</h2>
                        <p class="text-muted">Timely execution and client satisfaction.</p>
                    </div>
                     <!--<div class="card-footer bg-transparent border-top text-muted">
                        <button class="btn btn-secondary btn-sm">View Details</button>
                    </div>-->
                </div>
            </div>

            
            <div class="col">
                <div class="card shadow-lg rounded-lg bg-light">
                    <div class="card-header bg-danger text-white">
                        <h3 class="card-title"><i class="fas fa-building"></i> Corporate Clients</h3>
                    </div>
                    <div class="card-body text-center">
                        <p class="card-text text-muted">Top enterprises relying on our printing solutions.</p>
                        <h2 class="display-4 text-danger">50+</h2>
                        <p class="text-muted">Serving industries across India.</p>
                    </div>
                    
                </div>
            </div>

            <div class="col">
                <div class="card shadow-lg rounded-lg bg-light">
                    <div class="card-header bg-info text-white">
                        <h3 class="card-title"><i class="fas fa-star"></i> Customer Satisfaction</h3>
                    </div>
                    <div class="card-body text-center">
                        <p class="card-text text-muted">Feedback based on quality and service experience.</p>
                        <h2 class="display-4 text-info">98.7%</h2>
                        <p class="text-muted">Positive ratings from returning customers.</p>
                    </div>
                    
                </div>
            </div>
        </div>

        <!-- Business Insights Section -->
        <div class="extra-info mt-5 bg-light p-4 rounded-lg shadow-lg">
            <h3 class="text-xl font-semibold text-primary"><i class="fas fa-lightbulb"></i> Business Insights</h3>
            <p class="text-muted">Gain deep insights into key aspects of our printing services, business growth, and customer engagement.</p>

            <!-- Data Visualization Section -->
            <div class="chart-placeholder bg-white p-4 mt-4 rounded-lg shadow-md text-center">
                <h4 class="text-lg font-semibold text-primary"><i class="fas fa-chart-line"></i> Sales Growth Trend</h4>
                <p class="text-muted">An interactive graph will be displayed here, showing revenue growth, order trends, and client retention.</p>
            </div>

            <!-- Notifications & Recent Activities -->
            <div class="notifications mt-4 bg-white p-4 rounded-lg shadow-md">
                <h4 class="text-lg font-semibold text-danger"><i class="fas fa-bell"></i> Recent Activities</h4>
                <ul class="mt-2 text-muted">
                    <li><i class="fas fa-box text-success"></i> <strong>New Order:</strong> 500 customized brochures for KBJS Pvt. Ltd.</li>
                    <li><i class="fas fa-comments text-primary"></i> <strong>Customer Feedback:</strong> "Excellent quality and timely delivery!" - Mr. Rajesh Mehta</li>
                    <li><i class="fas fa-rupee-sign text-warning"></i> <strong>Payment Update:</strong> ₹1,50,000 received for Order #INV-56789.</li>
                    <li><i class="fas fa-users text-secondary"></i> <strong>New Corporate Client:</strong> Partnership with ABC Industries for annual printing contracts.</li>
                    <li><i class="fas fa-truck text-orange"></i> <strong>Shipment Update:</strong> Bulk order dispatched to KOLHAPUR office.</li>
                </ul>
            </div>
        </div>
    </div>

    <script>
        // Sample JavaScript for interactive elements (optional for added functionality)
        document.querySelectorAll('.btn-sm').forEach(button => {
            button.addEventListener('click', function() {
                alert('More details coming soon!');
            });
        });
    </script>

</asp:Content>
