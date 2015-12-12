using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        RegisterReviewer();
    }

    protected void RegisterReviewer()
    {
        RegistrationService.LoginServiceClient lsc = new RegistrationService.LoginServiceClient();
        RegistrationService.ReviewerLite rLite = new RegistrationService.ReviewerLite();
        rLite.ReviewerUserName = UserNameTextBox.Text;
        rLite.ReviewerFirstName = FirstNameTextBox.Text;
        rLite.ReviewerLastName = LastNameTextBox.Text;
        rLite.ReviewerEmail = EmailTextBox.Text;
        rLite.ReviewerPassword = ConfirmTextBox.Text;

        try
        {
            int result = lsc.ReviewerRegistration(rLite);
            if (result == 1)
                Response.Redirect("Login.aspx");
            else
                ErrorLabel.Text = "Registration not processed";
        }
        catch (Exception ex)
        {
            ErrorLabel.Text = ex.Message;
        }


    }
}