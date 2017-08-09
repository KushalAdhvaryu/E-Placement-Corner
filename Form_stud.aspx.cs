using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Collections;

public partial class Form_stud : System.Web.UI.Page
{

    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        int n = new Random().Next(1000, 9999);
        TextBox_code.Text = n.ToString();

        if (!IsPostBack)
        {
            bind();
        }
    }

    private void bind()
    {
        var cc = from p in db.registrations
                 select new
                 {
                     p.roll_no,
                     p.branch
                 };
        //var ddc = from k in db.registrations
        //          select k;
        //DropDownList_branch.DataSource = ddc;
        //DropDownList_branch.DataTextField = "branch";
        //DropDownList_branch.DataValueField = "branch";
        //DropDownList_branch.DataBind();

    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {

    }
    protected void Button_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("reg.aspx");
    }
    protected void Button_submit_Click(object sender, EventArgs e)
    {
        registration re = new registration();
        re.roll_no = TextBox_roll_no.Text;
        re.branch = DropDownList_branch.SelectedValue;
        re.f_name = TextBox_fname.Text;
        re.l_name = TextBox_lname.Text;
        //re.age = Convert.ToInt32(TextBox_age.Text);
        re.email = TextBox_email.Text;
        re.password = TextBox_password.Text;
        re.mobile = TextBox_mobile_number.Text;
        re.date_of_birth = txtDATE_OF_BIRTH.Text;
        re.gender = RadioButtonList_gender.SelectedValue;
        re.ppi = Convert.ToDouble(TextBox_ppi.Text);
        re.active_backlog = Convert.ToInt32(DropDownList_active_backlog.SelectedValue);
        re.total_backlog = Convert.ToInt32(DropDownList_total_backlog.SelectedValue);
        re.min_pack = Convert.ToInt32(DropDownList_min_package.SelectedValue);
        re.area_of_interest = CheckBoxList_area_of_interest.SelectedValue;
        re.other_info = TextBox_other_info.Text;



        String ext = FileUpload_resume.FileName.Substring(FileUpload_resume.FileName.Length - 3);
        String path = string.Empty;
        path = Server.MapPath("~/Category");
        String dbpath = string.Empty;
        dbpath = "~/Category";
        switch (ext.ToUpper())
        {
            case "DOC":
                path = path + "/doc/";
                break;
            case "JPG":
                path = path + "/jpg/";
                break;
            case "PDF":
                path = path + "/pdf/";
                break;
            default:
                break;
        }
        Response.Write("Extention :" + ext);


        FileUpload_resume.SaveAs(path + FileUpload_resume.FileName);

        Response.Write(" file uploaded Successfully ");

        re.resume = dbpath + FileUpload_resume.FileName;

        login lr = new login();
        lr.username = TextBox_roll_no.Text;
        lr.password = TextBox_password.Text;
        lr.user_type = 1;


        db.registrations.InsertOnSubmit(re);
        db.logins.InsertOnSubmit(lr);
        db.SubmitChanges();
        bind();
        Response.Write("added Successfully");

        TextBox_roll_no.Text = "";
    }




    protected void Button_upload_Click(object sender, EventArgs e)
    {
        String ext = FileUpload_resume.FileName.Substring(FileUpload_resume.FileName.Length - 3);
        String path = string.Empty;
        path = Server.MapPath("~/Category");
        switch (ext.ToUpper())
        {
            case "DOC":
                path = path + "/doc/";
                break;
            case "JPG":
                path = path + "/jpg/";
                break;
            case "PDF":
                path = path + "/pdf/";
                break;
            default:
                break;
        }
        Response.Write("Extention :" + ext);


        FileUpload_resume.SaveAs(path + FileUpload_resume.FileName);

        Response.Write(" file uploaded Successfully ");
    }
    protected void TextBox_lname_TextChanged(object sender, EventArgs e)
    {

    }
}