<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay.Settings" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- The single Form tag that wraps the entire page content -->
    <form id="settingsForm" runat="server">
        <!-- Settings Section -->
        <div class="settings-container">
            <div class="header">
                <h2>User Settings</h2>
                <p>Update your preferences and manage your account settings.</p>
            </div>

            <!-- Profile Settings Section -->
            <div class="settings-section">
                <h3>Profile Settings</h3>
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" class="input-field" placeholder="Enter your username" />
                </div>
                <div class="input-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" class="input-field" placeholder="Enter your email" />
                </div>
                <div class="input-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" class="input-field" placeholder="Enter your phone number" />
                </div>
                <button type="submit" class="save-btn">Save Changes</button>
            </div>

            <!-- Security Settings Section -->
            <div class="settings-section">
                <h3>Security Settings</h3>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="input-field" placeholder="Enter a new password" />
                </div>
                <div class="input-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="input-field" placeholder="Re-enter password" />
                </div>
                <div class="checkbox-group">
                    <label>
                        <input type="checkbox" id="twoFactorAuth" name="twoFactorAuth" />
                        Enable Two-Factor Authentication
                    </label>
                </div>
                <button type="submit" class="save-btn">Save Changes</button>
            </div>

            <!-- Notification Settings Section -->
            <div class="settings-section">
                <h3>Notification Settings</h3>
                <div class="checkbox-group">
                    <label>
                        <input type="checkbox" id="emailNotifications" name="emailNotifications" checked />
                        Receive Email Notifications
                    </label>
                </div>
                <div class="checkbox-group">
                    <label>
                        <input type="checkbox" id="smsNotifications" name="smsNotifications" checked />
                        Receive SMS Notifications
                    </label>
                </div>
                <div class="checkbox-group">
                    <label>
                        <input type="checkbox" id="pushNotifications" name="pushNotifications" />
                        Enable Push Notifications
                    </label>
                </div>
                <button type="submit" class="save-btn">Save Changes</button>
            </div>
        </div>
    </form>
    <!-- Additional Styling -->
    <style>
        /* Main Settings Container */
        .settings-container {
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            margin-top: 40px;
            max-width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        .header h2 {
            font-size: 32px;
            color: #333;
            font-weight: 600;
        }

        .header p {
            color: #777;
            font-size: 18px;
        }

        /* Settings Section */
        .settings-section {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .settings-section h3 {
            font-size: 24px;
            color: #333;
            font-weight: 600;
        }

        /* Input Fields */
        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            font-size: 16px;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }

        .checkbox-group {
            margin-bottom: 20px;
        }

        .checkbox-group label {
            font-size: 16px;
            color: #555;
        }

        /* Save Button */
        .save-btn {
            background-color: #27ae60;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .save-btn:hover {
            background-color: #2ecc71;
        }
    </style>
</asp:Content>
