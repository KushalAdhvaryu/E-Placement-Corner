using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class master_general : System.Web.UI.MasterPage
{
    DataClassesDataContext db = new DataClassesDataContext();
   protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null)
        {
            Panel_login.Visible = true;

            Panel_logout.Visible = false;
            string url =Convert.ToString( System.Web.HttpContext.Current.Request.Url);
         
            

            Response.Redirect("login_page.aspx?path="+ url);

          

        }
        if (Session["login"] != null)
        {
            Panel_login.Visible = false;
            Panel_logout.Visible = true;
            var g = from p in db.logins
                    where p.login_id == Convert.ToInt32(Session["login"])
                    select p;
            Label1.Text = g.First().screen_name;


        }
    }
   protected void Button1_Click(object sender, EventArgs e)
   {
          Response.Write("<Script>alert('Clicked')</Script>");
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
               Response.Redirect("~/student_profile.aspx");
           }
           else if (vv.First().user_type == 2)
           {
               Session["login"] = vv.First().login_id;
               Response.Redirect("~/home.aspx");
           }
           else if (vv.First().user_type == 3)
           {
               Session["login"] = vv.First().login_id;
               Response.Redirect("~/Director.aspx");
           }
           else if (vv.First().user_type == 4)
           {
               Session["login"] = vv.First().login_id;
               Response.Redirect("~/Admin_home.aspx");
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

   protected void signup_Click(object sender, ImageClickEventArgs e)
   {
       Response.Redirect("Menu_reg.aspx");
   }
   protected void logout_Click(object sender, EventArgs e)
   {
       if (Session["login"] != null)
       {
           Session["login"] = null;
           Session.Clear();
           Response.Redirect("home.aspx");
           Response.Write("<Script>alert('Successfully Logged out')</Script>");
       }
   }
   protected void LoginButton_Click(object sender, EventArgs e)
   {
       var vv = from v in db.logins
                where (v.username == TextBox_uid.Text && v.password == TextBox_password.Text)
                select v;
       if (vv.Count() > 0)
       {
           if (vv.First().user_type == 1)
           {
               Session["login"] = vv.First().login_id;
               Session.Add("username", TextBox_uid.Text);
               Response.Redirect("~/student_profile.aspx");
           }
           else if (vv.First().user_type == 2)
           {
               Session["login"] = vv.First().login_id;
               Response.Redirect(Request.RawUrl);
           }
           else if (vv.First().user_type == 3)
           {
               Session["login"] = vv.First().login_id;
               Response.Redirect("~/Director.aspx");
           }
           else if (vv.First().user_type == 4)
           {
               Session["login"] = vv.First().login_id;
               Response.Redirect("~/Admin_home.aspx");
           }
           else
           {
               Session["login"] = null;
               Response.Redirect("~/Default.aspx");
           }
       }
       else
       {
           Response.Write("<Script>alert('Wronge user id or Pasword')</Script>");
       }
   }
}

