using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forum : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    string usrname;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null)
        {

            string url = Convert.ToString(System.Web.HttpContext.Current.Request.Url);
            Response.Redirect("login_page.aspx?path=" + url);
        }

        if (Session["login"] != null)
        {
            var g = from p in db.logins
                    where p.login_id == Convert.ToInt32(Session["login"])
                    select p;
            usrname = g.First().screen_name;

            if (!IsPostBack)
            {
                bind();
            }
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

        GridView_exp.DataSource = cc;
        GridView_exp.DataBind();
        GridView_scroll.DataSource = cc;
        GridView_scroll.DataBind();
        
    }

    protected void Submit_exp_Click(object sender, EventArgs e)
    {
        experience ex = new experience();
        ex.experince = Editor_Experience.Content.ToString();
        ex.title = TextBox_title.Text;
        ex.name = usrname;
        ex.dt_time = DateTime.Now;

        db.experiences.InsertOnSubmit(ex);
        db.SubmitChanges();
        bind();
        Response.Write("<Script>alert('Experince Shared')</Script>");
        TextBox_title.Text = null;
        Editor_Experience.Content = null;
       
        Response.Redirect("forum.aspx");
      
        
    }

    protected void GridView_exp_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "comment_st")
        {
            MultiView_comments.ActiveViewIndex = 1;
            HiddenField_cmt.Value = e.CommandArgument.ToString();

            var up = from p in db.experiences
                     where p.expid == Convert.ToInt32(HiddenField_cmt.Value)
                     select p;
            Label_name.Text = up.First().name;
            Label_timstamp.Text = up.First().dt_time.ToString();
            Label_title.Text = up.First().title;
            Label_experince.Text = up.First().experince;
            bind_comment();


        }
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
        repeater_comment.DataSource = cc1;
        repeater_comment.DataBind();
    }

    protected void submit_comment_Click(object sender, EventArgs e)
    {
        comment cmt = new comment();
        cmt.comment1 = Comment_info.Text;
        cmt.name = usrname;
        cmt.dt_time = DateTime.Now;
        cmt.expid = Convert.ToInt32(HiddenField_cmt.Value);
        db.comments.InsertOnSubmit(cmt);
        db.SubmitChanges();
        bind_comment();
        bind();
        Response.Write("<Script>alert('Comment Successfull')</Script>");
        Comment_info.Text = null;
       

       
    

   
        


    }
}