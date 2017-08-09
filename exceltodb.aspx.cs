using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;
using System.Data;

public partial class exceltodb : System.Web.UI.Page
{
    DataSet myDs = new DataSet();
    string fu = null;
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }

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
                        registration rg = new registration();
                        rg.roll_no = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.branch = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.f_name = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.l_name = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.email = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                       
                        rg.mobile = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.date_of_birth = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.gender = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.ppi = Convert.ToInt32(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.active_backlog = Convert.ToInt32(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.total_backlog = Convert.ToInt32(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.year_of_passing = Convert.ToInt32(myDs.Tables[0].Rows[x][j]); j = j + 1;                                          
                      rg.other_info = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.resume = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.pro_pic = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.tenth = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.twelfth = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.sem_1 = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.sem_2 = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.sem_3 = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.sem_4 = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.sem_5 = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.sem_6 = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.sem_7 = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.sem_8 = Convert.ToDouble(myDs.Tables[0].Rows[x][j]); j = j + 1;
                        rg.status = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.active = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;
                        rg.placedat = Convert.ToString(myDs.Tables[0].Rows[x][j]).ToString(); j = j + 1;

                        db.StoredProcedure1(rg.roll_no, rg.branch, rg.f_name, rg.l_name, rg.email, rg.mobile, rg.date_of_birth, rg.gender, rg.ppi, rg.active_backlog, rg.total_backlog, rg.year_of_passing, rg.other_info, rg.resume,rg.pro_pic,rg.tenth,rg.twelfth,rg.sem_1,rg.sem_2,rg.sem_3,rg.sem_4,rg.sem_5,rg.sem_6,rg.sem_7,rg.sem_8,rg.status,rg.active, rg.placedat);
                      
                       
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