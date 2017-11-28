using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace HOSS.Doctors
{
    public partial class DoctorsHome : System.Web.UI.Page
    {
        UsersEntities3 dbcont = new UsersEntities3();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (TextBox1.Text.Length > 0)
                
                SqlDataSource3.SelectCommand = "SELECT * FROM PatientTable WHERE PatientName LIKE N'%" + TextBox1.Text + "%'";
            else
                SqlDataSource3.SelectCommand = "SELECT * FROM PatientTable ";


            try
            {
                string username = Context.User.Identity.Name;

                dbcont.DoctorTables.Load();

                DoctorTable doc = (from x in dbcont.DoctorTables.Local
                                   where (x.UserName.Equals(username))
                                   select x).First();

                string pID = doc.DoctorID.ToString();

                dbcont.AppointmentTables.Load();

                var doctorsAppointments =   from x in dbcont.AppointmentTables.Local
                                            where x.DoctorID.Equals(Convert.ToInt32(pID))
                                            select x;

                GridView4.DataSource = doctorsAppointments;
                GridView4.DataBind();


                dbcont.MsgTables.Load();

                var doctorsMessages =   from x in dbcont.MsgTables.Local
                                        where x.ToUserName.Equals(username)
                                        select x;


                GridView5.DataSource = doctorsMessages;
                GridView5.DataBind();

            }
            catch
            { 

            }
        }

        
        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView3.DataBind();
        }
    }
}