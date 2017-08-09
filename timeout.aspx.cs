using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class timeout : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            var g = from p in db.logins
                    where p.login_id == Convert.ToInt32(Session["login"])
                    select p;
            id = g.First().username;

        }
        Label_result.Text = Session["mark"].ToString();
        quiz_result qr = db.quiz_results.First(p => p.roll_no == id);
        qr.test_1 = Convert.ToDouble(Session["mark"].ToString());
        db.SubmitChanges();
        Response.Write("<script>alert('Sorry, Time out!')</script>");
        Session["mark"] = null;
        Session["timeout"] = null;
        Session.Clear();
    }
}