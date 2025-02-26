<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center p-6 bg-gray-100 min-h-screen relative">
        
        <!-- Add to Cart Button at Top Left -->
       

        <!-- Title Section -->
        <h1 class="text-4xl font-bold text-blue-700">Our Products</h1>
        <p class="text-lg text-gray-600 mt-2">Explore our premium printing products and solutions</p>

        <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-6 mt-6 mx-auto max-w-6xl">
            
            <!-- Product 1 -->
            <div class="border p-6 text-center bg-white rounded-lg shadow-lg">
                <img src="images/1card.jpg" style="width: 349px; height: 370px;" class="w-full h-48 object-contain rounded-md" alt="Business Cards">
                <img src="images/2card.jpg" style="width: 349px; height: 370px;" />
                <h3 class="text-xl font-bold mt-2">Business Cards</h3>
                <p class="text-gray-600 mt-2">Premium quality business cards with custom design.</p>
                <form action="Cart.aspx" method="post">
                    <input type="hidden" name="productID" value="1">
                    <input type="hidden" name="productName" value="Business Cards">
                    <input type="hidden" name="price" value="500">
                    <input type="hidden" name="stock" value="100">
                   
                    
                </form>
            </div>

            <!-- Product 2 -->
            <div class="border p-6 text-center bg-white rounded-lg shadow-lg">
                <img src="images/broucher-500x500.jpg" style="width: 349px; height: 370px;"/><img src="images/brochure-designing-service2.jpg" style="width: 349px; height: 370px;" /><img src="images/brochure-designing-service.jpg" style="width: 349px; height: 370px;" class="w-full h-48 object-contain rounded-md" alt="Flyers & Brochures">
                <h3 class="text-xl font-bold mt-2">Flyers & Brochures</h3>
                <p class="text-gray-600 mt-2">Attractive flyers and brochures to promote your business.</p>
                <form action="Cart.aspx" method="post">
                    <input type="hidden" name="productID" value="2">
                    <input type="hidden" name="productName" value="Flyers & Brochures">
                    <input type="hidden" name="price" value="300">
                    <input type="hidden" name="stock" value="150">
                                       
                </form>
            </div>

            <!-- Product 3 -->
           <div class="border p-6 text-center bg-white rounded-lg shadow-lg"> 
    <div class="flex gap-2 justify-center items-end">
        <img src="images/8.png" class="object-contain rounded-md" style="width: 349px; height: 370px;">
        <img src="images/6.png" class="object-contain rounded-md" style="width: 349px; height: 376px;">
        <img src="images/2.png" class="object-contain rounded-md" style="width: 349px; height: 376px;">
    </div>

    <h3 class="text-xl font-bold mt-2">Book Printing</h3>
    <p class="text-gray-600 mt-2">Professional book printing with various binding options.</p>
    
    <form action="Cart.aspx" method="post">
        <input type="hidden" name="productID" value="3">
        <input type="hidden" name="productName" value="Book Printing">
        <input type="hidden" name="price" value="800">
        <input type="hidden" name="stock" value="50">
        
        
        
       
    </form>
</div>



            <!-- Product 4 -->
            <div class="border p-6 text-center bg-white rounded-lg shadow-lg">
                <div class="flex gap-2 justify-center items-end">
    <img src="images/Custom Packaging1.png" class="object-contain rounded-md" style="width: 349px; height: 370px;">
    <img src="images/Custom Packaging2.png" class="object-contain rounded-md" style="width: 349px; height: 376px;">
    <img src="images/Custom Packaging3.png" class="object-contain rounded-md" style="width: 349px; height: 376px;">
</div>
                <h3 class="text-xl font-bold mt-2">Custom Packaging</h3>
                <p class="text-gray-600 mt-2">Tailor-made packaging solutions for your brand.</p>
                <form action="Cart.aspx" method="post">
                    <input type="hidden" name="productID" value="4">
                    <input type="hidden" name="productName" value="Custom Packaging">
                    <input type="hidden" name="price" value="1000">
                    <input type="hidden" name="stock" value="200">
                   
                   
                </form>
            </div>

            <!-- Product 5 -->
            <div class="border p-6 text-center bg-white rounded-lg shadow-lg">
                 <img src="images/Black Minimalist 2025 Monthly Calendar.jpg" class="object-contain rounded-md" style="width: 345px; height: 365px;">
                <img src="images/Yellow Illustrative Calendar 2025 Calendar.jpg" style="width: 349px; height: 370px; class="w-full h-48 object-contain rounded-md" alt="Custom Calendars">
                <h3 class="text-xl font-bold mt-2">Custom Calendars</h3>
                <p class="text-gray-600 mt-2">Personalized calendars for businesses and personal use.</p>
                <form action="Cart.aspx" method="post">
                    <input type="hidden" name="productID" value="5">
                    <input type="hidden" name="productName" value="Custom Calendars">
                    <input type="hidden" name="price" value="200">
                    <input type="hidden" name="stock" value="500">
                   
                   
            </div>

            <!-- Product 6 -->
            <div class="border p-6 text-center bg-white rounded-lg shadow-lg">
                 <img src="images/1Posters.jpg" class="object-contain rounded-md" style="width: 349px; height: 370px;">
                 <img src="images/2Posters.jpg" class="object-contain rounded-md" style="width: 349px; height: 376px;">
                
                <h3 class="text-xl font-bold mt-2">Posters</h3>
                <p class="text-gray-600 mt-2">Eye-catching posters for events and advertising.</p>
                <form action="Cart.aspx" method="post">
                    <input type="hidden" name="productID" value="6">
                    <input type="hidden" name="productName" value="Posters">
                    <input type="hidden" name="price" value="400">
                    <input type="hidden" name="stock" value="300">
                                       
                </form>
            </div>

        </div>

        <!-- Contact Section -->
        <div class="mt-16 text-center p-6 bg-white rounded-lg shadow-lg w-full max-w-4xl mx-auto">
            <h2 class="text-3xl font-semibold">Need Custom Products?</h2>
            <p class="text-gray-600 mt-2">📧 Email: <strong>shivrajrandive1370@gmail.com</strong></p>
            <p class="text-gray-600">📞 Phone: <strong>9422620351</strong></p>
        </div>

    </div>
</asp:Content>
