using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

public partial class change_password : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null)
        {
            string url = Convert.ToString(System.Web.HttpContext.Current.Request.Url);
            Response.Redirect("login_page.aspx?path=" + url);
        }
        if (Session["login"] != null)
        {
           
        }

    }
    protected void TextBox_current_pwd_TextChanged(object sender, EventArgs e)
    {
        var g = from p in db.logins
                where p.login_id == Convert.ToInt32(Session["login"])
                select p;
     
        if ( TextBox_current_pwd.Text == g.First().password)
        {
            TextBox_new_pwd.Visible = true;
            TextBox_confirm_pwd.Visible = true;
            Label_new_pwd.Visible = true;
            Label_confirm_pwd.Visible = true;
            TextBox_current_pwd.Visible = false;
            Label_current_pwd.Visible = false;
            Button_update.Visible = true;
        }
        else
        {
            Response.Write(" <script>alert('Please enter correct password')</script> ");
        }
    }
    protected void Button_update_Click(object sender, ImageClickEventArgs e)
    {
        var g = from p in db.logins
                where p.login_id == Convert.ToInt32(Session["login"])
                select p;

        string unique = g.First().username;

        login lg = db.logins.First(p => p.login_id == Convert.ToInt32(Session["login"]));
     
        lg.password = TextBox_new_pwd.Text;
        lg.encrypt = MySHA512();
        db.SubmitChanges();

        Response.Write(" <script>alert('Password changed Succesfuly')</script> ");

        TextBox_new_pwd.Visible = false;
        TextBox_confirm_pwd.Visible = false;
        Label_new_pwd.Visible = false;
        Label_confirm_pwd.Visible = false;
        TextBox_current_pwd.Visible = true;
        Label_current_pwd.Visible = true;
        Button_update.Visible = false;
    }

    protected string MySHA512()
    {
        SHA512 sha512 = new System.Security.Cryptography.SHA512Managed();

        byte[] sha512Bytes = System.Text.Encoding.Default.GetBytes(TextBox_new_pwd.Text);
        byte[] cryString = sha512.ComputeHash(sha512Bytes);
        string sha512Str = string.Empty;
        for (int i = 0; i < cryString.Length; i++)
        {
            sha512Str += cryString[i].ToString("X");
        }
        return sha512Str;
    }
    protected void CustomValidator_password_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length <= 5)
        {
            Response.Write("<Script>alert('Password should contain at least 6 character.</script>");
        }
    }
}