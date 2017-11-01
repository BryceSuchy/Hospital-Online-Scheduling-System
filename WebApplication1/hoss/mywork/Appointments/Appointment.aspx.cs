using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;


namespace HOSS.mywork.Appointments
{
    public partial class Appointment : System.Web.UI.Page
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

                string pID = patient.PatientID.ToString();


                dbcont.AppointmentTables.Load();

                var co = from x in dbcont.AppointmentTables.Local
                         where x.PatientID.Equals(Convert.ToInt32(pID))
                         select x;

                GridView3.DataSource = co;
                GridView3.DataBind();


                dbcont.MsgTables.Load();

                var qo = from x in dbcont.MsgTables.Local
                         where x.ToUserName.Equals(username)
                         select x;

                GridView4.DataSource = qo;
                GridView4.DataBind();
            }
            catch
            {
                Response.Write("<script>alert(' Wrong page -- not valid user') </script>");
               // Response.Redirect("~/mywork/Appointments/Appointment.aspx");
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/mywork/Appointments/ScheduleAppointment.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/mywork/Messages.aspx");
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}