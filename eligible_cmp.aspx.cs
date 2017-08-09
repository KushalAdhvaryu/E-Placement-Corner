using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;
using System.Configuration;
using System.Data;

public partial class eligible_cmp : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    double ppi, tenth, twelfth;
    int active_backlog, yop;
    int total_baclog;
  
    string id,branch;
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
            id =  g.First().username;

            var k = from q in db.registrations
                    where q.roll_no == id
                    select q;
            ppi = k.First().ppi;
            active_backlog = k.First().active_backlog;
            total_baclog = k.First().total_backlog;
            tenth = k.First().tenth;
            twelfth = k.First().twelfth;
            yop = k.First().year_of_passing;
            branch = k.First().branch;



            


        }
        if (!IsPostBack)
        {
            bind();
        }

    }
    private void bind()
    {
        var cc = from p in db.cmp_regs
                 where p.cmp_ppi <= ppi && p.cmp_active_backlog >= active_backlog && p.cmp_total_backlog >= total_baclog && p.cmp_tenth <= tenth && p.cmp_twelfth <= twelfth && p.cmp_yop == yop && p.cmp_status == "Active" && p.cmp_branch.Contains(branch)
                 select new
                 {
                     p.cmp_id,
                     p.cmp_name,
                     p.cmp_url,
                     p.cmp_type,
                     p.cmp_uname,
                     p.cmp_email,
                     
                     p.cmp_mobile_no,
                     p.cmp_date_of_visit,
                     p.cmp_ppi,
                     p.cmp_active_backlog,
                     p.cmp_total_backlog,
                     p.cmp_package,
                     p.cmp_bond,
                     p.cmp_status,
                     p.cmp_yop,
                     p.cmp_logo,
                    
                     p.cmp_other_perks
                 };
        GridView_cmp_reg.DataSource = cc;
        GridView_cmp_reg.DataBind();
    }

    protected void GridView_cmp_reg_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view_st")
        {
            MultiView_cmp_reg.ActiveViewIndex = 1;
            HiddenField_profile.Value = e.CommandArgument.ToString();

            var up = from p in db.cmp_regs
                     where p.cmp_id == HiddenField_profile.Value
                     select p;
            Label_cmp_name.Text = up.First().cmp_name;
            Label_cmp_id.Text = up.First().cmp_id;
            Label_cmp_url.Text = up.First().cmp_url;
            Label_cmp_type.Text = up.First().cmp_type;
            Label_cmp_email.Text = up.First().cmp_email;
            Label_cmp_mobile.Text = up.First().cmp_mobile_no;
            Image_dp.ImageUrl = up.First().cmp_logo;
            Label_date_of_visit.Text = up.First().cmp_date_of_visit;
            Label_yop.Text = up.First().cmp_yop.ToString();
            Label_tenth.Text = up.First().cmp_tenth.ToString();
            Label_twelfth.Text = up.First().cmp_twelfth.ToString();
            Label_ppi.Text = up.First().cmp_ppi.ToString();
            Label_total_backlog.Text = up.First().cmp_total_backlog.ToString();
            Label_Active_Baclog.Text = up.First().cmp_active_backlog.ToString();
            Label_package.Text = up.First().cmp_package.ToString();
            Label_bond.Text = up.First().cmp_bond.ToString();
            Label_perks.Text = up.First().cmp_other_perks;
            HyperLink_cmp_url.NavigateUrl = up.First().cmp_url;

            var up1 = from p in db.Students
                      where p.cmp_id == HiddenField_profile.Value
                      select p;
            string cmp = up1.First().std_name;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["abc"].ConnectionString);
            SqlCommand cmd2 = new SqlCommand("Select * from Student", con);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataSet ds2 = new DataSet();

            DataTable dt2 = new DataTable();

            con.Open();
            String qstr2 = "select marks,y11,y12,y13,y14 from Student where std_name= '" + cmp + "'";

            SqlDataAdapter adp2 = new SqlDataAdapter(qstr2, con);
            adp2.Fill(ds2);
            dt2 = ds2.Tables[0];

            int[] x2 = new int[dt2.Columns.Count];
            int[] y2 = new int[dt2.Columns.Count];



            int year = 2010;
            int selectd = 100;
            for (int i = 0; i < dt2.Columns.Count; i++)
            {

                x2[i] = year;

                y2[i] = Convert.ToInt32(dt2.Rows[0][i]);

                year++;
                selectd = selectd + 20;

            }
            Chart3.Series["year"].Points.DataBindXY(x2, y2);

            Chart3.Series["year"].ChartType = SeriesChartType.Column;
            Chart3.Series["year"].Palette = ChartColorPalette.SemiTransparent;

            Chart3.ChartAreas["ChartArea3"].Area3DStyle.Enable3D = true;


            Chart3.Legends["year"].Enabled = true;

            da2.Fill(ds2);
            con.Close();


        }
    }
}