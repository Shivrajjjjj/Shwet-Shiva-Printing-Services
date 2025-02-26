using System;
using System.Web;
using System.Web.UI;

namespace Shwet_Shiva_Printing_Services_and_Mrityunjay_Mudranalay
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminUser"] != null)
            {
                pnlAdminSidebar.Visible = true;
                pnlClientSidebar.Visible = false;
            }
            else
            {
                pnlAdminSidebar.Visible = false;
                pnlClientSidebar.Visible = true; 
            }
        }
    }
}
