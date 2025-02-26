<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Gallery" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Gallery Section -->
    <div class="gallery-container">
        <div class="header">
            <h2>Our Gallery</h2>
            <p>Explore our collection of images showcasing our work and services.</p>
        </div>

        <div class="gallery-grid">
            <!-- Example Images -->
            <div class="gallery-item">
                <a href="#" class="gallery-link" onclick="openModal('5Posters.jpg')">
                    <img src="images/5Posters.jpg" alt="Image 1" class="gallery-image"/>
                </a>
            </div>
            <div class="gallery-item">
                <a href="#" class="gallery-link" onclick="openModal('6.png')">
                    <img src="images/6.png" alt="Image 2" class="gallery-image"/>
                </a>
            </div>
            <div class="gallery-item">
                <a href="#" class="gallery-link" onclick="openModal('v1.png')">
                    <img src="images/v1.png" alt="Image 3" class="gallery-image"/>
                </a>
            </div>
            <div class="gallery-item">
                <a href="#" class="gallery-link" onclick="openModal('Pink Simple Wedding Invitation Card.jpg')">
                    <img src="images/Pink Simple Wedding Invitation Card.jpg" alt="Image 4" class="gallery-image"/>
                </a>
            </div>
            <div class="gallery-item">
     <a href="#" class="gallery-link" onclick="openModal('Custom Packaging1.png')">
         <img src="images/Custom Packaging1.png" alt="Image 1" class="gallery-image"/>
     </a>
 </div>
 <div class="gallery-item">
     <a href="#" class="gallery-link" onclick="openModal('4Posters.jpg')">
         <img src="images/4Posters.jpg" alt="Image 2" class="gallery-image"/>
     </a>
 </div>
 <div class="gallery-item">
     <a href="#" class="gallery-link" onclick="openModal('1card.jpg')">
         <img src="images/1card.jpg" alt="Image 3" class="gallery-image"/>
     </a>
 </div>
 <div class="gallery-item">
     <a href="#" class="gallery-link" onclick="openModal('2Posters.jpg')">
         <img src="images/2Posters.jpg" alt="Image 4" class="gallery-image"/>
     </a>
 </div>
        </div>

        <!-- Modal for Viewing Larger Image -->
        <div id="imageModal" class="modal">
            <span class="close" onclick="closeModal()">&times;</span>
            <img class="modal-content" id="modalImage">
            <div id="caption"></div>
        </div>
    </div>

    <!-- Additional Styling -->
    <style>
        /* Gallery Container */
        .gallery-container {
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            max-width: 1200px;
            margin: 40px auto;
        }

        .header h2 {
            font-size: 32px;
            color: #333;
            font-weight: 600;
        }

        .header p {
            font-size: 18px;
            color: #777;
        }

        /* Gallery Grid */
        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .gallery-item {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
        }

        .gallery-image {
            width: 100%;
            height: auto;
            transition: transform 0.3s ease-in-out;
            cursor: pointer;
            border-radius: 8px;
        }

        .gallery-image:hover {
            transform: scale(1.1);
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .modal-content {
            width: 80%;
            max-width: 700px;
            margin: 20px auto;
        }

        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #fff;
            font-size: 40px;
            font-weight: bold;
            cursor: pointer;
        }

        /* Caption */
        #caption {
            margin-top: 15px;
            font-size: 18px;
            color: #fff;
        }
    </style>

    <!-- Modal JavaScript -->
    <script>
        // Open modal with larger image
        function openModal(imageSrc) {
            var modal = document.getElementById('imageModal');
            var modalImg = document.getElementById("modalImage");
            var captionText = document.getElementById("caption");

            modal.style.display = "flex";
            modalImg.src = "images/" + imageSrc;
            captionText.innerHTML = imageSrc;
        }

        // Close modal
        function closeModal() {
            var modal = document.getElementById('imageModal');
            modal.style.display = "none";
        }
    </script>
</asp:Content>
