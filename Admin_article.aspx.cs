using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_article : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }

    }

    private void bind()
    {
        var cc = from p in db.experiences

                 select new
                 {
                     p.expid,
                     p.experince,
                     p.title,
                     p.name,
                     p.dt_time

                 };

        GridView_article.DataSource = cc;
        GridView_article.DataBind();
        
    }
    protected void GridView_article_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "comment_st")
        {
            MultiView_article.ActiveViewIndex = 1;
            HiddenField_cmt.Value = e.CommandArgument.ToString();

            var up = from p in db.experiences
                     where p.expid == Convert.ToInt32(HiddenField_cmt.Value)
                     select p;
            Label_name.Text = up.First().name;
            Label_timestamp.Text = up.First().dt_time.ToString();
            Label_title.Text = up.First().title;
            Label_experince.Text = up.First().experince;
            bind_comment();


        }
        if (e.CommandName == "edit_st")
        {
            MultiView_article.ActiveViewIndex = 2;
            HiddenField_exp.Value = e.CommandArgument.ToString();

            var up = from p in db.experiences
                     where p.expid == Convert.ToInt32(HiddenField_exp.Value)
                     select p;
            Label_editor.Text = up.First().name;
            Label_timestamp.Text = up.First().dt_time.ToString();
            TextBox_edit_title.Text = up.First().title;
            Editor_edit_experience.Content = up.First().experince;

        }
        if (e.CommandName == "del_st")
        {
            experience dl = db.experiences.First(p => p.expid == Convert.ToInt32(e.CommandArgument));
            db.experiences.DeleteOnSubmit(dl);
            db.SubmitChanges();
            MultiView_article.ActiveViewIndex = 0;
            Response.Write("<Script>alert(' Article deleted Successfully')</Script>");
            bind();
        }
    }

    protected void Submit_exp_Click(object sender, ImageClickEventArgs e)
    {
        experience ex = new experience();
        ex.experince = Editor_Experience.Content.ToString();
        ex.title = TextBox_title.Text;
        ex.name = Name.Text;
        ex.dt_time = DateTime.Now;

        db.experiences.InsertOnSubmit(ex);
        db.SubmitChanges();
        bind();
        Response.Write("<Script>alert('Experince Shared')</Script>");
        TextBox_title.Text = null;
        Editor_Experience.Content = null;
        Name.Text = null;
        Response.Redirect("Admin_article.aspx");
    }

    protected void Button_update_Click(object sender, ImageClickEventArgs e)
    {

        experience ex = db.experiences.First(p => p.expid == Convert.ToInt32(HiddenField_exp.Value));
        ex.experince = Editor_edit_experience.Content.ToString();
        ex.title = TextBox_edit_title.Text;
        ex.dt_time = DateTime.Now;


        db.SubmitChanges();
        bind();
        Response.Write("<Script>alert('Experince Updated')</Script>");
        Response.Redirect("Admin_article.aspx");
    }

    private void bind_comment()
    {

        var cc1 = from q in db.comments
                  where q.expid == Convert.ToInt32(HiddenField_cmt.Value)
                  select new
                  {
                      q.cmtid,
                      q.expid,
                      q.comment1,

                      q.dt_time,
                      q.name
                  };
        GridView_comment.DataSource = cc1;
        GridView_comment.DataBind();
    }

    protected void GridView_comment_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            Panel_new_cmt.Visible = false;
            Panel_update_comment.Visible = true;
            HiddenField_edit_cmt.Value = e.CommandArgument.ToString();

            var up = from p in db.comments
                     where p.cmtid == Convert.ToInt32(HiddenField_edit_cmt.Value)
                     select p;
            TextBox_edit_comment.Text = up.First().comment1;
            TextBox_edit_commenter.Text = up.First().name;

            Label_editor.Text = up.First().name;
            Label_timestamp.Text = up.First().dt_time.ToString();
           
        }
        if (e.CommandName == "del_st")
        {
            comment dl = db.comments.First(p => p.cmtid == Convert.ToInt32(e.CommandArgument));
            db.comments.DeleteOnSubmit(dl);
            db.SubmitChanges();
            Response.Write("<Script>alert(' Comment deleted Successfully')</Script>");
            bind_comment();
        }
    }

    

    protected void submit_comment_Click(object sender, EventArgs e)
    {
        comment cmt = new comment();
        cmt.comment1 = Comment_info.Text;
        cmt.name = cmt_name.Text;
        cmt.dt_time = DateTime.Now;
        cmt.expid = Convert.ToInt32(HiddenField_cmt.Value);
        db.comments.InsertOnSubmit(cmt);
        db.SubmitChanges();
        bind_comment();
        bind();
        Response.Write("<Script>alert('Comment Successfull')</Script>");
        Comment_info.Text = null;
        cmt_name.Text = null;

    }


    protected void ImageButton_update_comment_Click(object sender, ImageClickEventArgs e)
    {
        comment ct = db.comments.First(p => p.cmtid == Convert.ToInt32(HiddenField_edit_cmt.Value));
        ct.comment1 = TextBox_edit_comment.Text;
        ct.name = TextBox_edit_commenter.Text;
        ct.dt_time = DateTime.Now;


        db.SubmitChanges();
        bind_comment();
        Response.Write("<Script>alert('Comment Updated')</Script>");
        Panel_update_comment.Visible = false;
        Panel_new_cmt.Visible = true;
    }

    protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox_search.Text == "")
        {
            Response.Write("<Script>alert('Please first enter the Article title that you want to search')</Script>");
            Response.Redirect("Admin_article.aspx");
        }
        else
        {
            var sc = from p in db.experiences
                     where (p.title.Contains(TextBox_search.Text))
                   
                     select new
                     {
                         p.expid,
                         p.experince,
                         p.title,
                         p.name,
                         p.dt_time

                     };

            GridView_article.DataSource = sc;
            GridView_article.DataBind();
            ImageButton_clear.Visible = true;
        }
    }
    protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_article.aspx");

    }
}