using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;

public partial class student_profile : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    string id;
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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["abc"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select * from registration", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            con.Open();

            string qstr = "select sem_1,sem_2,sem_3,sem_4,sem_5,sem_6,sem_7,sem_8 from registration where roll_no= '" + id + " ' ";

            SqlDataAdapter adp = new SqlDataAdapter(qstr, con);
            adp.Fill(ds);
            dt = ds.Tables[0];
            int[] x = new int[dt.Columns.Count];
            string[] y = new string[dt.Columns.Count];

            int z = 1;


            for (int i = 0; i < dt.Columns.Count; i++)
            {

                x[i] = Convert.ToInt32(dt.Rows[0][i]);

                y[i] = "sem" + z;
                z++;

            }
            Chart1.Series["Default"].Points.DataBindXY(y, x);

            Chart1.Series["Default"].ChartType = SeriesChartType.Column;
            Chart1.Series["Default"].Palette = ChartColorPalette.SeaGreen;

            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

          //  Chart1.Legends["Default"].Enabled = false;

            da.Fill(ds);
            con.Close();

            var k = from q in db.registrations
                    where q.roll_no == id
                    select q;
            Label_profile.Text = k.First().f_name + " Profile";
            Label_roll_no.Text = k.First().roll_no;
            Label_branch.Text = k.First().branch;
            Label_fname.Text = k.First().f_name;
            Label_lname.Text = k.First().l_name;
            Label_email.Text = k.First().email;
            Label_mobile_number.Text = k.First().mobile;
            Label_DOB.Text = k.First().date_of_birth;
            Label_gender.Text = k.First().gender;
            Label_ppi.Text = k.First().ppi.ToString();
            Label_sctive_backlog.Text = k.First().active_backlog.ToString();
            Label_total_backlog.Text = k.First().total_backlog.ToString();
            Image_dp.ImageUrl = k.First().pro_pic;
            Label_sem1.Text = k.First().sem_1.ToString();
            Label_sem2.Text = k.First().sem_2.ToString();
            Label_sem3.Text = k.First().sem_3.ToString();
            Label_sem4.Text = k.First().sem_4.ToString();
            Label_sem5.Text = k.First().sem_5.ToString();
            Label_sem6.Text = k.First().sem_6.ToString();
            Label_sem7.Text = k.First().sem_7.ToString();
            Label_sem8.Text = k.First().sem_8.ToString();
            Label_std10.Text = k.First().tenth.ToString() + "%";
            Label_std12.Text = k.First().twelfth.ToString() + "%";
            
            Label_other_info.Text = k.First().other_info;

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("day.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("progress_graph.aspx");
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Student.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
       
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();

    }
  
    public override void VerifyRenderingInServerForm(Control control)
    {

        /* Verifies that the control is rendered */

    }
   
}