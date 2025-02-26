<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full-screen">
        <h1 class="display-4 font-weight-bold">Welcome to Shwet Shiva Printing Services</h1>
        <p class="lead">Professional Printing & Design Solutions</p>
        <input type="text" id="serviceSearch" placeholder="Search our services..." class="form-control search-box mt-3" onkeyup="filterServices()">
    </div>

    <div class="container py-5"> 
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
            { category: 'printing', name: 'High-Quality Printing', description: 'Premium printing services with various paper options.' },
            { category: 'design', name: 'Custom Design', description: 'Unique business cards, flyers, and more.' },
            { category: 'printing', name: 'Binding & Finishing', description: 'Professional binding and finishing services.' },
            { category: 'design', name: 'Wedding Invitations', description: 'Traditional & modern wedding invitation designs.' },
            { category: 'design', name: 'Festival Greeting Cards', description: 'Diwali, Holi, Eid, and more festive cards.' },
            { category: 'printing', name: 'Screen Printing', description: 'Quality screen printing for fabrics and merchandise.' },
            { category: 'design', name: 'Corporate Branding', description: 'Logos, brochures, and corporate identity design.' },
            { category: 'printing', name: 'Photo Printing', description: 'High-resolution photo prints with vibrant colors.' },
            { category: 'printing', name: 'Custom Packaging', description: 'Personalized packaging for businesses.' },
            { category: 'printing', name: '3D Printing', description: 'Advanced 3D printing for prototypes and products.' },
            { category: 'printing', name: 'Offset Printing', description: 'Superior quality printing for bulk orders.' },
            { category: 'printing', name: 'T-Shirt Printing', description: 'Custom t-shirts with high-quality prints.' },
            { category: 'design', name: 'Embossing & Foiling', description: 'Luxury finishes for business cards and documents.' },
            { category: 'printing', name: 'Sticker Printing', description: 'Custom stickers for products and marketing.' },
            { category: 'printing', name: 'Canvas Printing', description: 'High-quality prints on canvas for art and decor.' },
            { category: 'printing', name: 'Magazine Printing', description: 'Full-color magazine and catalog printing.' },
            { category: 'printing', name: 'Event Banners', description: 'Large banners for exhibitions and events.' },
            { category: 'design', name: 'Personalized Gifts', description: 'Customized mugs, frames, and corporate gifts.' },
            { category: 'design', name: 'Calligraphy Services', description: 'Handwritten calligraphy for invitations and events.' },
            { category: 'printing', name: 'Wedding Photo Books', description: 'High-quality, personalized wedding photo albums.' },
            { category: 'design', name: 'Social Media Graphics', description: 'Custom graphics for social media branding.' },
            { category: 'printing', name: 'Promotional Posters', description: 'Large posters for marketing and branding.' }
        ];

        function renderServices() {
            let container = document.getElementById('servicesContainer');
            container.innerHTML = services.map(service => `
                <div class="col-md-4 service-item" data-category="${service.category}">
                    <div class="card service-card shadow-sm p-3">
                        <h3>${service.name}</h3>
                        <p>${service.description}</p>
                    </div>
                </div>
            `).join('');
        }

        function filterServices(category) {
            let input = document.getElementById("serviceSearch").value.toLowerCase();
            let services = document.getElementsByClassName("service-item");

            for (let i = 0; i < services.length; i++) {
                let text = services[i].innerText.toLowerCase();
                let categoryMatch = category === 'all' || services[i].getAttribute('data-category') === category;
                services[i].style.display = text.includes(input) && categoryMatch ? "block" : "none";
            }
        }

        document.addEventListener("DOMContentLoaded", renderServices);
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


