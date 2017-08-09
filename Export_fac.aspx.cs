using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Text;

public partial class Export_fac : System.Web.UI.Page
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
        var cc = from p in db.fac_regs

                 select new
                 {
                     p.fac_id,
                     p.fac_name,
                     p.fac_branch,
                     p.fac_email,
                     p.fac_status,
                     p.fac_year,
                     p.fac_mobile_no,
                     p.fac_info
                 };

        //var ll = from q in db.logins

        //         select new
        //         {
        //             q.user_type,
        //             q.username,
        //             q.login_id
        //         };
        GridView_fac_reg.DataSource = cc;
        GridView_fac_reg.DataBind();
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
                         p.fac_email,
                         p.fac_status,
                         p.fac_year, 
                         p.fac_mobile_no,
                         p.fac_info
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