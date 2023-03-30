using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using m = Alarm.Model;
using c = Alarm.Controller;

namespace Alarm.Views
{
    public partial class alarmPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void setAlarm_ServerClick(object sender, EventArgs e)
        {
            int alarmHour = Convert.ToInt16(hourInput.Value);
            int alarmMinutes = Convert.ToInt16(minutesInput.Value);
            string alarmName = nameInput.Value.ToString();

            m.Alarm alarmB = (m.Alarm)Session["alarm"];


            c.AlarmC alarmController = new c.AlarmC();

            alarmController.SetAlarm(alarmHour, alarmMinutes, alarmName); 


        }
    }
}