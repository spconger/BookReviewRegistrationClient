<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Review Registration</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Registration</h1>
        <p>You must register to enter reviews.</p>
        <table>
            <tr>
                <td>User name</td>
                <td>
                    <asp:TextBox ID="UserNameTextBox" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" 
                        runat="server" ErrorMessage="User Name is required" 
                        ControlToValidate="UserNameTextBox">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>First name</td>
                <td>
                    <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" 
                        runat="server" ErrorMessage="First Name is required" 
                        ControlToValidate="FirstNameTextBox">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Last name</td>
                <td>
                    <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox></td>
                 <td><asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" 
                        runat="server" ErrorMessage="Last Name is required" 
                        ControlToValidate="LastNameTextBox">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox></td>
                 <td><asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" 
                        runat="server" ErrorMessage="Email is required" 
                        ControlToValidate="EmailTextBox">
                    </asp:RequiredFieldValidator>

                     <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" 
                         runat="server" ErrorMessage="Not a valid email" 
                         ControlToValidate="EmailTextBox" 
                         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                     </asp:RegularExpressionValidator>
                 </td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox></td>
                 <td><asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" 
                        runat="server" ErrorMessage="Password is required" 
                        ControlToValidate="PasswordTextBox">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td>
                    <asp:TextBox ID="ConfirmTextBox" runat="server" TextMode="Password"></asp:TextBox></td>
                 <td>
                     <asp:RequiredFieldValidator ID="ConfirmRequiredFieldValidator" 
                        runat="server" ErrorMessage="Your must confirm your password" 
                        ControlToValidate="ConfirmTextBox">
                    </asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="PasswordCompareValidator" 
                         runat="server" ErrorMessage="passwords must match" 
                         ControlToValidate="ConfirmTextBox" 
                         ControlToCompare="PasswordTextBox" >
                     </asp:CompareValidator>

                 </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" /></td>
                <td>
                    <asp:Label ID="ErrorLabel" runat="server" Text=""></asp:Label></td>
                 <td></td>
                    
            </tr>
        </table>

    </div>
    </form>
</body>
</html>
