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

namespace Alarm.Views
{
    public partial class alarmPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAlarm();
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

    }
}