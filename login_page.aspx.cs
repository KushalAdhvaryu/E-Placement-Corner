using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_page : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void signup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Menu_reg.aspx");
    }
    protected void signin_Click(object sender, ImageClickEventArgs e)
    {
        var vv = from v in db.logins
                 where (v.username == TextBox_uid.Text && v.password == TextBox_password.Text)
                 select v;
        if (vv.Count() > 0)
        {
            if (vv.First().l_active == "Active")
            {
                if (vv.First().user_type == 1)
                {
                    Session["login"] = vv.First().login_id;
                    Session.Add("username", TextBox_uid.Text);
                    if (!string.IsNullOrEmpty(Request["path"]))
                    {
                        Response.Redirect(Request["path"]);
                    }
                    // Response.Redirect("~/eligible_cmp.aspx");
                }
                else if (vv.First().user_type == 2)
                {
                    Session["login"] = vv.First().login_id;
                    if (!string.IsNullOrEmpty(Request["path"]))
                    {
                        Response.Redirect(Request["path"]);
                    }

                   // Response.Redirect("~/Contact.aspx");
                }
                else if (vv.First().user_type == 3)
                {
                    Session["login"] = vv.First().login_id;
                    if (!string.IsNullOrEmpty(Request["path"]))
                    {
                        Response.Redirect(Request["path"]);
                    }

                   // Response.Redirect("~/reg_menu.aspx");
                }
                else if (vv.First().user_type == 4)
                {
                    Session["login"] = vv.First().login_id;
                    if (!string.IsNullOrEmpty(Request["path"]))
                    {
                        Response.Redirect(Request["path"]);
                    }
                    //Response.Redirect("~/Admin_home.aspx");
                }
                else
                {
                    Session["login"] = null;
                    Response.Redirect("~/Default.aspx");
                }
            }
            else
            {
                Response.Write("<Script>alert('This user is blocked contact III cell')</Script>");
            }
        }
        else
        {
            Response.Write("<Script>alert('Wronge user id or Pasword')</Script>");
        }
    }
}