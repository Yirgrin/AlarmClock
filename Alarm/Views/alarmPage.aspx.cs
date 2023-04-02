using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using m = Alarm.Model;
using c = Alarm.Controller;
using System.Web.UI.HtmlControls;
using static System.Collections.Specialized.BitVector32;
using System.Timers;
using System.Threading;


namespace Alarm.Views
{

    public partial class alarmPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            LoadAlarm();
            CheckAlarms();
        }   

        protected void LoadAlarm()
        {
            c.AlarmC alarmController = new c.AlarmC();
            alarmsList.DataSource = alarmController.GetAlarms();
            alarmsList.DataBind();
        }
        protected void setAlarm_ServerClick(object sender, EventArgs e)
        {
            int alarmHour = Convert.ToInt16(hourInput.Value);
            int alarmMinutes = Convert.ToInt16(minutesInput.Value);
            string alarmName = nameInput.Value.ToString();

            c.AlarmC alarmController = new c.AlarmC();
            alarmController.SetAlarm(alarmHour, alarmMinutes, alarmName);
            LoadAlarm();
        }

        protected void CheckAlarms()
        {
            string msg = string.Empty;
            List<m.Alarm> alarmList = new List<m.Alarm>();
            foreach (m.Alarm alarm in alarmList)
            {
                DateTime now = DateTime.Now;
                if (now.Hour == alarm.hour && now.Minute == alarm.minutes)
                {
                    msg = $"alert('¡Alarma sonando!')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
                }
            }
        }
        protected void btnDeleteAlarm_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            var button = (HtmlButton)sender;
            int alarmId = Convert.ToInt32(button.Attributes["dataid"]);

            c.AlarmC alarmController = new c.AlarmC();

            if (alarmController.DeleteAlarm(alarmId))
            {
                msg = $"alert('¡Alarma eliminada!')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
                LoadAlarm();
            }
            else
            {
                msg = $"alert('Ocurrió un error al eliminar la alarma.')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
            }
        }

        protected void btnEditAlarm_ServerClick(object sender, EventArgs e)
        {

        }
    }
}