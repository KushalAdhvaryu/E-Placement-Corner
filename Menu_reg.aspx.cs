using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu_reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_student_Click(object sender, ImageClickEventArgs e)
    {
        Response.Write("<Script>alert('Contact faculty advisor to get enrolled. ')</script>");
    }
    protected void Button_company_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Form_cmp.aspx");
    }

    protected void Button_faculty_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Form_fac.aspx");
    }
}