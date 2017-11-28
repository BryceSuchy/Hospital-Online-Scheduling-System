using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;


namespace HOSS
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        UsersEntities3 dbcont = new UsersEntities3();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                string username = Context.User.Identity.Name;

                dbcont.UsersTables.Load();

                UsersTable userInfo = (from x in dbcont.UsersTables.Local
                                       where (x.UserName.Equals(username))
                                       select x).First();

                if (userInfo.UserType == "Doctor")
                {
                    HyperLink3.Visible = false;
                }
                else if (userInfo.UserType == "Patient")
                {
                    HyperLink8.Visible = false;
                }

            }
            catch
            {

            }

        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {

        }
    }
}