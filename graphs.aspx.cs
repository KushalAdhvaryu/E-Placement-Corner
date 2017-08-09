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

public partial class graphs : System.Web.UI.Page
{
    string qstr,qstr1;
    int j;
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
        if (!IsPostBack)
        {
            var ddc = from k in db.Students
                      select k;
            DropDownList_company.DataSource = ddc;
            DropDownList_company.DataTextField = "std_name";
            DropDownList_company.DataValueField = "std_id";

            DropDownList_company.DataBind();

        }
      
      
    }

    public void bind()
    {

       
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["abc"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Select * from Student", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        con.Open();
        qstr = "select std_name,y14 from Student";
        
        SqlDataAdapter adp = new SqlDataAdapter(qstr, con);
        adp.Fill(ds);
        dt = ds.Tables[0];
        string[] x = new string[dt.Rows.Count];
        int[] y = new int[dt.Rows.Count];
       

        
        
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            x[i] = dt.Rows[i][0].ToString();

            y[i] = Convert.ToInt32(dt.Rows[i][1]);

        }
        Chart1.Series["Default"].Points.DataBindXY(x, y);

        Chart1.Series["Default"].ChartType = SeriesChartType.Doughnut;

        Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

        Chart1.Legends["Default"].Enabled = true;

        da.Fill(ds);
        con.Close();

        //SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["abc"].ConnectionString);
        SqlCommand cmd1 = new SqlCommand("Select * from Student_status", con);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataSet ds1 = new DataSet();

        DataTable dt1 = new DataTable();
        con.Open();
         qstr1 = "select Stu_type,Stu_no from Student_status";
        SqlDataAdapter adp1 = new SqlDataAdapter(qstr1, con);
        adp1.Fill(ds1);
        dt1 = ds1.Tables[0];
        string[] x1 = new string[dt1.Rows.Count];
        int[] y1 = new int[dt1.Rows.Count];
        for (int i = 0; i < dt1.Rows.Count; i++)
        {

            x1[i] = dt1.Rows[i][0].ToString();

            y1[i] = Convert.ToInt32(dt1.Rows[i][1]);

        }
        Chart2.Series["Series"].Points.DataBindXY(x1, y1);

        Chart2.Series["Series"].ChartType = SeriesChartType.Pie;

        Chart2.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = true;

        Chart2.Legends["Series"].Enabled = true;

        da.Fill(ds1);
        con.Close();


        SqlCommand cmd2 = new SqlCommand("Select * from Student", con);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        DataSet ds2 = new DataSet();

        DataTable dt2 = new DataTable();
        string cmp = "Infosys";
        con.Open();
        String qstr2 = "select marks,y11,y12,y13,y14 from Student where std_name= '"+cmp + "'";
        
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

        Chart3.ChartAreas["ChartArea3"].Area3DStyle.Enable3D = true;
        

        Chart3.Legends["year"].Enabled = true;

        da2.Fill(ds2);
        con.Close();

    }
    protected void DropDownList_year_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["abc"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Select * from Student", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        con.Open();
        if (DropDownList_year.SelectedItem.Text == "2014")
        {
            qstr = "select std_name,y14 from Student";


        }
        else if (DropDownList_year.SelectedItem.Text == "2013")
        {
            qstr = "select std_name,y13 from Student";

        }
        else if (DropDownList_year.SelectedItem.Text == "2012")
        {
            qstr = "select std_name,y12 from Student";

        }
        else if (DropDownList_year.SelectedItem.Text == "2011")
        {
            qstr = "select std_name,y11 from Student";

        }
        else
        {
            qstr = "select std_name,marks from Student";

        }

        SqlDataAdapter adp = new SqlDataAdapter(qstr, con);
        adp.Fill(ds);
        dt = ds.Tables[0];
        string[] x = new string[dt.Rows.Count];
        int[] y = new int[dt.Rows.Count];
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            x[i] = dt.Rows[i][0].ToString();

            y[i] = Convert.ToInt32(dt.Rows[i][1]);

        }
        Chart1.Series["Default"].Points.DataBindXY(x, y);

        Chart1.Series["Default"].ChartType = SeriesChartType.Column;

        Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

        Chart1.Legends["Default"].Enabled = true;

        da.Fill(ds);
        con.Close();
        SqlCommand cmd1 = new SqlCommand("Select * from Student_status", con);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataSet ds1 = new DataSet();

        DataTable dt1 = new DataTable();
        con.Open();
        if (DropDownList_year.SelectedItem.Text == "2014")
        {
            
            qstr1 = "select Stu_type,year_14 from Student_status";


        }
        else if (DropDownList_year.SelectedItem.Text == "2013")
        {
            qstr1 = "select Stu_type,year_13 from Student_status";

        }
        else if (DropDownList_year.SelectedItem.Text == "2012")
        {
            qstr1 = "select Stu_type,year_12 from Student_status";

        }
        else if (DropDownList_year.SelectedItem.Text == "2011")
        {
            qstr1 = "select Stu_type,year_11 from Student_status";

        }
        else
        {
            
            qstr1 = "select Stu_type,Stu_no from Student_status";

        }
        SqlDataAdapter adp1 = new SqlDataAdapter(qstr1, con);
        adp1.Fill(ds1);
        dt1 = ds1.Tables[0];
        string[] x1 = new string[dt1.Rows.Count];
        int[] y1 = new int[dt1.Rows.Count];
        for (int i = 0; i < dt1.Rows.Count; i++)
        {

            x1[i] = dt1.Rows[i][0].ToString();

            y1[i] = Convert.ToInt32(dt1.Rows[i][1]);

        }
        Chart2.Series["Series"].Points.DataBindXY(x1, y1);

        Chart2.Series["Series"].ChartType = SeriesChartType.Pie;

        Chart2.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = true;

        Chart2.Legends["Series"].Enabled = true;

        da.Fill(ds);
        con.Close();

    }

    protected void DropDownList_company_SelectedIndexChanged(object sender, EventArgs e)
    {
     
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["abc"].ConnectionString);
        SqlCommand cmd2 = new SqlCommand("Select * from Student", con);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        DataSet ds2 = new DataSet();
        
        DataTable dt2 = new DataTable();
       
        con.Open();
        string cmp = DropDownList_company.SelectedItem.Text;
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

        Chart3.ChartAreas["ChartArea3"].Area3DStyle.Enable3D = true;


        Chart3.Legends["year"].Enabled = true;

        da2.Fill(ds2);
        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
}
