using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class contact_us : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            var g = from p in db.logins
                    where p.login_id == Convert.ToInt32(Session["login"])
                    select p;
            TextBox_name.Text = g.First().username;
            TextBox_name.Enabled = false;
            Label_name.Visible = false;
            Label_roll_no.Visible = true;
        }

    }
    protected void Button_submit_Click(object sender, ImageClickEventArgs e)
    {
    
        

        SmtpClient smp = new SmtpClient();
        MailMessage msg = new MailMessage();

        msg.From = new MailAddress(TextBox_email.Text);
        msg.To.Add("eplacementcorner@gmail.com");

        msg.Subject = TextBox_subject.Text;

        msg.Body = "Name: " + TextBox_name.Text + Environment.NewLine + "Email id: " + TextBox_email.Text + Environment.NewLine + "Details : " + TextBox_other_info.Text;
        smp.Host = "smtp.gmail.com";

        smp.EnableSsl = true;

        System.Net.NetworkCredential net = new System.Net.NetworkCredential();

        net.UserName = "eplacementcorner@gmail.com";
        net.Password = "majorproject";
        smp.UseDefaultCredentials = true;

        smp.Credentials = net;
        smp.Port = 25;

        smp.Send(msg);

        Response.Write("<Script>alert('Mail Has Been Sent !!!!!')</Script>");
    }
}