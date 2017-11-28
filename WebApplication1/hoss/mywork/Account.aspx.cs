using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Entity;

namespace HOSS.mywork
{
    public partial class Account : System.Web.UI.Page
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

        
                Label2.Text = userInfo.UserName.ToString();
                Label3.Text = userInfo.Address.ToString();
                Label4.Text = userInfo.Phone.ToString();
                Label5.Text = userInfo.SSN.ToString();
  
            }
            catch
            {

            }
        }
    }
}