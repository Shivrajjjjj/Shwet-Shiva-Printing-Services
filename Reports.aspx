<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Reports" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Reports | Growth & Insights</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('business-growth.jpg') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }
        .overlay {
            background: rgba(0, 0, 0, 0.6);
            position: absolute;
            width: 100%;
            height: 100%;
        }
        .content {
            position: relative;
            max-width: 800px;
            z-index: 1;
        }
        h1 { font-size: 3em; margin-bottom: 10px; }
        p { font-size: 1.5em; line-height: 1.6; }
        .btn {
            background: #ff9800;
            color: white;
            padding: 15px 30px;
            font-size: 1.2em;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
        }
        .btn:hover { background: #e68900; }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="content">
        <h1>Our Growth & Business Insights</h1>
        <p>Shwet Shiva Printing Services & Mrityunjay Mudranalay has grown into a leading printing and publishing service, providing innovative solutions to businesses worldwide.</p>
        <p>With a steady annual growth of <strong>35%</strong> and a strong customer base, we continue to set new benchmarks in the industry.</p>
        <a href="Dashboard.aspx" class="btn">Explore More</a>
    </div>
</body>
</html>
