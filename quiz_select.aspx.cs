using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class quiz_select : System.Web.UI.Page
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
        var ddc = from k in db.subjects
                  select k;
        DropDownList_subject.DataSource = ddc;
        DropDownList_subject.DataTextField = "sub_name";
        DropDownList_subject.DataValueField = "sub_id";
      
        DropDownList_subject.DataBind();
    }
    protected void Button_tt_Click(object sender, EventArgs e)
    {
        MultiView_quiz.ActiveViewIndex = 1;
        HiddenField_quiz.Value = DropDownList_subject.SelectedValue;

        var up = from p in db.subjects
                 where p.sub_id == Convert.ToInt32(HiddenField_quiz.Value)
                 select p;
        Label_subject.Text = up.First().sub_name;
        Label_tq.Text = up.First().sub_tq.ToString();
        Label_pmark.Text = up.First().sub_pmrk.ToString();
        Label_nmark.Text = up.First().sub_nmrk.ToString();
        Label_etime.Text = up.First().sub_toaltime.ToString();
        Session["pmark"] = up.First().sub_pmrk;
        Session["nmark"] = up.First().sub_nmrk;
        Session["tt"] = up.First().sub_toaltime;
    }
    protected void Button_test1_Click(object sender, EventArgs e)
    {
        var up = from p in db.quiz_results
                 where p.roll_no == id
                 select p;
        if (up.Count() > 0)
        {

            if (up.First().test_1 == null &&  Convert.ToInt32(DropDownList_subject.SelectedValue) == 2)
            {
                Session["subid"] = DropDownList_subject.SelectedValue;
                Response.Redirect("rb_quiz.aspx");
            }
            else
            {

                Response.Write("<Script>alert(' Your test score is "  + up.First().test_1 + ". Contact faculty for queries. ')</Script>");
            }
            if (up.First().test_4 == null && Convert.ToInt32(DropDownList_subject.SelectedValue) == 3)
            {
                Session["subid"] = DropDownList_subject.SelectedValue;
                Response.Redirect("quiz.aspx");
            }
            else
            {

                Response.Write("<Script>alert(' Your test score is " + up.First().test_6 + ". Contact faculty for queries. ')</Script>");
            }
        }
        else
        {
            quiz_result qr = new quiz_result();
            qr.roll_no = id;
            db.quiz_results.InsertOnSubmit(qr);
            db.SubmitChanges();
            Session["subid"] = DropDownList_subject.SelectedValue;

            if (Convert.ToInt32(DropDownList_subject.SelectedValue) == 2)
            {
                Response.Redirect("rb_quiz.aspx");
            }
            else
            {
                Response.Redirect("quiz.aspx");
            }
        }



    }
}