using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Text;


public partial class Admin_fac_reg : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        int n = new Random().Next(1000, 9999);
        TextBox_code.Text = n.ToString();
        TextBox_edit_verify.Text = n.ToString();
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
                    string imgName = Label_fac_edit_id.Text + ".jpg";
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

    private void bind()
    {
        var cc = from p in db.fac_regs

                 select new
                 {
                     p.fac_id,
                     p.fac_name,
                     p.fac_branch,
                     p.fac_email,      
                     p.fac_mobile_no,
                     p.fac_year,
                     p.fac_dp,
                     p.fac_status,
                     p.fac_info
                 };

        var ll = from q in db.logins

                 select new
                 {
                     q.user_type,
                     q.username,
                     q.login_id,
                     q.l_active,
                     q.screen_name
                 };
        GridView_fac_reg.DataSource = cc;
        GridView_fac_reg.DataBind();
    }

    protected void GridView_fac_reg_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit_st")
        {
            MultiView_fac_reg.ActiveViewIndex = 2;
            HiddenField_fac_edit.Value = e.CommandArgument.ToString();

            var up = from p in db.fac_regs
                     where p.fac_id == HiddenField_fac_edit.Value
                     select p;
            Label_fac_edit_id.Text = up.First().fac_id;
            TextBox_edit_fac_name.Text = up.First().fac_name;
            DropDownList_edit_fac_branch.SelectedValue = up.First().fac_branch;
            TextBox_edit_fac_email.Text = up.First().fac_email;
           
            TextBox_edit_fac_mobile_number.Text = up.First().fac_mobile_no;
            TextBox_edit_other_inf.Text = up.First().fac_info;
            DropDownList_edit_yop.SelectedValue = up.First().fac_year.ToString();
            Image_edit_dp.ImageUrl = up.First().fac_dp;
            if (up.First().fac_status == "Active")
            {
                RadioButton_edit_active.Checked = true;
                RadioButton_edit_inactive.Checked = false;
            }
            else
            {
                RadioButton_edit_inactive.Checked = true;
                RadioButton_edit_active.Checked = false;
            }
           

        }

        if (e.CommandName == "del_st")
        {
            fac_reg dl = db.fac_regs.First(p => p.fac_id == e.CommandArgument);
            login lg = db.logins.First(q => q.username == e.CommandArgument);

            db.fac_regs.DeleteOnSubmit(dl);
            db.logins.DeleteOnSubmit(lg);

            db.SubmitChanges();

            MultiView_fac_reg.ActiveViewIndex = 0;
            Response.Write("<Script>alert(' Faculty deleted Successfully')</Script>");
          
            bind();
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
        Response.Redirect("Form_fac.aspx");
    }
    protected void Button_add_Click(object sender, ImageClickEventArgs e)
    {
        MultiView_fac_reg.ActiveViewIndex = 1;
    }
    protected void Button_update_Click(object sender, ImageClickEventArgs e)
    {
        fac_reg fr = db.fac_regs.First(p => p.fac_id == HiddenField_fac_edit.Value);
        login lg_update = db.logins.First(q => q.username == HiddenField_fac_edit.Value);

       
        lg_update.screen_name = TextBox_edit_fac_name.Text;
        if (RadioButton_active.Checked == true)
        {
            lg_update.l_active = RadioButton_active.Text;
        }
        else
        {
            lg_update.l_active = RadioButton_inactive.Text;
        }
        fr.fac_name = TextBox_edit_fac_name.Text;
        fr.fac_branch = DropDownList_edit_fac_branch.SelectedValue;
        fr.fac_email = TextBox_edit_fac_email.Text;    
        fr.fac_mobile_no = TextBox_edit_fac_mobile_number.Text;
        fr.fac_info = TextBox_edit_other_inf.Text;
        fr.fac_year = Convert.ToInt32(DropDownList_edit_yop.SelectedValue);
        fr.fac_dp = HiddenField_edit_path.Value;
        if (RadioButton_active.Checked == true)
        {
            fr.fac_status = RadioButton_active.Text;
        }
        else
        {
            fr.fac_status = RadioButton_inactive.Text;
        }


        db.SubmitChanges();

        MultiView_fac_reg.ActiveViewIndex = 0;
        Response.Write("<Script>alert(' Faculty updated Successfully')</Script>");
     
        bind();
    }



    protected void ImageButton_search_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox_search.Text == "")
        {
            Response.Write("<Script>alert('Please first enter the Faculty name that you want to search')</Script>");
            bind();
        }
        else
        {
            var sc = from p in db.fac_regs
                     where (p.fac_name.Contains(TextBox_search.Text))
                     // where (p.state_name.StartsWith(TextBox_search.Text))
                     select new
                     {
                         p.fac_id,
                         p.fac_name,
                         p.fac_branch,
                         p.fac_email,
                         p.fac_mobile_no,
                         p.fac_year,
                         p.fac_dp,
                         p.fac_status,
                         p.fac_info
                        
                     };

            GridView_fac_reg.DataSource = sc;
            GridView_fac_reg.DataBind();
            ImageButton_clear.Visible = true;
        }
    }
    protected void ImageButton_clear_Click(object sender, ImageClickEventArgs e)
    {
        bind();
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
            var cc = from p in db.fac_regs

                     select new
                     {
                         p.fac_id,
                         p.fac_name,
                         p.fac_branch,
                         p.fac_year,
                         p.fac_email,  
                         p.fac_mobile_no,
                         p.fac_info,
                         p.fac_status
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
    protected void ImageButton_import_excel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("fac_exceltodb.aspx");
    }
}