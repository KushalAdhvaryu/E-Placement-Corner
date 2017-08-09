using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_zeroday : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }

       
    }

    private void bind()
    {
        var cc = from q in db.zerodays

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
    }

    protected void GridView_dayzero_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            MultiView_reg.ActiveViewIndex = 2;
            HiddenField_edit.Value = e.CommandArgument.ToString();

            var up = from p in db.zerodays
                     where p.roll_no == HiddenField_edit.Value
                     select p;
            Label_roll_no.Text = up.First().roll_no;
            TextBox_edit_cmp1.Text = up.First().cmp_1;
            TextBox_edit_cmp2.Text = up.First().cmp_2;
            TextBox_edit_cmp3.Text = up.First().cmp_3;
            TextBox_edit_email.Text = up.First().email;
            TextBox_edit_mobile_number.Text = up.First().mobile;
        }
        if (e.CommandName == "del_st")
        {
            zeroday dl = db.zerodays.First(p => p.s_id == Convert.ToInt32(e.CommandArgument));            
            db.zerodays.DeleteOnSubmit(dl);         
            db.SubmitChanges();
          
            Response.Write("<Script>alert('Deleted Successfully')</script>");
            bind();
        }
    }

    protected void ImageButton_delete_Click(object sender, ImageClickEventArgs e)
    {
        var cc = from q in db.zerodays

                select q;
        int start = cc.First().s_id;
        zeroday lst = db.zerodays.OrderByDescending(l => l.s_id).First();
   
        int end = lst.s_id;
        int count = cc.Count();
        if (count > 0)

        {
           for (int i = start; i <= end; i++)
            {
               zeroday dl = db.zerodays.First(p => p.s_id == i);
               db.zerodays.DeleteOnSubmit(dl);
           }
           db.SubmitChanges();
         Response.Write("<Script>alert('Deleted Successfully')</script>");
          bind();
        }


    }
    protected void Button_submit_Click(object sender, ImageClickEventArgs e)
    {
        zeroday zd = new zeroday();
        zd.roll_no = TextBox_roll_no.Text;
        zd.mobile = TextBox_mobile_number.Text;
        zd.email = TextBox_email.Text;
        zd.cmp_1 = TextBox_cmp1.Text;
        zd.cmp_2 = TextBox_cmp2.Text;
        zd.cmp_3 = TextBox_cmp3.Text;

        db.zerodays.InsertOnSubmit(zd);
       
        db.SubmitChanges();
        MultiView_reg.ActiveViewIndex = 0;
        bind();
        Response.Write("<script>alert('added Successfully')</Script>");
    }
    protected void Button_update_Click(object sender, ImageClickEventArgs e)
    {
        zeroday re = db.zerodays.First(p => p.roll_no == HiddenField_edit.Value);

        re.mobile = TextBox_edit_mobile_number.Text;
        re.email = TextBox_edit_email.Text;
        re.cmp_1 = TextBox_edit_cmp1.Text;
        re.cmp_2 = TextBox_edit_cmp2.Text;
        re.cmp_3 = TextBox_edit_cmp3.Text;

        db.SubmitChanges();
        MultiView_reg.ActiveViewIndex = 0;
        Response.Write("<Script>alert('Updated Successfully')</Script>");
        bind();

    }
    protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox_search.Text == "")
        {
            Response.Write("<Script>alert('Please first enter the Roll number that you want to search')</Script>");
            Response.Redirect("Admin_zeroday.aspx");
        }
        else
        {
            var sc = from q in db.zerodays
                     where (q.roll_no.Contains(TextBox_search.Text))
                     // where (p.state_name.StartsWith(TextBox_search.Text))
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
            GridView_dayzero.DataSource = sc;
            GridView_dayzero.DataBind();

            ImageButton_clear.Visible = true;
        }
    }
    protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_zeroday.aspx");
    }
}