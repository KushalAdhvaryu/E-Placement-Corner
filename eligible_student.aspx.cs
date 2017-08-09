using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

using System.IO;
//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using iTextSharp.text.html;
//using iTextSharp.text.html.simpleparser;
using System.Text;


public partial class eligible_student : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    double ppi, tenth, twelfth;
    int active_backlog;
    int total_baclog,yop;
    string id,branch,email_id=" ";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null)
        {
            string url = Convert.ToString(System.Web.HttpContext.Current.Request.Url);
            Response.Redirect("login_page.aspx?path=" + url);
        }
        if (Session["login"] != null)
        {
            var g = from p in db.logins
                    where p.login_id == Convert.ToInt32(Session["login"])
                    select p;
            id = g.First().username;

            var k = from q in db.cmp_regs
                    where q.cmp_id == id
                    select q;
            ppi = k.First().cmp_ppi;
            active_backlog = k.First().cmp_active_backlog;
            total_baclog = k.First().cmp_active_backlog;
            tenth = k.First().cmp_tenth;
            twelfth = k.First().cmp_twelfth;
            yop = k.First().cmp_yop;
            branch = k.First().cmp_branch;

            if (!IsPostBack)
            {
                bind();
            }
        }
    }

    private void bind()
    {
        var cc = from p in db.registrations
                 where p.ppi >= ppi && p.active_backlog <= active_backlog && p.total_backlog <= total_baclog && p.tenth >= tenth && p.twelfth >= twelfth && p.year_of_passing == yop && p.status == "Unplaced" && p.active == "Active"  
                 //&& p.status == "Unplaced" && p.active == "Active" && branch.Contains(p.branch)
                 select new
                 {
                     p.roll_no,
                     p.branch,
                     p.f_name,
                     p.email,
                     p.l_name,
                    
                     p.mobile,
                     p.date_of_birth,
                     p.gender,
                     p.ppi,
                     p.active_backlog,
                     p.total_backlog,
                     p.year_of_passing,
                     p.other_info,
                     p.resume,
                     p.pro_pic,
                     p.tenth,
                     p.twelfth,
                     p.sem_1,
                     p.sem_2,
                     p.sem_3,
                     p.sem_4,
                     p.sem_5,
                     p.sem_6,
                     p.sem_7,
                     p.sem_8,
                     p.status,
                     p.active

                 };

        GridView_reg.DataSource = cc;
        GridView_reg.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow grow in GridView_reg.Rows)
        {
            email_id = grow.Cells[3].Text;
            

            SmtpClient smp = new SmtpClient();
            MailMessage msg = new MailMessage();

            msg.From = new MailAddress("eplacementcorner@gmail.com");
            msg.To.Add(email_id);

            msg.Subject = "Comapny Notification from E-placement corner";

            msg.Body = TextBox_details.Text;
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
        Response.Write("<Script>alert('Notification send to all students successfuly.')</script>");
    }

    protected void ImageButton_export_excel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            var cc1 = from q in db.registrations

                      select new
                      {
                          q.roll_no,
                          q.branch,
                          q.f_name,
                         
                          q.email,
                          q.mobile,
                         
                          q.ppi,
                         


                      };
            string Path = "E:\\ImportExcelFromDatabase\\myexcelfile_" + DateTime.Now.Day.ToString() + "_" + DateTime.Now.Month.ToString() + ".xls";
            FileInfo FI = new FileInfo(Path);
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWriter);
            DataGrid DataGrd = new DataGrid();
            DataGrd.DataSource = cc1;
            DataGrd.DataBind();

            DataGrd.RenderControl(htmlWrite);
            string directory = Path.Substring(0, Path.LastIndexOf("\\"));// GetDirectory(Path);
            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }

            System.IO.StreamWriter vw = new System.IO.StreamWriter(Path, true);
            stringWriter.ToString().Normalize();
            vw.Write(stringWriter.ToString());
            vw.Flush();
            vw.Close();
            WriteAttachment(FI.Name, "application/vnd.ms-excel", stringWriter.ToString());
        }
        catch (Exception ex)
        {
            //throw new Exception(ex.Message);
        }
    }

    public static void WriteAttachment(string FileName, string FileType, string content)
    {
        HttpResponse Response = System.Web.HttpContext.Current.Response;
        Response.ClearHeaders();
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + FileName);
        Response.ContentType = FileType;
        Response.Write(content);
        Response.End();

    }
}