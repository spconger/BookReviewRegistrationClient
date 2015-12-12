using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        ReviewerLogin();
    }

    protected void ReviewerLogin()
    {
        RegistrationService.LoginServiceClient lsc = 
            new RegistrationService.LoginServiceClient();
        int key = lsc.ReviewerLogin(UserNameTextBox.Text, PasswordTextBox.Text);
        if (key != 0)
        {
            Session["ReviewerKey"] = key;
            Response.Redirect("NewReview.aspx");
        }
            
        else
            ResultLabel.Text = "Invalid Login";

    }

}