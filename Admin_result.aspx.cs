using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_result : System.Web.UI.Page
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
        var cc = from p in db.quiz_results

                 select new
                 {
                    p.roll_no,
                    p.test_1,
                    p.test_2,
                    p.test_3,
                    p.test_4,
                    p.test_5,
                    p.test_6

                 };
        GridView_result.DataSource = cc;
        GridView_result.DataBind();
    }

    protected void GridView_result_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            MultiView_result.ActiveViewIndex = 2;
            HiddenField_result.Value = e.CommandArgument.ToString();

            var up = from p in db.quiz_results
                     where p.roll_no == HiddenField_result.Value
                     select p;
            Label_roll_no.Text = up.First().roll_no;
            test_1_edit.Text = up.First().test_1.ToString();
            test_2_edit.Text = up.First().test_2.ToString();
            test_3_edit.Text = up.First().test_3.ToString();
            test_4_edit.Text = up.First().test_4.ToString();
            test_5_edit.Text = up.First().test_5.ToString();
            test_6_edit.Text = up.First().test_6.ToString();


        }
    }
    protected void ImageButton_update_Click(object sender, ImageClickEventArgs e)
    {
        quiz_result re = db.quiz_results.First(p => p.roll_no == HiddenField_result.Value);
        re.test_1 = Convert.ToDouble(test_1_edit.Text);
        re.test_2 = Convert.ToDouble(test_2_edit.Text);
        re.test_3 = Convert.ToDouble(test_3_edit.Text);
        re.test_4 = Convert.ToDouble(test_4_edit.Text);
        re.test_5 = Convert.ToDouble(test_5_edit.Text);
        re.test_6 = Convert.ToDouble(test_6_edit.Text);
        db.SubmitChanges();
        MultiView_result.ActiveViewIndex = 0;
        Response.Write("<Script>alert('Updated Successfully')</Script>");
        bind();
    }
    protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox_search.Text == "")
        {
            Response.Write("<Script>alert('Please first enter the Roll number that you want to search')</Script>");
            Response.Redirect("Admin_result.aspx");
        }
        else
        {
            var sc = from p in db.quiz_results
                     where (p.roll_no.Contains(TextBox_search.Text))
                     // where (p.state_name.StartsWith(TextBox_search.Text))
                     select new
                     {
                         p.roll_no,
                         p.test_1,
                         p.test_2,
                         p.test_3,
                         p.test_4,
                         p.test_5,
                         p.test_6

                     };

            GridView_result.DataSource = sc;
            GridView_result.DataBind();
            ImageButton_clear.Visible = true;
        }
    }
    protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_result.aspx");
    }
}