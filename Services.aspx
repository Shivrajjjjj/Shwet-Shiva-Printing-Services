<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5 text-center min-vh-100" style="background: linear-gradient(135deg, #f5f7fa, #c3cfe2);">
            <div class="mt-5 p-4 bg-white shadow-lg rounded text-center w-75 mx-auto animate__animated animate__fadeInUp">
        <h2 class="fw-semibold">Need a Custom Service?</h2>
        <p class="text-muted">📧 Email: <strong>shivrajrandive1370@gmail.com</strong></p>
        <p class="text-muted">📞 Phone: <strong>9422620351</strong></p>
    </div>
</div>
         <div class="container py-6"> 
     <h2 class="text-center mb-4">Our Services</h2>

     <!-- Filter Buttons -->
     <div class="text-center filter-buttons mb-4">
         <button class="btn btn-primary" onclick="filterServices('all')">All</button>
         <button class="btn btn-secondary" onclick="filterServices('design')">Design</button>
         <button class="btn btn-secondary" onclick="filterServices('printing')">Printing</button>
     </div>

     <!-- Dynamic Service List -->
     <div class="row text-center" id="servicesContainer"></div>
 </div>

<script>
    const services = [
        { title: "Business Card Design", category: "design", description: "Custom business card designs to make a lasting impression." },
        { title: "Flyer Design", category: "design", description: "Eye-catching flyer designs for promotions and events." },
        { title: "Brochure Design", category: "design", description: "Professionally crafted brochures for your business needs." },
        { title: "Logo Design", category: "design", description: "Unique and memorable logos tailored to your brand." },
        { title: "Poster Design", category: "design", description: "High-quality poster designs for advertising and marketing." },
        { title: "Banner Design", category: "design", description: "Creative banners for online and offline promotions." },
        { title: "Book Cover Design", category: "design", description: "Attractive book cover designs to grab attention." },
        { title: "Packaging Design", category: "design", description: "Customized packaging designs to enhance product appeal." },
        { title: "Invitation Card Design", category: "design", description: "Beautiful invitations for weddings and events." },
        { title: "Magazine Design", category: "design", description: "Stylish magazine layouts and cover designs." },
        { title: "Newsletter Design", category: "design", description: "Engaging newsletter templates for businesses." },
        { title: "Infographic Design", category: "design", description: "Data-driven infographic designs for presentations." },
        { title: "CD/DVD Cover Design", category: "design", description: "Creative CD/DVD covers for branding and sales." },
        { title: "Menu Card Design", category: "design", description: "Professional menu designs for restaurants and cafes." },
        { title: "Annual Report Design", category: "design", description: "Corporate annual report designs for professional presentation." },
        { title: "Resume Design", category: "design", description: "Custom resume templates to enhance your job applications." },
        { title: "Packaging Label Design", category: "design", description: "Unique labels for product packaging." },
        { title: "Custom Illustration", category: "design", description: "Hand-crafted illustrations for various design needs." },
        { title: "Social Media Post Design", category: "design", description: "Creative posts for social media marketing." },
        { title: "High-Quality Printing", category: "printing", description: "Premium printing services with various paper options." },
        { title: "Custom Posters Printing", category: "printing", description: "Large format posters printed with high resolution." },
        { title: "Brochure Printing", category: "printing", description: "Quality brochure printing with different fold options." },
        { title: "Flyer Printing", category: "printing", description: "Bulk flyer printing for promotions and events." },
        { title: "Book Printing", category: "printing", description: "Custom book printing with perfect binding options." },
        { title: "Magazine Printing", category: "printing", description: "High-quality magazine printing with vibrant colors." },
        { title: "Wedding Invitation Printing", category: "printing", description: "Elegant wedding invitations printed with care." },
        { title: "Greeting Card Printing", category: "printing", description: "Custom greeting card printing for all occasions." },
        { title: "Sticker Printing", category: "printing", description: "Custom sticker printing in different shapes and sizes." },
        { title: "Banner Printing", category: "printing", description: "Durable banners printed for outdoor and indoor use." },
        { title: "Packaging Printing", category: "printing", description: "Custom packaging printing for product branding." },
        { title: "ID Card Printing", category: "printing", description: "Personalized ID cards printed for employees and students." },
        { title: "Calendar Printing", category: "printing", description: "Custom calendar printing for businesses and gifts." },
        { title: "Embossing & Debossing", category: "printing", description: "Raised or recessed designs for a premium feel." },
        { title: "Gold & Silver Foiling", category: "printing", description: "Premium foil stamping for elegant prints." },
        { title: "UV Spot Printing", category: "printing", description: "Enhance your designs with UV spot printing." },
        { title: "Spiral Binding", category: "printing", description: "Durable and cost-effective spiral binding for documents." },
        { title: "Hardbound Binding", category: "printing", description: "Premium hardbound book binding services." },
        { title: "Certificate Printing", category: "printing", description: "Custom certificate printing for schools and businesses." },
        { title: "Canvas Printing", category: "printing", description: "Custom canvas prints for home and office decor." },
        { title: "Letterhead Printing", category: "printing", description: "Professional letterhead printing for business use." },
        { title: "Notepad Printing", category: "printing", description: "Custom notepad printing with branding." },
        { title: "Tent Card Printing", category: "printing", description: "High-quality tent card printing for marketing." },
        { title: "Paper Bag Printing", category: "printing", description: "Eco-friendly paper bag printing for businesses." },
    ];

    function filterServices(category) {
        const container = document.getElementById('servicesContainer');
        container.innerHTML = '';
        const filteredServices = category === 'all' ? services : services.filter(service => service.category === category);
        filteredServices.forEach(service => {
            const serviceDiv = document.createElement('div');
            serviceDiv.className = 'col-md-4 mb-4';
            serviceDiv.innerHTML = `
                <div class="card shadow-lg border-0 service-card">
                    <div class="card-body text-center">
                        <h5 class="card-title fw-bold">${service.title}</h5>
                        <p class="card-text text-muted">${service.description}</p>
                    </div>
                </div>
            `;
            container.appendChild(serviceDiv);
        });
    }

    window.onload = () => filterServices('all');

        function showDetails(title, description) {
            document.getElementById('serviceModalLabel').innerText = title;
            document.getElementById('serviceDescription').innerText = description;
            var modal = new bootstrap.Modal(document.getElementById('serviceModal'));
            modal.show();
        }
    </script>
    
    <style>
     .full-screen {
         height: 500px;
         display: flex;
         flex-direction: column;
         justify-content: center;
         align-items: center;
         background: linear-gradient(to right, #4facfe, #00f2fe);
         color: white;
         text-align: center;
         padding: 40px;
     }

     .search-box {
         width: 50%;
         padding: 10px;
         border-radius: 5px;
         border: 1px solid #ddd;
     }

     .service-card {
         transition: transform 0.3s ease, box-shadow 0.3s ease;
         cursor: pointer;
         border-radius: 10px;
         padding: 20px;
         background: #fff;
     }

     .service-card:hover {
         transform: translateY(-5px);
         box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
     }

     .filter-buttons .btn {
         margin: 5px;
         transition: background-color 0.3s ease;
     }

     .filter-buttons .btn:hover {
         background-color: #0056b3;
         color: white;
     }

     .row {
         display: flex;
         flex-wrap: wrap;
         justify-content: center;
         gap: 15px;
     }

     .service-item {
         flex: 1 1 calc(33.333% - 20px);
         max-width: calc(33.333% - 20px);
     }

     @media (max-width: 768px) {
         .service-item {
             flex: 1 1 calc(50% - 20px);
             max-width: calc(50% - 20px);
         }
     }

     @media (max-width: 576px) {
         .service-item {
             flex: 1 1 100%;
             max-width: 100%;
         }
     }
 </style>
</asp:Content>

