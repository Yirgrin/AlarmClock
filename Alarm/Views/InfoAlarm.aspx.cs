using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alarm.Views
{
    public partial class InfoAlarm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int aalarmId = Convert.ToInt16(Request.QueryString["alarmId"]);

        }
    }
}