using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class history_tabular : System.Web.UI.Page
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
        var cc = from p in db.Students

                 select new
                 {
                     p.std_id,
                     p.std_name,
                     p.cmp_id,
                     p.marks,
                     p.y11,
                     p.y12,
                     p.y13,
                     p.y14
                 };

        GridView_placed.DataSource = cc;
        GridView_placed.DataBind();

        var cc1 = from q in db.Student_status

                  select new
                  {
                      q.id,
                      q.Stu_type,
                      q.Stu_no,
                      q.year_11,
                      q.year_12,
                      q.year_13,
                      q.year_14
                  };
        GridView_status.DataSource = cc1;
        GridView_status.DataBind();
    }
}