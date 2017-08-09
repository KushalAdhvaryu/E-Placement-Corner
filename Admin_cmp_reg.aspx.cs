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

using System.Text;

public partial class Admin_cmp_reg : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        int n = new Random().Next(1000, 9999);
        TextBox_code.Text = n.ToString();
        TextBox_edit_code.Text = n.ToString();
        if (!IsPostBack)
        {
            bind();
        }
        if (FileUpload_dp.PostedFile != null && FileUpload_dp.PostedFile.ContentLength > 0)
        {
            UpLoadAndDisplay();
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
                    string imgName = Label_cmp_edit_id.Text + ".jpg";
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

    private void bind()
    {
        var cc = from p in db.cmp_regs

                 select new
                 {
                     p.cmp_id,
                     p.cmp_name,
                     p.cmp_url,
                     p.cmp_type,
                     p.cmp_uname,
                     p.cmp_email,        
                     p.cmp_mobile_no,
                     p.cmp_date_of_visit,
                     p.cmp_yop,
                     p.cmp_tenth,
                     p.cmp_twelfth,
                     p.cmp_ppi,
                     p.cmp_active_backlog,
                     p.cmp_total_backlog,
                     p.cmp_branch,
                     p.cmp_package,
                     p.cmp_bond,
                     p.cmp_status,
                     p.cmp_logo,       
                     p.cmp_other_perks
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
        GridView_cmp_reg.DataSource = cc;
        GridView_cmp_reg.DataBind();
    }

    protected void GridView_cmp_reg_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            MultiView_cmp_reg.ActiveViewIndex = 2;
            HiddenField_cmp_edit.Value = e.CommandArgument.ToString();

            var up = from p in db.cmp_regs
                     where p.cmp_id == HiddenField_cmp_edit.Value
                     select p;
            Label_cmp_edit_id.Text = up.First().cmp_id;
            TextBox_edit_cmpname.Text = up.First().cmp_name;
            TextBox_edit_cmp_url.Text = up.First().cmp_url;
            RadioButtonList_edit_cmp_type.SelectedValue = up.First().cmp_type;
            TextBox_edit_uname.Text = up.First().cmp_uname;
            TextBox_edit_cmp_email.Text = up.First().cmp_email;
         
            TextBox_edit_cmp_mobile_number.Text = up.First().cmp_mobile_no;
            Text_edit_DATE_OF_visit.Text = up.First().cmp_date_of_visit;
            TextBox_edit_cmp_tenth.Text = up.First().cmp_tenth.ToString();
            TextBox_edit_cmp_twelfth.Text = up.First().cmp_twelfth.ToString();
            TextBox_edit_ppi_required.Text = up.First().cmp_ppi.ToString();
            DropDownList_edit_active_backlog.SelectedValue = up.First().cmp_active_backlog.ToString();
            DropDownList_edit_total_backlog.SelectedValue = up.First().cmp_total_backlog.ToString();
            TextBox_edit_package.Text = up.First().cmp_package.ToString();
            TextBox_edit_bond.Text = up.First().cmp_bond.ToString();
            DropDownList_cmp_yop.SelectedValue = up.First().cmp_yop.ToString();
            Image_edit_dp.ImageUrl = up.First().cmp_logo;
     
            foreach (ListItem li in CheckBoxList_edit_branch.Items)
            {
                if (up.First().cmp_branch.Contains("IT") && li.Value == "IT")
            {
                li.Selected = true;
            }
                if (up.First().cmp_branch.Contains("CE") && li.Value == "CE")
                {
                    li.Selected = true;
                }
                if (up.First().cmp_branch.Contains("EC") && li.Value == "EC")
                {
                    li.Selected = true;
                }
                if (up.First().cmp_branch.Contains("CL") && li.Value == "CL")
                {
                    li.Selected = true;
                }
                if (up.First().cmp_branch.Contains("CH") && li.Value == "CH")
                {
                    li.Selected = true;
                }
                if (up.First().cmp_branch.Contains("EE") && li.Value == "EE")
                {
                    li.Selected = true;
                }
                if (up.First().cmp_branch.Contains("ME") && li.Value == "ME")
                {
                    li.Selected = true;
                }
                if (up.First().cmp_branch.Contains("IC") && li.Value == "IC")
                {
                    li.Selected = true;
                }
            }
            
            if (up.First().cmp_status == "Active")
            {
                RadioButton_edit_active.Checked = true;
                RadioButton_edit_inactive.Checked = false;
            }
            else
            {
                RadioButton_edit_inactive.Checked = true;
                RadioButton_edit_active.Checked = false;
            }
            
            TextBox_edit_other_perks.Text = up.First().cmp_other_perks;

        }

        if (e.CommandName == "del_st")
        {
            cmp_reg dl = db.cmp_regs.First(p => p.cmp_id == e.CommandArgument);
            login lcdel = db.logins.First(q => q.username == e.CommandArgument);
            db.cmp_regs.DeleteOnSubmit(dl);
            db.logins.DeleteOnSubmit(lcdel);
            db.SubmitChanges();
            MultiView_cmp_reg.ActiveViewIndex = 0;
            Response.Write("<Script>alert('Comapany deleted Successfully')</Script>");
            
            bind();
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
        cr.cmp_tenth = Convert.ToDouble( TextBox_cmp_tenth.Text);
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
        MultiView_cmp_reg.ActiveViewIndex = 0;
        bind();
        Response.Write("<Script>alert('Comapany added Successfully')</Script>");
        TextBox_cmpname.Text = " ";
    }
    protected void Button_update_Click(object sender, ImageClickEventArgs e)
    {
        cmp_reg cr = db.cmp_regs.First(p => p.cmp_id == HiddenField_cmp_edit.Value);
        login lcupdate = db.logins.First(q => q.username == HiddenField_cmp_edit.Value);

   
        lcupdate.screen_name = TextBox_edit_cmpname.Text;
        if (RadioButton_active.Checked == true)
        {
            lcupdate.l_active = RadioButton_active.Text;
        }
        else
        {
            lcupdate.l_active = RadioButton_inactive.Text;
        }
        cr.cmp_name = TextBox_edit_cmpname.Text;
        cr.cmp_url = TextBox_edit_cmp_url.Text;
        cr.cmp_type = RadioButtonList_edit_cmp_type.SelectedValue;
        cr.cmp_uname = TextBox_edit_uname.Text;
        cr.cmp_email = TextBox_edit_cmp_email.Text;
        cr.cmp_mobile_no = TextBox_edit_cmp_mobile_number.Text;
        cr.cmp_date_of_visit = Text_edit_DATE_OF_visit.Text;
        cr.cmp_tenth = Convert.ToDouble(TextBox_edit_cmp_tenth.Text);
        cr.cmp_twelfth = Convert.ToDouble(TextBox_edit_cmp_twelfth.Text);
        cr.cmp_ppi = Convert.ToDouble(TextBox_edit_ppi_required.Text);
        cr.cmp_active_backlog = Convert.ToInt32(DropDownList_edit_active_backlog.SelectedValue);
        cr.cmp_total_backlog = Convert.ToInt32(DropDownList_edit_total_backlog.SelectedValue);
        cr.cmp_package = Convert.ToInt32(TextBox_edit_package.Text);
        cr.cmp_bond = Convert.ToInt32(TextBox_edit_bond.Text);
        cr.cmp_yop = Convert.ToInt32(DropDownList_edit_yop.SelectedValue);
        cr.cmp_logo = HiddenField_edit_path.Value;
        string branch = null;
        foreach (ListItem li in CheckBoxList_edit_branch.Items)
        {
            if (li.Selected == true)
            {
                branch += li.Value + ", ";

            }

        }
        cr.cmp_branch = branch;
        if (RadioButton_edit_active.Checked == true)
        {
            cr.cmp_status = RadioButton_edit_active.Text;
        }
        else
        {
            cr.cmp_status = RadioButton_edit_inactive.Text;
        }
       
        cr.cmp_other_perks = TextBox_edit_other_perks.Text;
        db.SubmitChanges();
        MultiView_cmp_reg.ActiveViewIndex = 0;
        Response.Write("<Script>alert('Comapany updated Successfully')</Script>");
      
        bind();
    }
    protected void Button_add_Click(object sender, ImageClickEventArgs e)
    {
        MultiView_cmp_reg.ActiveViewIndex = 1;
    }
    protected void Button_reset_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Form_cmp.aspx");
    }
    protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
    {

        if (TextBox_search.Text == "")
        {
            Response.Write("<Script>alert('Please first enter the company name that you want to search')</Script>");
            Response.Redirect("Admin_cmp_reg.aspx");
        }
        else
        {
            var sc = from p in db.cmp_regs
                     where (p.cmp_name.Contains(TextBox_search.Text))
                     // where (p.state_name.StartsWith(TextBox_search.Text))
                     select new
                     {
                         p.cmp_id,
                         p.cmp_name,
                         p.cmp_url,
                         p.cmp_type,
                         p.cmp_uname,
                         p.cmp_email,
                         p.cmp_mobile_no,
                         p.cmp_date_of_visit,
                         p.cmp_yop,
                         p.cmp_tenth,
                         p.cmp_twelfth,
                         p.cmp_ppi,
                         p.cmp_active_backlog,
                         p.cmp_total_backlog,
                         p.cmp_branch,
                         p.cmp_package,
                         p.cmp_bond,
                         p.cmp_status,
                         p.cmp_logo,
                         p.cmp_other_perks
                     };

            GridView_cmp_reg.DataSource = sc;
            GridView_cmp_reg.DataBind();
            ImageButton_clear.Visible = true;
        }
    }
    protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Admin_cmp_reg.aspx");
    }
    protected void CustomValidator_password_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length <= 5)
        {
            Response.Write("<Script>alert('Password should contain at least 6 character.</script>");
        }
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        try
        {
            var cc = from p in db.cmp_regs

                     select new
                     {
                         p.cmp_id,
                         p.cmp_name,
                         p.cmp_url,
                         p.cmp_type,
                         p.cmp_uname,
                         p.cmp_email,
                         p.cmp_mobile_no,
                         p.cmp_date_of_visit,
                         p.cmp_yop,
                         p.cmp_tenth,
                         p.cmp_twelfth,
                         p.cmp_ppi,
                         p.cmp_active_backlog,
                         p.cmp_total_backlog,
                         p.cmp_branch,
                         p.cmp_package,
                         p.cmp_bond,
                         p.cmp_status,
                         p.cmp_other_perks
                     };

            string Path = "E:\\ImportExcelFromDatabase\\myexcelfile_" + DateTime.Now.Day.ToString() + "_" + DateTime.Now.Month.ToString() + ".xls";
            FileInfo FI = new FileInfo(Path);
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWriter);
            DataGrid DataGrd = new DataGrid();
            DataGrd.DataSource = cc;
            DataGrd.DataBind();

            DataGrd.RenderControl(htmlWrite);
            string directory = Path.Substring(0, Path.LastIndexOf("\\"));// GetDirectory(Path);
            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }

            System.IO.StreamWriter vw = new System.IO.StreamWriter(Path, true);
            stringWriter.ToString().Normalize();
            vw.Write(stringWriter.ToString());
            vw.Flush();
            vw.Close();
            WriteAttachment(FI.Name, "application/vnd.ms-excel", stringWriter.ToString());
        }
        catch (Exception ex)
        {
            //throw new Exception(ex.Message);
        }
    }

    public static void WriteAttachment(string FileName, string FileType, string content)
    {
        HttpResponse Response = System.Web.HttpContext.Current.Response;
        Response.ClearHeaders();
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + FileName);
        Response.ContentType = FileType;
        Response.Write(content);
        Response.End();

    }
}