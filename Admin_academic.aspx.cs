using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

using System.IO;
//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using iTextSharp.text.html;
//using iTextSharp.text.html.simpleparser;
using System.Text;


public partial class Admin_academic : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        int n = new Random().Next(1000, 9999);
       
        TextBox_edit_code.Text = n.ToString();
        if (!IsPostBack)
        {
            bind();
        }      

        if (FileUpload_edit_dp.PostedFile != null && FileUpload_edit_dp.PostedFile.ContentLength > 0)
        {
            UpLoadAndDisplay_edit();
        }
    }

    private void UpLoadAndDisplay_edit()
    {
        if (FileUpload_edit_dp.HasFile == true)
        {

            String ext = FileUpload_edit_dp.FileName.Substring(FileUpload_edit_dp.FileName.Length - 3);
            if (ext.ToUpper() != "JPG")
            {


                Response.Write("<script>alert('invalid file extension')</script>");


            }
            else if (FileUpload_edit_dp.PostedFile.ContentLength > 307200)
            {
                Response.Write("<script>alert('Invalid file size. Size should be less than 300kb')</script>");
            }
            else
            {
                String path = string.Empty;
                path = Server.MapPath("~/DP/");
                String dbpath = string.Empty;
                dbpath = "~/DP/";

                if (FileUpload_edit_dp.PostedFile != null && FileUpload_edit_dp.PostedFile.FileName != "")
                {
                    string imgName = Label_roll_no.Text + ".jpg";
                    FileUpload_edit_dp.SaveAs(path + imgName);
                    Image_edit_dp.ImageUrl = dbpath + imgName;
                    //  FileUpload_dp.FileName = TextBox_roll_no.Text + ".jpg";
                    HiddenField_edit_path.Value = path + imgName;
                    HiddenField_edit_name.Value = imgName;
                    TextBox2.Text = HiddenField_edit_path.Value;
                    TextBox2.Visible = true;



                    Response.Write(" <script>alert('file uploaded Successfully')</script> ");
                }
            }
        }
        else
        {
            Response.Write(" <script>alert('No file uploaded')</script> ");
        }


    }

  


    private void bind()
    {
        var cc = from p in db.registrations

                 select new
                 {
                     p.roll_no,
                     p.branch,
                     p.f_name,
                     p.l_name,
                     p.email,              
                     p.mobile,
                     p.date_of_birth,
                     p.gender,
                     p.ppi,
                     p.active_backlog,
                     p.total_backlog,
                     p.year_of_passing,
                     p.other_info,
                     p.resume,
                     p.pro_pic,
                     p.tenth,
                     p.twelfth,
                     p.sem_1,
                     p.sem_2,
                     p.sem_3,
                     p.sem_4,
                     p.sem_5,
                     p.sem_6,
                     p.sem_7,
                     p.sem_8,
                     p.status,
                     p.active,
                     p.placedat

                 };

        var ll = from q in db.logins
                 select new
                 {
                     q.user_type,
                     q.username,
                     q.login_id,
                     q.screen_name,
                     q.l_active
                 };
        GridView_reg.DataSource = cc;
        GridView_reg.DataBind();
    }

    protected void Button_add_Click(object sender, EventArgs e)
    {
        MultiView_reg.ActiveViewIndex = 1;
    }

    protected void GridView_reg_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            MultiView_reg.ActiveViewIndex = 2;
            HiddenField_edit.Value = e.CommandArgument.ToString();

            var up = from p in db.registrations
                     where p.roll_no == HiddenField_edit.Value
                     select p;
            Label_roll_no.Text = up.First().roll_no;
            DropDownList_edit_branch.SelectedValue = up.First().branch;
            TextBox_edit_f_name.Text = up.First().f_name;
            TextBox_edit_l_name.Text = up.First().l_name;
            TextBox_edit_email.Text = up.First().email; 
            TextBox_edit_mobile_number.Text = up.First().mobile;
            TextBox_edit_date_of_birth.Text = up.First().date_of_birth;
            RadioButtonList_edit_gender.SelectedValue = up.First().gender;
            TextBox_edit_ppi.Text = up.First().ppi.ToString();
            DropDownList_edit_active_backlog.SelectedValue = up.First().active_backlog.ToString();
            DropDownList_edit_totalbacklog.SelectedValue = up.First().total_backlog.ToString();
            DropDownList_edit_yop.SelectedValue = up.First().year_of_passing.ToString();
            TextBox_edit_sem1.Text = up.First().sem_1.ToString();
            TextBox_edit_sem2.Text = up.First().sem_2.ToString();
            TextBox_edit_sem3.Text = up.First().sem_3.ToString();
            TextBox_edit_sem4.Text = up.First().sem_4.ToString();
            TextBox_edit_sem5.Text = up.First().sem_5.ToString();
            TextBox_edit_sem6.Text = up.First().sem_6.ToString();
            TextBox_edit_sem7.Text = up.First().sem_7.ToString();
            TextBox_edit_sem8.Text = up.First().sem_8.ToString();
            TextBox_edit_std10.Text = up.First().tenth.ToString();
            TextBox_edit_std12.Text = up.First().twelfth.ToString();
            DropDownList_edit_status.SelectedValue = up.First().status;
            if (up.First().active == "Active")
            {
                RadioButton_edit_active.Checked = true;
                RadioButton_edit_inactive.Checked = false;
            }
            else
            {
                RadioButton_edit_inactive.Checked = true;
                RadioButton_edit_active.Checked = false;
            }
            Image_edit_dp.ImageUrl = up.First().pro_pic;
            TextBox_edit_other_info.Text = up.First().other_info;
        }       
    }

    protected void Button_update_Click(object sender, EventArgs e)
    {

        registration re = db.registrations.First(p => p.roll_no == HiddenField_edit.Value);
        login lr_update = db.logins.First(q => q.username == HiddenField_edit.Value);

        lr_update.password = TextBox_edit_password.Text;
        lr_update.screen_name = TextBox_edit_f_name.Text;
        if (RadioButton_edit_active.Checked == true)
        {
            lr_update.l_active = RadioButton_edit_active.Text;
        }
        else
        {
            lr_update.l_active = RadioButton_edit_inactive.Text;
        }

        re.f_name = TextBox_edit_f_name.Text;
        re.branch = DropDownList_edit_branch.SelectedValue;
        re.l_name = TextBox_edit_l_name.Text;
        re.email = TextBox_edit_email.Text;
        re.mobile = TextBox_edit_mobile_number.Text;
        re.date_of_birth = TextBox_edit_date_of_birth.Text;
        re.gender = RadioButtonList_edit_gender.SelectedValue;
        re.ppi = Convert.ToDouble(TextBox_edit_ppi.Text);
        re.active_backlog = Convert.ToInt32(DropDownList_edit_active_backlog.SelectedValue);
        re.total_backlog = Convert.ToInt32(DropDownList_edit_totalbacklog.SelectedValue);
        re.year_of_passing = Convert.ToInt32(DropDownList_edit_yop.SelectedValue);
        re.tenth = Convert.ToDouble(TextBox_edit_std10.Text);
        re.twelfth = Convert.ToDouble(TextBox_edit_std12.Text);
        re.sem_1 = Convert.ToDouble(TextBox_edit_sem1.Text);
        re.sem_2 = Convert.ToDouble(TextBox_edit_sem2.Text);
        re.sem_3 = Convert.ToDouble(TextBox_edit_sem3.Text);
        re.sem_4 = Convert.ToDouble(TextBox_edit_sem4.Text);
        re.sem_5 = Convert.ToDouble(TextBox_edit_sem5.Text);
        re.sem_6 = Convert.ToDouble(TextBox_edit_sem6.Text);
        re.sem_7 = Convert.ToDouble(TextBox_edit_sem7.Text);
        re.sem_8 = Convert.ToDouble(TextBox_edit_sem8.Text);
        re.status = DropDownList_edit_status.SelectedValue;
        re.pro_pic = HiddenField_edit_path.Value;
        if (RadioButton_edit_active.Checked == true)
        {
            re.active = RadioButton_edit_active.Text;
        }
        else
        {
            re.active = RadioButton_edit_inactive.Text;
        }

        re.other_info = TextBox_edit_other_info.Text;
        if (FileUpload_edit_resume.HasFile == true)
        {
            String ext = FileUpload_edit_resume.FileName.Substring(FileUpload_edit_resume.FileName.Length - 3);
            String path = string.Empty;
            path = Server.MapPath("~/Category");
            String dbpath = string.Empty;
            dbpath = "~/Category";
            switch (ext.ToUpper())
            {
                case "DOC":
                    dbpath = dbpath + "/DOC/";
                    break;
                case "JPG":
                    dbpath = dbpath + "/JPG/";
                    break;
                case "PDF":
                    dbpath = dbpath + "/PDF/";
                    break;
                default:
                    break;
            }
            Response.Write("Extention :" + ext);
            FileUpload_edit_resume.SaveAs(path + FileUpload_edit_resume.FileName);
            Response.Write(" file uploaded Successfully ");
            re.resume = dbpath + FileUpload_edit_resume.FileName;

        }

        db.SubmitChanges();
        MultiView_reg.ActiveViewIndex = 0;
        Response.Write("Updated Successfully");
        bind();

    }

    protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox_search.Text == "")
        {
            Response.Write("<Script>alert('Please first enter the Roll number that you want to search')</Script>");
            Response.Redirect("Admin_stud_reg.aspx");
        }
        else
        {
            var sc = from p in db.registrations
                     where (p.roll_no.Contains(TextBox_search.Text))
                     // where (p.state_name.StartsWith(TextBox_search.Text))
                     select new
                     {
                         p.roll_no,
                         p.branch,
                         p.f_name,
                         p.l_name,
                         p.email,  
                         p.mobile,
                         p.date_of_birth,
                         p.gender,
                         p.ppi,
                         p.active_backlog,
                         p.total_backlog,
                         p.year_of_passing,
                         p.other_info,
                         p.resume,
                         p.pro_pic,
                         p.tenth,
                         p.twelfth,
                         p.sem_1,
                         p.sem_2,
                         p.sem_3,
                         p.sem_4,
                         p.sem_5,
                         p.sem_6,
                         p.sem_7,
                         p.sem_8,
                         p.status,
                         p.active,
                         p.placedat
                     };

            GridView_reg.DataSource = sc;
            GridView_reg.DataBind();
            ImageButton_clear.Visible = true;
        }
    }

    protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_stud_reg.aspx");
    }

    protected void GridView_reg_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView_reg.PageIndex = e.NewPageIndex;
        bind();
    }
}
