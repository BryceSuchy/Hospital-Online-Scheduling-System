using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace HOSS
{
    public partial class Messages : System.Web.UI.Page
    {
        UsersEntities3 dbcont = new UsersEntities3();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                string username = Context.User.Identity.Name;

                dbcont.PatientTables.Load();

                PatientTable patient = (from x in dbcont.PatientTables.Local
                                        where (x.UserName.Equals(username))
                                        select x).First();




                dbcont.MsgTables.Load();

                var co = from x in dbcont.MsgTables.Local
                         where x.FromUserName.Equals(username)
                         select x;

                GridView1.DataSource = co;
                GridView1.DataBind();
            }
            catch
            {
                Response.Redirect("~/Doctors/DocMessages.aspx");
            }

        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            using (UsersEntities3 dbcon = new UsersEntities3())
            {

                MsgTable msg = new MsgTable();

                msg.ToUserName = DropDownList1.Text;
                msg.MsgDate = DateTime.Now;
                msg.MsgText = msgTextbox.Text;
                msg.FromUserName = HttpContext.Current.User.Identity.Name.ToString();

                // add data to the dbcon

                dbcon.MsgTables.Add(msg);
                dbcon.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }
    }
    }
    