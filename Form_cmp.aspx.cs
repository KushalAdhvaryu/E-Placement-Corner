using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form_cmp : System.Web.UI.Page
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
                    string imgName = TextBox_cmp_id.Text + ".jpg";
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
        cmp_reg cr = new cmp_reg();
        cr.cmp_id = TextBox_cmp_id.Text;
        cr.cmp_name = TextBox_cmpname.Text;
        cr.cmp_url = TextBox_cmp_url.Text;
        cr.cmp_type = RadioButtonList_cmp_type.SelectedValue;
        cr.cmp_uname = TextBox_uname.Text;
        cr.cmp_email = TextBox_cmp_email.Text;
        cr.cmp_mobile_no = TextBox_cmp_mobile_number.Text;
        cr.cmp_date_of_visit = Text_DATE_OF_visit.Text;
        cr.cmp_tenth = Convert.ToDouble(TextBox_cmp_tenth.Text);
        cr.cmp_twelfth = Convert.ToDouble(TextBox_cmp_twelfth.Text);
        cr.cmp_ppi = Convert.ToDouble(TextBox_ppi_required.Text);
        cr.cmp_active_backlog = Convert.ToInt32(DropDownList_cmp_active_backlog.SelectedValue);
        cr.cmp_total_backlog = Convert.ToInt32(DropDownList_cmp_total_backlog.SelectedValue);
        cr.cmp_package = Convert.ToInt32(TextBox_package.Text);
        cr.cmp_bond = Convert.ToInt32(TextBox_bond.Text);
        cr.cmp_yop = Convert.ToInt32(DropDownList_cmp_yop.SelectedValue);
        cr.cmp_logo = HiddenField_path.Value;
        string branch = null;
        foreach (ListItem li in CheckBoxList_branch.Items)
        {
            if (li.Selected == true)
            {
                branch += li.Value + ", ";

            }

        }
        cr.cmp_branch = branch;

        if (RadioButton_active.Checked == true)
        {
            cr.cmp_status = RadioButton_active.Text;
        }
        else
        {
            cr.cmp_status = RadioButton_inactive.Text;
        }

        cr.cmp_other_perks = TextBox_other_perks.Text;

        login lcedit = new login();
        lcedit.username = TextBox_cmp_id.Text;
        lcedit.password = TextBox_cmp_password.Text;
        lcedit.screen_name = TextBox_cmpname.Text;
        if (RadioButton_active.Checked == true)
        {
            lcedit.l_active = RadioButton_active.Text;
        }
        else
        {
            lcedit.l_active = RadioButton_inactive.Text;
        }
        lcedit.user_type = 2;

        db.cmp_regs.InsertOnSubmit(cr);
        db.logins.InsertOnSubmit(lcedit);
        db.SubmitChanges();
       
      
        Response.Write("<Script>alert('Comapany added Successfully')</Script>");
        TextBox_cmpname.Text = " ";

    }

    protected void CustomValidator_password_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length <= 5)
        {
            Response.Write("<Script>alert('Password should contain at least 6 character.</script>");
        }
    }


    protected void Button_reset_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Form_cmp.aspx");
    }
}