using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewReview : System.Web.UI.Page
{
    SelectService.SelectServiceClient ssc = 
        new SelectService.SelectServiceClient();
    RegistrationService.LoginServiceClient lsc = 
        new RegistrationService.LoginServiceClient();
    //int bookKey=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["ReviewerKey"] != null)
        { 
            if (!IsPostBack)
            {
                PopulateBookTitleList();
                PopulateCategoryCheckList();
                PopulateAuthor();
                Panel1.Visible = false;
                Panel2.Visible = false;
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }

    protected void PopulateBookTitleList()
    {
        string[] titles = ssc.GetBooks();
        BookTitleDropDownList.DataSource = titles;
        BookTitleDropDownList.DataBind();
        BookTitleDropDownList.Items.Add("New Book");

    }

    protected void PopulateCategoryCheckList()
    {
        string[] categories = ssc.GetCategories();
        CategoriesCheckBoxList.DataSource = categories;
        CategoriesCheckBoxList.DataBind();

    }

    protected void PopulateAuthor()
    {
        String[] authors = ssc.GetAuthors();
        AuthorDropDownList.DataSource = authors;
        AuthorDropDownList.DataBind();
        AuthorDropDownList.Items.Add("New Author");
    }




    protected void BookTitleDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(BookTitleDropDownList.SelectedItem.Text.Equals("New Book"))
        {
            Panel1.Visible = true;
        }
    }

    protected void AuthorDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (AuthorDropDownList.SelectedItem.Text.Equals("New Author"))
        {
            Panel2.Visible = true;
        }

    }

  

    protected void AddBook()
    {
        RegistrationService.NewBook nb = new RegistrationService.NewBook();
        nb.Title = BookTitleTextBox.Text;
        nb.ISBN = ISBNTextBox.Text;

        string[] auth = new string[1];
        if (AuthorDropDownList.SelectedItem.Text.Equals("New Author"))
        {
            auth[0] = AuthorNameTextBox.Text;
        }
        else
        {
            auth[0] = AuthorDropDownList.SelectedItem.Text;
        }


        nb.Authors = auth;
        int number = 0;
        foreach (ListItem item in CategoriesCheckBoxList.Items)
        {
            if (item.Selected)
                number++;
        }

        string[] cats = new string[number];
        int counter = 0;
        foreach (ListItem item in CategoriesCheckBoxList.Items)
        {
            if (item.Selected)
                cats[counter] = item.Text;
        }

        nb.Categories = cats;

        lsc.AddBook(nb);

        //bookKey = lsc.GetBookKey(BookTitleTextBox.Text);

        PopulateAuthor();
        PopulateBookTitleList();


    }

    protected void SaveBookButton_Click(object sender, EventArgs e)
    {

        AddBook();

    }


    protected void AddAuthorButton_Click(object sender, EventArgs e)
    {
        lsc.AddAuthor(AuthorNameTextBox.Text);
    }

    protected void SaveReviewButton_Click(object sender, EventArgs e)
    {
        SaveReview();
    }

    protected void SaveReview()
    {
        string bookTitle = null;
        int rKey = (int)Session["ReviewerKey"];
        RegistrationService.NewReview nr = new RegistrationService.NewReview();
        if (BookTitleDropDownList.SelectedItem.Text == "New Book")
        {
            bookTitle = BookTitleTextBox.Text;
        }
        else
        {
            bookTitle = BookTitleDropDownList.SelectedItem.Text;
        }
        nr.BookTitle = bookTitle;
        nr.ReviewerKey = rKey;
        nr.ReviewTitle = ReviewTitleTextBox.Text;
        nr.Rating = int.Parse(RatingRadioButtonList.SelectedValue.ToString());
        nr.ReviewText = ReviewTextTextBox.Text;
        lsc.AddReview(nr);

        ResultLabel.Text = "The review has been saved";
        Panel2.Visible = false;
        Panel1.Visible = false;
    }
}