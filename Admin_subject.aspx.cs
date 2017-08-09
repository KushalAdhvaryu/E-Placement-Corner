using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_subject : System.Web.UI.Page
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
        var cc = from p in db.subjects

                 select new
                 {
                     p.sub_id,
                     p.sub_name,
                     p.sub_nmrk,
                     p.sub_pmrk,
                     p.sub_toaltime,
                     p.sub_tq

                 };

        GridView_sub.DataSource = cc;
        GridView_sub.DataBind();


    }

     protected void GridView_sub_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            MultiView_sub.ActiveViewIndex = 2;
             HiddenField_sub_edit.Value = e.CommandArgument.ToString();

            var up = from p in db.subjects
                     where p.sub_id == Convert.ToInt32( HiddenField_sub_edit.Value)
                     select p;
            Label_sub_name.Text = up.First().sub_name;
            TextBox_edit_sub_nmrk.Text = up.First().sub_nmrk.ToString();
            TextBox_edit_sub_pmrk.Text = up.First().sub_pmrk.ToString();
            TextBox_edit_sub_toaltime.Text = up.First().sub_toaltime.ToString();
            TextBox_edit_sub_tq.Text = up.First().sub_tq.ToString();

        }

         if (e.CommandName == "del_st")
        {
            subject sb = db.subjects.First(p => p.sub_id == Convert.ToInt32(e.CommandArgument));           
            db.subjects.DeleteOnSubmit(sb);      
            db.SubmitChanges();
            MultiView_sub.ActiveViewIndex = 0;
            Response.Write("<Script>alert('Deleted Successfully')</Script>");
            bind();
        }

}
     protected void Button_add_Click(object sender, ImageClickEventArgs e)
     {
         MultiView_sub.ActiveViewIndex = 1;
     }
     protected void Button_add_sub_Click(object sender, EventArgs e)
     {
         subject sb = new subject();
         sb.sub_name = TextBox_sub_name.Text;
         sb.sub_nmrk = Convert.ToInt32(TextBox_sub_nmrk.Text);
         sb.sub_pmrk = Convert.ToInt32(TextBox_sub_pmrk.Text);
         sb.sub_toaltime = Convert.ToInt32(TextBox_sub_toaltime.Text);

         db.subjects.InsertOnSubmit(sb);
         
         db.SubmitChanges();
         MultiView_sub.ActiveViewIndex = 0;
         Response.Write("<Script>alert('added Successfully')</Script>");
     }


     protected void Button_update_Click(object sender, EventArgs e)
     {
         subject sb = db.subjects.First(p => p.sub_id == Convert.ToInt32(HiddenField_sub_edit.Value));

         sb.sub_name = Label_sub_name.Text;
         sb.sub_pmrk = Convert.ToInt32(TextBox_edit_sub_pmrk.Text);
         sb.sub_nmrk = Convert.ToInt32(TextBox_edit_sub_nmrk.Text);
         sb.sub_tq = Convert.ToInt32(TextBox_edit_sub_tq.Text);
         sb.sub_toaltime = Convert.ToInt32(TextBox_edit_sub_toaltime.Text);

         db.SubmitChanges();

         MultiView_sub.ActiveViewIndex = 0;
         Response.Write("<Script>alert('Updated Successfully')</Script>");
         bind();

     }
     protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
     {
         if (TextBox_search.Text == "")
         {
             Response.Write("<Script>alert('Please first enter the Roll number that you want to search')</Script>");


             Response.Redirect("Admin_subject.aspx");
         }
         else
         {
             var sc = from p in db.subjects
                      where (p.sub_name.Contains(TextBox_search.Text))
                      // where (p.state_name.StartsWith(TextBox_search.Text))
                      select new
                      {

                          p.sub_id,
                          p.sub_name,
                          p.sub_nmrk,
                          p.sub_pmrk,
                          p.sub_toaltime,
                          p.sub_tq
                      };

             GridView_sub.DataSource = sc;
             GridView_sub.DataBind();
             ImageButton_clear.Visible = true;
         }
     }
     protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("Admin_subject.aspx");
     }
}
