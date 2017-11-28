using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace HOSS.Doctors
{
    public partial class DocMessages : System.Web.UI.Page
    {

        UsersEntities3 dbcont = new UsersEntities3();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string username1 = Context.User.Identity.Name;


                dbcont.DoctorTables.Load();
                DoctorTable patient = (from x in dbcont.DoctorTables.Local
                                        where (x.UserName.Equals(username1))
                                        select x).First();

                dbcont.MsgTables.Load();

                var co = from x in dbcont.MsgTables.Local
                         where x.FromUserName.Equals(username1)
                         select x;

                GridView1.DataSource = co;
                GridView1.DataBind();
            }
            catch
            {
                Response.Write(" <script>alert(' Wrong page docmeesssa -- not valid user') </script>");

                Response.Redirect("~/mywork/Appointments/Appointment.aspx");
            }
        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            using (UsersEntities3 dbcon = new UsersEntities3())
            {

                MsgTable msg = new MsgTable();

                msg.ToUserName = DropDownList1.Text;
                msg.MsgDate = DateTime.Now;
                msg.MsgText = msgTextbox0.Text;
                msg.FromUserName = HttpContext.Current.User.Identity.Name.ToString();

                // add data to the dbcon

                dbcon.MsgTables.Add(msg);
                dbcon.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}