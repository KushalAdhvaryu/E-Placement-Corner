using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_placements : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
        Panel_update_status.Visible = false;
    }

    private void bind()
    {
        var cc = from p in db.Students

                 select new
                 {
                     p.std_id,
                     p.std_name,
                     p.cmp_id,
                     p.marks,
                     p.y11,
                     p.y12,
                     p.y13,
                     p.y14
                 };

        GridView_placed.DataSource = cc;
        GridView_placed.DataBind();

        var cc1 = from q in db.Student_status

                  select new
                  {
                      q.id,
                      q.Stu_type,
                      q.Stu_no,
                      q.year_11,
                      q.year_12,
                      q.year_13,
                      q.year_14
                  };
        GridView_status.DataSource = cc1;
        GridView_status.DataBind();

        var ddc = from k in db.cmp_regs
                  select k;
        DropDownList_cmp_id.DataSource = ddc;
        DropDownList_cmp_id.DataTextField = "cmp_name";
        DropDownList_cmp_id.DataValueField = "cmp_id";
        DropDownList_cmp_id.DataBind();

        TextBox_cmp_id.Text = DropDownList_cmp_id.SelectedValue;
    }

    protected void GridView_status_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            Panel_update_status.Visible = true;
            HiddenField_status.Value = e.CommandArgument.ToString();

            var up = from p in db.Student_status
                     where p.id == Convert.ToInt32(HiddenField_status.Value)
                     select p;
            Labelstatus_type.Text = up.First().Stu_type;
            TextBox_s2010.Text = up.First().Stu_no.ToString();
            TextBox_s2011.Text = up.First().year_11.ToString();
            TextBox_s2012.Text = up.First().year_12.ToString();
            TextBox_s2013.Text = up.First().year_13.ToString();
            TextBox_s2014.Text = up.First().year_14.ToString();
        }
    }

    protected void GridView_placed_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            MultiView_stats.ActiveViewIndex = 2;
            HiddenField_comp.Value = e.CommandArgument.ToString();

            var up = from p in db.Students
                     where p.std_id == Convert.ToInt32(HiddenField_comp.Value)
                     select p;
            Label_cmp_id.Text = up.First().cmp_id;
            Label_cmpname.Text = up.First().std_name;
            yr10_edit.Text = up.First().marks.ToString();
            yr11_edit.Text = up.First().y11.ToString();
            yr12_edit.Text = up.First().y12.ToString();
            yr13_edit.Text = up.First().y13.ToString();
            yr14_edit.Text = up.First().y14.ToString();
        }
        if (e.CommandName == "del_st")
        {
            Student st = db.Students.First(p => p.std_id == Convert.ToInt32(e.CommandArgument));
            db.Students.DeleteOnSubmit(st);
            db.SubmitChanges();
            MultiView_stats.ActiveViewIndex = 0;
            Response.Write("<Script>alert('Company data Deleted Successfully')</Script>");
            bind();
        }
    }
    protected void Button_update_Click(object sender, ImageClickEventArgs e)
    {
        Student_status ss = db.Student_status.First(p => p.id == Convert.ToInt32(HiddenField_status.Value));
        ss.Stu_no = Convert.ToInt32(TextBox_s2010.Text);
        ss.year_11 = Convert.ToInt32(TextBox_s2011.Text);
        ss.year_12 = Convert.ToInt32(TextBox_s2012.Text);
        ss.year_13 = Convert.ToInt32(TextBox_s2013.Text);
        ss.year_14 = Convert.ToInt32(TextBox_s2014.Text);

        
        db.SubmitChanges();
        bind();
        Response.Write("<Script>alert(' Status Updated Successfully')</Script>");
        Panel_update_status.Visible = false;
       

    }
    protected void Button_add_Click(object sender, ImageClickEventArgs e)
    {
        MultiView_stats.ActiveViewIndex = 1;
    }
    protected void Button_submit_Click(object sender, ImageClickEventArgs e)
    {
        Student cp = new Student();

        cp.std_name = DropDownList_cmp_id.SelectedItem.Text;
        cp.marks = Convert.ToInt32(yr10.Text);
        cp.y11 = Convert.ToInt32(yr11.Text);
        cp.y12 = Convert.ToInt32(yr12.Text);
        cp.y13 = Convert.ToInt32(yr13.Text);
        cp.y14 = Convert.ToInt32(yr14.Text);
        cp.cmp_id = DropDownList_cmp_id.SelectedValue;


        db.Students.InsertOnSubmit(cp);
        db.SubmitChanges();
    
        bind();
        MultiView_stats.ActiveViewIndex = 0;
        Response.Write("<Script>alert('Company Statistics added')</Script>");
    }
    protected void ImageButton_update_Click(object sender, ImageClickEventArgs e)
    {

        Student ste = db.Students.First(p => p.std_id == Convert.ToInt32(HiddenField_comp.Value));
        ste.marks = Convert.ToInt32(yr10_edit.Text);
        ste.y11 = Convert.ToInt32(yr11_edit.Text);
        ste.y12 = Convert.ToInt32(yr12_edit.Text);
        ste.y13 = Convert.ToInt32(yr13_edit.Text);
        ste.y14 = Convert.ToInt32(yr14_edit.Text);

        db.SubmitChanges();
        bind();
        MultiView_stats.ActiveViewIndex = 0;
        Response.Write("<Script>alert(' Company statitics Updated Successfully')</Script>");
    }

    protected void DropDownList_cmp_id_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox_cmp_id.Text = DropDownList_cmp_id.SelectedValue;
    }

    protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox_search.Text == "")
        {
            Response.Write("<Script>alert('Please first enter the Company name that you want to search')</Script>");
            Response.Redirect("Admin_placements.aspx");
        }
        else
        {
            var sc = from p in db.Students
                     where (p.std_name.Contains(TextBox_search.Text))
                     // where (p.state_name.StartsWith(TextBox_search.Text))
                     select new
                     {
                         p.std_id,
                         p.std_name,
                         p.cmp_id,
                         p.marks,
                         p.y11,
                         p.y12,
                         p.y13,
                         p.y14
                     };

            GridView_placed.DataSource = sc;
            GridView_placed.DataBind();

            var cc1 = from q in db.Student_status

                      select new
                      {
                          q.id,
                          q.Stu_type,
                          q.Stu_no,
                          q.year_11,
                          q.year_12,
                          q.year_13,
                          q.year_14
                      };
            GridView_status.DataSource = cc1;
            GridView_status.DataBind();
            ImageButton_clear.Visible = true;
        }
    }
    protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_placements.aspx");
    }
}