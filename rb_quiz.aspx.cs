using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rb_quiz : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    //int Fst, next = 1, Lst;
    int subject,pmark,nmark,total_time;
    string id;
    public static int Fst;
    public static int next;
    public static int Lst;
    public static int mark;
    public string Ans;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null)
        {
            string url = Convert.ToString(System.Web.HttpContext.Current.Request.Url);
            Response.Redirect("quiz_select.aspx?path=" + url);
        }

        if (Session["login"] != null)
        {
            var g = from p in db.logins
                    where p.login_id == Convert.ToInt32(Session["login"])
                    select p;
            id = g.First().username;

           // if (!IsPostBack)
           // {
                subject = Convert.ToInt32(Session["subid"]);
                pmark = Convert.ToInt32(Session["pmark"]);
                nmark = Convert.ToInt32(Session["nmark"]);
                total_time = Convert.ToInt32(Session["tt"]);
          //  }
        }
    }

    public void Button1_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            RadioButton rb = null;


            if (RadioButton1.Checked == true)
            {
                rb = RadioButton1;
            }

            else if (RadioButton2.Checked == true)
            {
                rb = RadioButton2;

            }
            else if (RadioButton3.Checked == true)
            {
                rb = RadioButton3;

            }
            else if (RadioButton4.Checked == true)
            {
                rb = RadioButton4;

            }


            if (rb == null)
            {
                Response.Write("<Script>alert('Please select one answer..!!')</Script>");

            }
            else
            {


                Ans = rb.Text;
               
                var aa = from p in db.questions
                         where p.q_id == next 
                         select p;
               
                if (aa.Count() > 0)
              {
                  string cans = aa.First().q_ans;
                 
                   
                    if (Ans == cans)
                    {
                        mark = mark + pmark;
                    }

      }
                else
                {
                    next = next + 1;
                    GetQuestion(next, Lst);
                }
                question lst = db.questions.OrderByDescending(l => l.q_id).First();
                Lst = lst.q_id;

                next = next + 1;
                if (next > Lst)
                {
                    Response.Write("<Script>alert('Your Have Completed Your Exam')</Script>");
                    MultiView1.ActiveViewIndex = 2;
                    quiz_result qr = db.quiz_results.First(p => p.roll_no == id);
                    qr.test_1 = mark;
                    db.SubmitChanges();
                    Label_result.Text = Convert.ToString(mark);
                    timer1.Enabled = false;
                    lblTimer.Visible = false;
                    Session["pmark"] = null;
                    Session["nmark"] = null;
                    Session["total_time"] = null;
                }
                else
                {
                    GetQuestion(next, Lst);
                }
            }
        }
    }

    public int GetQuestion(int next, int Lst)
    {

        var aa = from p in db.questions
                 where p.q_id == next 
                 select p;
        if (aa.Count() > 0)
        {
           
            Label2.Text = aa.First().q_statement;
            RadioButton1.Text = aa.First().q_opA;
            RadioButton2.Text = aa.First().q_opB;
            RadioButton3.Text = aa.First().q_opC;
            RadioButton4.Text = aa.First().q_opD;
            RadioButton1.Checked = false;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            RadioButton4.Checked = false;

        }
        else
        {
            next = next + 1;
            GetQuestion(next, Lst);
        }
        return 0;


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        quiz_result qr = db.quiz_results.First(p => p.roll_no == id);
        qr.test_1 = 0;

        if (!SM1.IsInAsyncPostBack)
        {
            lblTimer.Visible = true;
            Session["timeout"] = DateTime.Now.AddSeconds(20).ToString();
        }
        MultiView1.ActiveViewIndex = 1;
        next = 1;
        mark = 0;
        GetQuestion(next, Lst);
    }

    protected void Button_Ls_Click(object sender, EventArgs e)
    {
        //Response.Write(mark);
       // Label_result.Text = Convert.ToString(mark);
       // Label_result.Visible = true;
       // timer1.Enabled = false;
       // lblTimer.Visible = false;
    }

    protected void timer1_tick(object sender, EventArgs e)
    {
        if (0 > DateTime.Compare(DateTime.Now, DateTime.Parse(Session["timeout"].ToString())))
        {
            lblTimer.Text = string.Format("Time Left: 00:{0}:{1}", ((Int32)DateTime.Parse(Session["timeout"].ToString()).Subtract(DateTime.Now).TotalMinutes).ToString(), ((Int32)DateTime.Parse(Session["timeout"].ToString()).Subtract(DateTime.Now).Seconds).ToString());
        }
        else
        {

            timer1.Enabled = true;
            Session["mark"] = mark;
            Response.Redirect("timeout.aspx");
           


        }
    }
}