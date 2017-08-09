using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_reg_menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_student_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_stud_reg.aspx");
    }

    protected void Button_company_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_cmp_reg.aspx");
    }
    protected void Button_faculty_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_fac_reg.aspx");
    }
}