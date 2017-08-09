using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class newsletter_email : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_submit_Click(object sender, ImageClickEventArgs e)
    {
        var cc = from q in db.newsletters

                 select q;
        if (cc.Count() > 0)
        {
            for (int i = 1; i <= cc.Count(); i++)
            {
                var dd = from p in db.newsletters
                         where p.n_id == i
                         select p;

                SmtpClient smp = new SmtpClient();
                MailMessage msg = new MailMessage();

                msg.From = new MailAddress("eplacementcorner@gmail.com");
                msg.To.Add(dd.First().letter_email);

                msg.Subject = "News letter from E-placement corner";

                msg.Body =  TextBox_details.Text;
                smp.Host = "smtp.gmail.com";

                smp.EnableSsl = true;

                System.Net.NetworkCredential net = new System.Net.NetworkCredential();

                net.UserName = "eplacementcorner@gmail.com";
                net.Password = "majorproject";
                smp.UseDefaultCredentials = true;

                smp.Credentials = net;
                smp.Port = 25;

                smp.Send(msg);
            }

            Response.Write("<Script>alert('Mail Has Been Sent !!!!!')</Script>");
        }
        else
        {
            Response.Write("<Script>alert('There are no subsriptions.')</Script>");
        }
    }
   
}