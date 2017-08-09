using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form_fac : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        int n = new Random().Next(1000, 9999);
        TextBox_code.Text = n.ToString();
        if (FileUpload_dp.PostedFile != null && FileUpload_dp.PostedFile.ContentLength > 0)
        {
            UpLoadAndDisplay();
        }

    }

    private void UpLoadAndDisplay()
    {
        if (FileUpload_dp.HasFile == true)
        {

            String ext = FileUpload_dp.FileName.Substring(FileUpload_dp.FileName.Length - 3);
            if (ext.ToUpper() != "JPG")
            {


                Response.Write("<script>alert('invalid file extension')</script>");


            }
            else if (FileUpload_dp.PostedFile.ContentLength > 307200)
            {
                Response.Write("<script>alert('Invalid file size. Size should be less than 300kb')</script>");
            }
            else
            {
                String path = string.Empty;
                path = Server.MapPath("~/DP/");
                String dbpath = string.Empty;
                dbpath = "~/DP/";

                if (FileUpload_dp.PostedFile != null && FileUpload_dp.PostedFile.FileName != "")
                {
                    string imgName = TextBox_fac_id.Text + ".jpg";
                    FileUpload_dp.SaveAs(path + imgName);
                    Image_dp.ImageUrl = dbpath + imgName;
                    //  FileUpload_dp.FileName = TextBox_roll_no.Text + ".jpg";
                    HiddenField_path.Value = path + imgName;
                    HiddenField_name.Value = imgName;
                    TextBox1.Text = HiddenField_path.Value;
                    TextBox1.Visible = true;



                    Response.Write(" <script>alert('file uploaded Successfully')</script> ");
                }
            }
        }
        else
        {
            Response.Write(" <script>alert('No file uploaded')</script> ");
        }
    }

    protected void Button_submit_Click(object sender, ImageClickEventArgs e)
    {
        fac_reg fr = new fac_reg();
        fr.fac_id = TextBox_fac_id.Text;
        fr.fac_name = TextBox_fac_name.Text;
        fr.fac_branch = DropDownList_fac_branch.SelectedValue;
        fr.fac_email = TextBox_fac_email.Text;
        fr.fac_mobile_no = TextBox_fac_mobile_number.Text;
        fr.fac_info = TextBox_fac_inf.Text;
        fr.fac_year = Convert.ToInt32(DropDownList_fac_yop.SelectedValue);
        fr.fac_dp = HiddenField_path.Value;
        if (RadioButton_active.Checked == true)
        {
            fr.fac_status = RadioButton_active.Text;
        }
        else
        {
            fr.fac_status = RadioButton_inactive.Text;
        }


        login lg_add = new login();
        lg_add.username = TextBox_fac_id.Text;
        lg_add.password = TextBox_fac_password.Text;
        lg_add.screen_name = TextBox_fac_name.Text;
        if (RadioButton_active.Checked == true)
        {
            lg_add.l_active = RadioButton_active.Text;
        }
        else
        {
            lg_add.l_active = RadioButton_inactive.Text;
        }
        lg_add.user_type = 3;

        db.fac_regs.InsertOnSubmit(fr);
        db.logins.InsertOnSubmit(lg_add);
        db.SubmitChanges();

        Response.Write("<Script>alert(' Faculty added Successfully')</Script>");
        Response.Redirect("Admin_fac_reg.aspx");
        TextBox_fac_name.Text = " ";
    }
    protected void Button_reset_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("faculty_reg.aspx");
    }

    protected void CustomValidator_password_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length <= 5)
        {
            Response.Write("<Script>alert('Password should contain at least 6 character.</script>");
        }
    }
}