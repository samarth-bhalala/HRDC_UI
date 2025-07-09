using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRDC_UI
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected Label lblUsername;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Safely read username from Session and display
                if (Session["username"] != null)
                {
                    lblUsername.Text = Session["username"].ToString();
                }
                else
                {
                    lblUsername.Text = "Guest";
                }
            }
        }
    }
}