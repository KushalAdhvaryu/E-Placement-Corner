using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_news : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
        Panel_update.Visible = false;
    }

    private void bind()
    {
        var cc = from p in db.news_latests

                 select new
                 {
                     p.news_id,
                     p.news_link,
                     p.news_details
                 };
        GridView_news.DataSource = cc;
        GridView_news.DataBind();
    }
    protected void Add_news_Click(object sender, ImageClickEventArgs e)
    {
        news_latest nl = new news_latest();
        nl.news_details = News_details.Text;
        nl.news_link = TextBox_link.Text;

       
        db.news_latests.InsertOnSubmit(nl);
        db.SubmitChanges();
        bind();
        Response.Write("<Script>alert('added Successfully')</Script>");  

    }
    protected void GridView_news_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            Panel_update.Visible = true;
            Panel_add.Visible = false;
            HiddenField_news.Value = e.CommandArgument.ToString();

            var up = from p in db.news_latests
                     where p.news_id == Convert.ToInt32(HiddenField_news.Value)
                     select p;
            TextBox_edit_link.Text = up.First().news_link;
            TextBox_edit_detail.Text = up.First().news_details;
        }

        if (e.CommandName == "del_st")
        {
            news_latest dl = db.news_latests.First(p => p.news_id == Convert.ToInt32(e.CommandArgument));
         

            db.news_latests.DeleteOnSubmit(dl);
           

            db.SubmitChanges();

            Response.Write("<Script>alert('Deleted Successfully')</Script>");
            bind();
        }
    }
    protected void ImageButton_update_Click(object sender, ImageClickEventArgs e)
    {
        news_latest nl = db.news_latests.First(p => p.news_id == Convert.ToInt32(HiddenField_news.Value));
        nl.news_link = TextBox_edit_link.Text;
        nl.news_details = TextBox_edit_detail.Text;
        db.SubmitChanges();
        Response.Write("<Script>alert('Updated Successfully')</Script>");
        bind();

        Panel_update.Visible = false;
        Panel_add.Visible = true;
    }
    protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox_search.Text == "")
        {
            Response.Write("<Script>alert('Please first enter the news details that you want to search')</Script>");
            Response.Redirect("Admin_news.aspx");
        }
        else
        {
            var sc = from p in db.news_latests
                     where (p.news_details.Contains(TextBox_search.Text))
                     // where (p.state_name.StartsWith(TextBox_search.Text))
                     select new
                     {
                         p.news_id,
                         p.news_link,
                         p.news_details

                     };

            GridView_news.DataSource = sc;
            GridView_news.DataBind();
            ImageButton_clear.Visible = true;
        }
    }
    protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_news.aspx");
    }
}