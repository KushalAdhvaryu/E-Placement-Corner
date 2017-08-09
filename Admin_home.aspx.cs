using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void ImageButton_backup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("BackupDB.aspx");
    }

    protected void ImageButton_notify_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("newsletter_email.aspx");
    }
}