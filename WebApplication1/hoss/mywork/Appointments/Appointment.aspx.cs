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
        bool check = true;
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
                if (patient == null)
                {
                    check = false;
                }

                string pID = patient.PatientID.ToString();


                dbcont.AppointmentTables.Load();

                var co = from x in dbcont.AppointmentTables.Local
                         where x.PatientID.Equals(Convert.ToInt32(pID))
                         select x;

                GridView3.DataSource = co;
                GridView3.DataBind();

                var stud = (from s in dbcont.AppointmentTables.Local
                            where s.AppointmentDate < DateTime.Now
                            select s).First();
                Console.WriteLine(stud);

                dbcont.AppointmentTables.Remove(stud);
                int num = dbcont.SaveChanges();

                dbcont.MsgTables.Load();

                var qo = from x in dbcont.MsgTables.Local
                         where x.ToUserName.Equals(username)
                         select x;

                GridView4.DataSource = qo;
                GridView4.DataBind();
            }
            catch
            {
            
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