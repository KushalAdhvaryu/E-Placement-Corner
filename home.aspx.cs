using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
        news_latest nl = new news_latest();
        if (Session["login"] == null)
        {
           
            Panel_user.Visible = false;
            Panel_faculty.Visible = false;
            Panel_company.Visible = false;
            Panel_visitor.Visible = true;


        }
        //Label1.Text = nl.news_detail;
        if (Session["login"] != null)
        {
            var g = from p in db.logins
                    where p.login_id == Convert.ToInt32(Session["login"])
                    select p;
            if (g.First().user_type == 1)
            {
                Panel_user.Visible = true;
                Panel_faculty.Visible = false;
                Panel_company.Visible = false;
                Panel_visitor.Visible = false;
            }
            else if (g.First().user_type == 3)
            {
                Panel_user.Visible = false;
                Panel_faculty.Visible = true;
                Panel_company.Visible = false;
                Panel_visitor.Visible = false;
            }
            else if (g.First().user_type == 2)
            {
                Panel_user.Visible = false;
                Panel_faculty.Visible = false;
                Panel_company.Visible = true;
                Panel_visitor.Visible = false;
            }


        }
    }

    private void bind()
    {
        var cc = from p in db.news_latests

                 select new
                 {
                     p.news_details,
                     p.news_id,
                     p.news_link
                 };
        scrolling.DataSource = cc;
        scrolling.DataBind();
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("gallery.aspx");
    }
}