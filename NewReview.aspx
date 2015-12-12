<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewReview.aspx.cs" Inherits="NewReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1> Add A Review</h1>
        <hr />
        <p>
            <asp:DropDownList ID="BookTitleDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="BookTitleDropDownList_SelectedIndexChanged">
            </asp:DropDownList>
            </p>
        
        <asp:Panel ID="Panel1" runat="server">
            <hr/>
            <table id="NewBookTable"> 
                <tr>
                    <td>Book Title</td>
                    <td>
                        <asp:TextBox ID="BookTitleTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Book ISBN</td>
                    <td>
                        <asp:TextBox ID="ISBNTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Choose author(s)</td>
                    <td>
                        <asp:DropDownList ID="AuthorDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="AuthorDropDownList_SelectedIndexChanged" ></asp:DropDownList>
                        <asp:Panel ID="Panel2" runat="server">
                <p>Add author name  <asp:TextBox ID="AuthorNameTextBox" runat="server"></asp:TextBox><br />
                    <asp:Button ID="AddAuthorButton" runat="server" Text="Add" OnClick="AddAuthorButton_Click" />
                </p>
                
            </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>Select Catagories</td>
                    <td>
                        <asp:CheckBoxList ID="CategoriesCheckBoxList" 
                            runat="server" RepeatColumns="3">
                        </asp:CheckBoxList></td>
                </tr>
                 <tr>
                    <td>
                        <asp:Button ID="SaveBookButton" runat="server" Text="Save" OnClick="SaveBookButton_Click" /></td>
                    <td>
                        <asp:Label ID="ResultMessage" runat="server" Text="Label"></asp:Label>
                        </td>
                </tr>

            </table>
            
            <hr />
          </asp:Panel>
        <table>
            <tr>
                <td>Review Title</td>
                <td>
                    <asp:TextBox ID="ReviewTitleTextBox" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td>Rating</td>
                <td>
                    <asp:RadioButtonList ID="RatingRadioButtonList" runat="server">
                        <asp:ListItem Text="1" Value="1"/>
                        <asp:ListItem Text="2" Value="2"/>
                       <asp:ListItem Text="3" Value="3"/>
                        <asp:ListItem Text="4" Value="4"/>
                        <asp:ListItem Text="5" Value="5"/>
                    </asp:RadioButtonList> 
                 </td>
            </tr>
            <tr>
                <td colspan="2">Review Text</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="ReviewTextTextBox" runat="server"
                         TextMode="MultiLine" Rows="10" Columns="45"
                         Wrap="true" >
                    </asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="SaveReviewButton" runat="server" Text="Save Review" OnClick="SaveReviewButton_Click" />

                </td>
                <td>
                    <asp:Label ID="ResultLabel" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        

        
    </div>
    </form>
</body>
</html>
