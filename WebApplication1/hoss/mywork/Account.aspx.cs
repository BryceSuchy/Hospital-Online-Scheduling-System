using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HOSS.mywork
{
    public partial class Account : System.Web.UI.Page
    {
        UsersEntities3 dbcont = new UsersEntities3();
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Context.User.Identity.Name;
            
            //UsersTable patient = (from x in dbcont.UsersTables.Local
            //                        where (x.UserName.Equals(username))
            //                        select x).First();
            // string queryString = "SELECT UserType FROM UsersTable WHERE UserName ="+ username;
            SqlDataSource1.ConnectionString = "SELECT UserType FROM UsersTable WHERE UserName =" + username;
           

            using (var context = new UsersEntities3())
            {
                var blogNames = context.Database.SqlQuery<string>(
                                   "SELECT UserType FROM dbo.UsersTable WHERE UserName =" + username);
                Label2.Text = blogNames.ToString();
            }
        }
    }
}