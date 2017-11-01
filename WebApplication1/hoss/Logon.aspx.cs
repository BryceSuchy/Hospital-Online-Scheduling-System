using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace HOSS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        UsersEntities3 dbcon = new UsersEntities3();

        protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        {
           
               foreach(var x in dbcon.UsersTables)
                {

                    if (Login1.UserName.Trim().Equals(x.UserName.Trim()) && Login1.Password.Trim().Equals( x.Password.Trim()))
                    {
                        FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
                    }
                    
                        
            }
           
        }
    }
   }