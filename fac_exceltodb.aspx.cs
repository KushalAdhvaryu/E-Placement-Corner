using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;
using System.Data;

public partial class fac_exceltodb : System.Web.UI.Page
{
    DataSet myDs = new DataSet();
    string fu = null;
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void FillDataSet()
    {
        try
        {


            Microsoft.Office.Interop.Excel.ApplicationClass app = new Microsoft.Office.Interop.Excel.ApplicationClass();
            Microsoft.Office.Interop.Excel.Worksheet oSheet;

            string strFilename = FileUpload.PostedFile.FileName;
            strFilename = System.IO.Path.GetFileName(strFilename);
            string ext = Path.GetExtension(strFilename);
            bool hasHeaders = true;
            string HDR = hasHeaders ? "Yes" : "No";
            string strConn;

            //check extension of file 

            if (ext.ToLower() == ".xls")
            {


                //creaate connection with excel using OLEDB
                strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + fu + " ;Extended Properties=\"Excel 8.0;HDR=" + HDR + ";IMEX=1\"";

                Microsoft.Office.Interop.Excel.WorkbookClass workBook = (Microsoft.Office.Interop.Excel.WorkbookClass)app.Workbooks.Open(fu, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
                oSheet = (Microsoft.Office.Interop.Excel.Worksheet)workBook.ActiveSheet;
                app.Visible = false;

                //You must use the $ after the object you reference in the spreadsheet

                OleDbDataAdapter myCmd = new OleDbDataAdapter("SELECT * FROM [" + oSheet.Name + "$]", strConn);


                myCmd.Fill(myDs);


                string source = @"E:\ExelFileForDetail\" + strFilename;
                string target = @"E:\ExelFileForDetail\temp\" + strFilename;


                //move file to another folder if exists
                if (File.Exists(target))
                    File.Delete(target);
                File.Move(source, target);
            }

            else if (ext.ToLower() == ".xlsx")
            {



                strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fu + ";Extended Properties=\"Excel 12.0;HDR=" + HDR + ";IMEX=2\"";

                //You must use the $ after the object you reference in the spreadsheet

                Microsoft.Office.Interop.Excel.WorkbookClass workBook = (Microsoft.Office.Interop.Excel.WorkbookClass)app.Workbooks.Open(fu, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
                oSheet = (Microsoft.Office.Interop.Excel.Worksheet)workBook.ActiveSheet;
                app.Visible = false;

                //You must use the $ after the object you reference in the spreadsheet

                OleDbDataAdapter myCmd = new OleDbDataAdapter("SELECT * FROM [" + oSheet.Name + "$]", strConn);

                //fill dataset with your excel data

                myCmd.Fill(myDs);
                string source = @"E:\ExelFileForDetail\" + strFilename;
                string target = @"E:\ExelFileForDetail\temp\" + strFilename;


                if (File.Exists(target))
                    File.Delete(target);
                File.Move(source, target);
            }

            else
            {

                Response.Write("Check the extension of uploaded file.");

            }

        }

        catch (Exception ex)
        {

            Response.Write("Error !" + ex.Message);
        }

    }

    protected void Upload_Click(object sender, EventArgs e)
    {
        try
        {

            DataSet dsDuplicates = new DataSet();

            int x, j;

            string strFilename = FileUpload.PostedFile.FileName;
            strFilename = System.IO.Path.GetFileName(strFilename);
            string ext = Path.GetExtension(strFilename);

            if (ext.ToLower() != ".xls" && ext.ToLower() != ".xlsx")
            {
                string str = "<script language='javascript'>alert('File should be in Excel Format')</script>";

                if (!Page.IsStartupScriptRegistered("clientScript"))
                {
                    Page.RegisterStartupScript("clientScript", str);
                }

                return;


            }

            FileUpload.PostedFile.SaveAs(@"E:\ExelFileForDetail\" + strFilename);

            fu = @"E:\ExelFileForDetail\" + strFilename;
            //string ImDate = txtDate.Value.ToString();
            myDs.Clear();
            int t;
            //Label2.Text = "";
            try
            {
                FillDataSet();
                t = myDs.Tables[0].Rows.Count;
            }
            catch (Exception ex)
            {
                //throw ex;
                Response.Write(ex.Message);
                return;
            }

            DataSet ds1 = new DataSet();

            if (myDs.Tables[0].Rows.Count == 0)
            {
                Response.Write("This file Can not Upload /error in File");
                return;

            }
            t = myDs.Tables[0].Rows.Count;

            try
            {

                for (x = 0; x < myDs.Tables[0].Rows.Count; x++)
                {

                    for (j = 0; j < 28; ) //Traverse loop to all column of your Dataset
                    {
                        fac_reg cr = new fac_reg();
                        cr.fac_id = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        cr.fac_name = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        cr.fac_branch = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        cr.fac_email = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        cr.fac_mobile_no = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        cr.fac_year = Convert.ToInt32(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        cr.fac_dp = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        cr.fac_status = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        cr.fac_info = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;








                        db.StoredProcedure3(cr.fac_id, cr.fac_name, cr.fac_branch, cr.fac_email, cr.fac_mobile_no, cr.fac_year, cr.fac_dp, cr.fac_status, cr.fac_info);


                    }

                }

            }
            catch (Exception ex)
            {
                Response.Write("Error" + ex.Message);

            }

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
        myDs.Clear();

    }
}