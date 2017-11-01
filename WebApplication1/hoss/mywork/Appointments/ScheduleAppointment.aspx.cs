using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace HOSS
{
    public partial class ScheduleAppointment : System.Web.UI.Page
    {
       
        UsersEntities3 dbcont = new UsersEntities3();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string username1 = Context.User.Identity.Name;


                dbcont.PatientTables.Load();
                PatientTable patient = (from x in dbcont.PatientTables.Local
                                       where (x.UserName.Equals(username1))
                                       select x).First();
            }
            catch
            {
                Response.Redirect("~/Doctors/DoctorsHome.aspx");
            }
            if (!IsPostBack)
            {
                dbcont.DoctorTables.Load();
                var myLocation = from item in dbcont.DoctorTables.Local
                                 select item.Location;

                // Get distinct elements and convert into a list again.
                List<string> distinct = myLocation.Distinct().ToList();
                DropDownList2.DataSource = distinct;
                DropDownList2.DataBind();
            };
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            checkAvailable();

            using (UsersEntities3 dbcontext = new UsersEntities3())
            {

                AppointmentTable msg = new AppointmentTable();
                String PId = Context.User.Identity.Name;

                dbcontext.PatientTables.Load();
                PatientTable patient = (from x in dbcontext.PatientTables.Local
                                        where (x.UserName.Equals(PId))
                                        select x).First();

                PId = patient.PatientID.ToString();

                string hours = DropDownList3.SelectedValue.ToString().Substring(0, 2);
                string minutes = DropDownList3.SelectedValue.ToString().Substring(3);

                msg.DoctorID = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
                msg.AppointmentDate = Convert.ToDateTime(Calendar1.SelectedDate);
                msg.Reason = txtText.Text;
                msg.PatientID = Convert.ToInt32(PId);
                msg.AppointmentTime = new TimeSpan(Convert.ToInt32(hours), Convert.ToInt32(minutes), 0);
                // add data to the dbcon

                dbcontext.AppointmentTables.Add(msg);
                dbcontext.SaveChanges();
            }
            Response.Redirect("~/mywork/Appointments/Appointment.aspx");
        }

        public void checkAvailable()
        {
           

            dbcont.AppointmentTables.Load();
            int qq = 0;
            foreach(var x in dbcont.AppointmentTables.Local)
            {

                if (Convert.ToInt32(DropDownList1.SelectedValue.ToString()).Equals(x.DoctorID) && 
                    Calendar1.SelectedDate.Equals(x.AppointmentDate) &&
                    new TimeSpan(Convert.ToInt32(DropDownList3.SelectedValue.Substring(0, 2)),
                                Convert.ToInt32(DropDownList3.SelectedValue.Substring(3)), 0)
                                .Equals(x.AppointmentTime))
                {
                    qq = 1;
                   // Response.Redirect("~/mywork/Appointments/ScheduleAppointment.aspx");
                }

                           
            }
            if (qq == 1)
            {
                Response.Write("<script>alert(' Selected Appointment Date and Time is unvailable -- Please make a new selection! ') </script>");
                qq = 0;
            }
            else
            {
                Response.Write("<script>alert(' Appointment is available -- click Add Appointment button ') </script>");
                btnAdd.Visible = true;
            }

        }
    

        protected void DropDownList2_SelectedIndexChanged1(object sender, EventArgs e)
        {
            

                dbcont.DoctorTables.Load();

                var myDoctor = from x in dbcont.DoctorTables.Local
                               where x.Location.StartsWith(DropDownList2.SelectedValue)
                               select new
                               {
                                   Name = x.DoctorName,
                                    x.DoctorID
                               };

                //add data to the Grid View
                DropDownList1.DataValueField = "DoctorID";
                DropDownList1.DataTextField = "Name";
                DropDownList1.DataSource = myDoctor;
                DropDownList1.DataBind();
            
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToShortDateString();


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            checkAvailable();
            
        }
    }
}