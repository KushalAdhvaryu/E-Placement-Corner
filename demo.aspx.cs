using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class demo : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            var g = from p in db.logins
                    where p.login_id == Convert.ToInt32(Session["login"])
                    select p;
            Label1.Text += " " + g.First().screen_name;


        }
    }

        protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            Session["login"] = null;
            Session.Clear();
            Response.Redirect("gallery.aspx");
        }
    }

    
}