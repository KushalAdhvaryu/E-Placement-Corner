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

public partial class profile_fac : System.Web.UI.Page
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

             var aa = from q in db.registrations
                      where q.status == "Placed" && q.active == "Active" 
                      select q;

             var dd = from k in db.registrations
                      where k.status == "Unplaced" && k.active == "Active"
                      select k;
           
             

            
             int[] x = new int[2];
             string[] y = new string[2];

          



           

                 x[0] = aa.Count();
                 x[1] = dd.Count();

                 y[0] = "Placed";
                 y[1] = "Unplaced";
               

             Chart1.Series["Default"].Points.DataBindXY(y, x);

             Chart1.Series["Default"].ChartType = SeriesChartType.Column;
             Chart1.Series["Default"].Palette = ChartColorPalette.SemiTransparent;

             Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

             //  Chart1.Legends["Default"].Enabled = false;

             var up = from p in db.fac_regs
                      where p.fac_id == id
                      select p;
             Label_profile.Text = up.First().fac_name;
             Label_fac_id.Text = up.First().fac_id;
             Label_yop.Text = up.First().fac_year;
             Label_branch.Text = up.First().fac_branch;
             Label_email.Text = up.First().fac_email;
             Image_dp.ImageUrl = up.First().fac_dp;
             Label_mobile_number.Text = up.First().fac_mobile_no;
             Label_other_info.Text = up.First().fac_info;
         }

    }
}