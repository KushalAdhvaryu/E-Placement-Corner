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

public partial class progress_graph : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    string id;
    public string Ans;
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

            Chart1.Series["Default"].ChartType = SeriesChartType.Bar;

            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

            Chart1.Legends["Default"].Enabled = true;

            da.Fill(ds);
            con.Close();

            
        }

    }

    public void bind()
    {
       
        

    }
}