using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class forgot_password : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    int type;
    string uid;
    string pswd;
    int n = new Random().Next(1000, 9999);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_search_Click(object sender, EventArgs e)
    {

        var cc = from q in db.logins
                 where q.username == txt_emialid.Text
                 select q;
        type = cc.First().user_type;
        uid = cc.First().username;
        pswd = Convert.ToString(n);
        login lg = db.logins.First(p => p.username == txt_emialid.Text);
        lg.password = Convert.ToString(n);
        db.SubmitChanges();
        if (type == 1)
        {
             var dd = from p in db.registrations
                     where p.roll_no == uid 
                     select p;
             if (dd.Count() > 0)
             {
                 var pwd = pswd;

                 SmtpClient smp = new SmtpClient();
                 MailMessage msg = new MailMessage();

                 msg.From = new MailAddress(dd.First().email);
                 msg.To.Add(dd.First().email);

                 msg.Subject = "Regarding Forgot password in eplacementcorner";
                 msg.Body = "Your New Password Is : " + pwd;
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
        if (type == 2)
        {
            var dd = from p in db.cmp_regs
                     where p.cmp_id == uid
                     select p;
            if (dd.Count() > 0)
            {
                var pwd = pswd;

                SmtpClient smp = new SmtpClient();
                MailMessage msg = new MailMessage();

                msg.From = new MailAddress(dd.First().cmp_email);
                msg.To.Add(dd.First().cmp_email);

                msg.Subject = "Regarding Forgot password in eplacementcorner";
                msg.Body = "Your New Password Is : " + pwd;
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

         if (type == 3)
        {
            var dd = from p in db.fac_regs
                     where p.fac_id == uid
                     select p;
            if (dd.Count() > 0)
            {
                var pwd = pswd;

                SmtpClient smp = new SmtpClient();
                MailMessage msg = new MailMessage();

                msg.From = new MailAddress(dd.First().fac_email);
                msg.To.Add(dd.First().fac_email);

                msg.Subject = "Regarding Forgot password in eplacementcorner";
                msg.Body = "Your New Password Is : " + pwd;
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
         if (type == 4)
        {
            var dd = from p in db.logins
                     where p.username == uid
                     select p;
            if (dd.Count() > 0)
            {
                var pwd = pswd;

                SmtpClient smp = new SmtpClient();
                MailMessage msg = new MailMessage();
                string email_id = "eplacementcorner@gmail.com";

                msg.From = new MailAddress(email_id);
                msg.To.Add(email_id);

                msg.Subject = "Regarding Forgot password in eplacementcorner";
                msg.Body = "Your New Password Is : " + pwd;
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

         Response.Redirect("login_page.aspx");
    }


    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("login_page.aspx");
    }
}

       
    


