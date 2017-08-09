using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class quiz_start : System.Web.UI.Page
{
    int tm;
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getexam();
            GetQuestion();
        }
       
    }

    

    private void getexam()
    {
       if(Session["subid"] != null)
       {
           var cc = from p in db.subjects
                    where p.sub_id == Convert.ToInt32(Session["subid"])
                 select new
                 {
                     p.sub_id,
                     p.sub_name,
                     p.sub_nmrk,
                     p.sub_pmrk,
                     p.sub_toaltime,
                     p.sub_tq
                 };
        Label_sub.Text = cc.First().sub_name;
        Label_time.Text =cc.First().sub_toaltime.ToString();
        tm = cc.First().sub_toaltime;
        Session["noq"] = cc.First().sub_tq;
        ImageButton_pre.Visible = false;
        }
    }

    private void GetQuestion()
    {
        var aa = from k in db.questions
                 select k;
        if(aa.Count() > 0)
        {
            var cc = from p in db.questions
                    where p.sub_id == Convert.ToInt32(Session["subid"])
                 select new
                 {
                     p.sub_id,
                     p.q_ans,
                     p.q_opA,
                     p.q_opB,
                     p.q_opC,
                     p.q_opD,
                     p.q_statement,
                     p.q_id
                 };
            RadioButtonList_option.DataSource = cc;
            RadioButtonList_option.DataTextField = "q_opA";
            RadioButtonList_option.DataValueField="q_id";
            RadioButtonList_option.DataBind();

            Session["dt"] = cc.First().sub_id;
            Session["rindex"] = 0;

            Label_que.Text = cc.First().q_statement;

            //rbtna.Text = Convert.ToString(dt.Rows[0]["A"]);
            //rbtnb.Text = Convert.ToString(dt.Rows[0]["B"]);
            //rbtnc.Text = Convert.ToString(dt.Rows[0]["C"]);
            //rbtnd.Text = Convert.ToString(dt.Rows[0]["D"]);
            Session["qid"] = Convert.ToInt16(cc.First().q_id);
            Session["inc"] = 1;
            Label_qn.Text =  "1          Out Of     " +Convert.ToString(Session["noq"]);

        }
         else
        {
            Response.Write("No Question In Subject");
        }
    }

    protected void ImageButton_next_Click(object sender, ImageClickEventArgs e)
    {
        insertTemp();
        ImageButton_pre.Visible = true;

        if (Convert.ToInt16(Session["noq"]) != Convert.ToInt16(Session["inc"]))
        {
            Session["inc"] = 1 + Convert.ToInt16(Session["inc"]);
            Session["rindex"] = Convert.ToInt16(Session["rindex"]) + 1;
            getquestion();

            Label_qn.Text = Convert.ToString(Session["inc"]) + "          Out Of     " + Convert.ToString(Session["noq"]);
            getquestionbyqid();
        }
        else
        {
            ImageButton_next.Visible = false;
        }
        

    }

    private void getquestionbyqid()
    {
        
    }

    private void getquestion()
    {
        
    }

    private void insertTemp()
    {
       
    }
    protected void ImageButton_pre_Click(object sender, ImageClickEventArgs e)
    {
        insertTemp();


        Session["inc"] = Convert.ToInt16(Session["inc"]) - 1;
        if (1 != Convert.ToInt16(Session["inc"]))
        {

            Session["rindex"] = Convert.ToInt16(Session["rindex"]) - 1;
            getquestion();

            Label_qn.Text = Convert.ToString(Session["rindex"]) + "          Out Of     " + Convert.ToString(Session["noq"]);
            getquestionbyqid();
        }
        else
        {
            ImageButton_pre.Visible = false;
        }
    }
    protected void ImageButton_end_Click(object sender, ImageClickEventArgs e)
    {
        Session["endtime"] = DateTime.Now;
        Response.Write("<script>alert('You successfully ended your test')</script>")
    }

}

