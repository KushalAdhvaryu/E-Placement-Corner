using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_question : System.Web.UI.Page
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
        var cc = from p in db.questions

                 select new
                 {
                     p.q_id,
                     p.q_statement,
                     p.q_opA,
                     p.q_opB,
                     p.q_opC,
                     p.q_opD,
                     p.subject.sub_name,
                     p.q_ans
                 };

        GridView_question.DataSource = cc;
        GridView_question.DataBind();

        var ddc = from k in db.subjects
                  select k;
        DropDownList_sub.DataSource = ddc;
        DropDownList_sub.DataTextField = "sub_name";
        DropDownList_sub.DataValueField = "sub_id";
        DropDownList_sub.DataBind();

        var ddec = from j in db.subjects
                   select j;
        DropDownList_edit_subject.DataSource = ddec;
        DropDownList_edit_subject.DataTextField = "sub_name";
        DropDownList_edit_subject.DataValueField = "sub_id";
        DropDownList_edit_subject.DataBind();
    }

    protected void Button_add_Click(object sender, ImageClickEventArgs e)
    {
        MultiView_state.ActiveViewIndex = 1;
    }

    protected void GridView_que_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            MultiView_state.ActiveViewIndex = 2;
            HiddenField_edit.Value = e.CommandArgument.ToString();

            var up = from p in db.questions
                     where p.q_id == Convert.ToInt32(HiddenField_edit.Value)
                     select p;
            TextBox_edit_statement.Text = up.First().q_statement;
            DropDownList_edit_subject.SelectedValue = up.First().sub_id.ToString();
            TextBox_edit_opA.Text = up.First().q_opA;
            TextBox_edit_opB.Text = up.First().q_opB;
            TextBox_edit_opC.Text = up.First().q_opC;
            TextBox_edit_opD.Text = up.First().q_opD;
            DropDownList_edit_ans.SelectedValue = up.First().q_ans;

        }
        if (e.CommandName == "del_st")
        {
            question dl = db.questions.First(p => p.q_id == Convert.ToInt32(e.CommandArgument));
            db.questions.DeleteOnSubmit(dl);
            db.SubmitChanges();
            MultiView_state.ActiveViewIndex = 0;
            Response.Write("<Script>alert('Deleted Successfully')</Script>");
            bind();
        }
    }

    protected void Button_addq_Click(object sender, EventArgs e)
    {
        question q = new question();
        q.q_statement = TextBox_statement.Text;
        q.sub_id = Convert.ToInt32(DropDownList_sub.SelectedValue);
        q.q_opA = TextBox_opA.Text;
        q.q_opB = TextBox_opB.Text;
        q.q_opC = TextBox_opC.Text;
        q.q_opD = TextBox_opD.Text;
        if (DropDownList_answer.SelectedValue == "A")
        {
            q.q_ans = TextBox_opA.Text;
        }
        else if (DropDownList_answer.SelectedValue == "B")
        {
            q.q_ans = TextBox_opB.Text;
        }
        else if (DropDownList_answer.SelectedValue == "C")
        {
            q.q_ans = TextBox_opC.Text;
        }
        else if (DropDownList_answer.SelectedValue == "D")
        {
            q.q_ans = TextBox_opD.Text;
        }

        db.questions.InsertOnSubmit(q);
        db.SubmitChanges();
        MultiView_state.ActiveViewIndex = 0;
        Response.Write("<Script>alert('Added Successfully')</Script>");
        bind();

    }

    protected void Button_update_Click(object sender, EventArgs e)
    {
        question qe = db.questions.First(p => p.q_id == Convert.ToInt32(HiddenField_edit.Value));
        qe.q_statement = TextBox_edit_statement.Text;
        qe.sub_id = Convert.ToInt32(DropDownList_edit_subject.SelectedValue);
        qe.q_opA = TextBox_edit_opA.Text;
        qe.q_opB = TextBox_edit_opB.Text;
        qe.q_opC = TextBox_edit_opC.Text;
        qe.q_opD = TextBox_edit_opD.Text;
        if (DropDownList_edit_ans.SelectedValue == "A")
        {
            qe.q_ans = TextBox_edit_opA.Text;
        }
        else if (DropDownList_edit_ans.SelectedValue == "B")
        {
            qe.q_ans = TextBox_edit_opB.Text;
        }
        else if (DropDownList_edit_ans.SelectedValue == "C")
        {
            qe.q_ans = TextBox_edit_opC.Text;
        }
        else if (DropDownList_edit_ans.SelectedValue == "D")
        {
            qe.q_ans = TextBox_edit_opD.Text;
        }
       

        db.SubmitChanges();
        MultiView_state.ActiveViewIndex = 0;
        Response.Write("<Script>alert('Updated Successfully')</Script>y");
        bind();

    }
    protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox_search.Text == "")
        {
            Response.Write("<Script>alert('Please first enter the Question that you want to search')</Script>");
            Response.Redirect("Admin_question.aspx");
        }
        else
        {
            var sc = from p in db.questions
                     where (p.q_statement.Contains(TextBox_search.Text))
                     // where (p.state_name.StartsWith(TextBox_search.Text))
                     select new
                     {
                         p.q_id,
                         p.q_statement,
                         p.q_opA,
                         p.q_opB,
                         p.q_opC,
                         p.q_opD,
                         p.subject.sub_name,
                         p.q_ans

                     };

            GridView_question.DataSource = sc;
            GridView_question.DataBind();
            ImageButton_clear.Visible = true;
        }
    }
    protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_question.aspx");
    }
}
