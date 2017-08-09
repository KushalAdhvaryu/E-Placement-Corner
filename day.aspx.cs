using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class day : System.Web.UI.Page
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
            

            if (!IsPostBack)
            {
                bind();
            }
           
        }
    }

    private void bind()
    {
        var cc = from q in db.zerodays
                 where q.roll_no == id
                 select new
                 {
                     q.s_id,
                     q.roll_no,
                     q.mobile,
                     q.email,
                     q.cmp_1,
                     q.cmp_2,
                     q.cmp_3
                 };


         GridView_dayzero.DataSource = cc;
            GridView_dayzero.DataBind();


        if (GridView_dayzero.Rows.Count == 0)
        {
            MultiView_zeroday.ActiveViewIndex = 2;
           
        }
       
       
        
    }

   

    protected void GridView_dayzero_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            MultiView_zeroday.ActiveViewIndex = 1;
            var j = from r in db.logins
                    where r.login_id == Convert.ToInt32(Session["login"])
                    select r;
            Label_wish.Text += " " + j.First().screen_name + " you are selected !!!!!!";

            HiddenField_ans.Value = e.CommandArgument.ToString();
            var up = from t in db.zerodays
                     where t.s_id == Convert.ToInt32(HiddenField_ans.Value)
                     select t;




            var up1 = from t1 in db.zerodays
                     where t1.roll_no == "14III001"
                    select t1;

            if (up.First().cmp_1 == "yes")
            {
                RadioButton_cmp1.Visible = true;
                RadioButton_cmp1.Text = up1.First().cmp_1;
            }
            if (up.First().cmp_2 == "yes")
            {
                RadioButton_cmp2.Visible = true;
                RadioButton_cmp2.Text = up1.First().cmp_2;
            }
             if (up.First().cmp_3 == "yes")
            {
                RadioButton_cmp3.Visible = true;
                RadioButton_cmp3.Text = up1.First().cmp_3;
            }

            //TextBox_ans1.Text = up.First().cmp_1;
            //TextBox_ans2.Text = up.First().cmp_2;
            //TextBox_ans3.Text = up.First().cmp_3;

            //var up1 = from t1 in db.zerodays
            //         where t1.s_id == 1
            //         select t1;
            //Label_cmp1.Text = up1.First().cmp_1;
            //Label_cmp2.Text = up1.First().cmp_2;
            //Label_cmp3.Text = up1.First().cmp_3;
           

            //if (TextBox_ans1.Text != "yes")
            //{
            //    TextBox_ans1.Enabled = false;
            //}
            //if (TextBox_ans2.Text != "yes")
            //{
            //    TextBox_ans2.Enabled = false;
            //}
            //if (TextBox_ans3.Text != "yes")
            //{
            //    TextBox_ans3.Enabled = false;
            //}

        }
    }
    protected void Button_submit_Click(object sender, ImageClickEventArgs e)
    {
        zeroday zd = db.zerodays.First(p => p.s_id == Convert.ToInt32(HiddenField_ans.Value));

        var up2 = from t2 in db.zerodays
                  where t2.s_id == Convert.ToInt32(HiddenField_ans.Value)
                  select t2;
        string roll = up2.First().roll_no;

        var up1 = from t1 in db.zerodays
                  where t1.roll_no == "14III001"
                  select t1;

        registration re = db.registrations.First(p => p.roll_no == roll);
        re.status = "Placed";
    

        if (RadioButton_cmp1.Checked == true)
        {
            zd.cmp_1 = "yes";
            zd.cmp_2 = "no";
            zd.cmp_3 = "no";
            re.placedat = up1.First().cmp_1;
        }
        else if (RadioButton_cmp2.Checked == true)
        {
            zd.cmp_1 = "no";
            zd.cmp_2 = "yes";
            zd.cmp_3 = "no";
            re.placedat = up1.First().cmp_2;
        }
         else if (RadioButton_cmp1.Checked == true)
        {
            zd.cmp_1 = "no";
            zd.cmp_2 = "no";
            zd.cmp_3 = "yes";
            re.placedat = up1.First().cmp_3;
        }
       
        db.SubmitChanges();
        MultiView_zeroday.ActiveViewIndex = 0;
        Response.Write("<Script>alert('Updated Successfully')</Script>");
        bind();
    }
}

