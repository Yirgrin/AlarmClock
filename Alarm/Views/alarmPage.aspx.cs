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
            string alarmState = "Active";

            c.AlarmC alarmController = new c.AlarmC();
            alarmController.SetAlarm(alarmHour, alarmMinutes, alarmName, alarmState);
            hourInput.Value = "";
            minutesInput.Value = "";
            nameInput.Value = "";
            LoadAlarm();
        }

        protected void CheckAlarms()
        {
            string msg = string.Empty;
            c.AlarmC alarmController = new c.AlarmC();
            List<m.Alarm> alarmList = alarmController.GetAlarms();
            var now = DateTime.Now;
            foreach (var alarm in alarmList)
            {
                if (now.Hour == alarm.hour && now.Minute == alarm.minutes && alarm.alarmState == "Active")
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
            var button = (HtmlButton)sender;
            int alarmId = Convert.ToInt32(button.Attributes["data-id"]);
            Session["alarmId"] = alarmId;

            c.AlarmC alarmController = new c.AlarmC();
            List<m.Alarm> alarmList = alarmController.GetAlarms();
            foreach (m.Alarm a in alarmList)
            {
                if (alarmId == a.alarmId)
                {
                    lblalarm.InnerText = a.hour.ToString() + " : " + a.minutes.ToString() + " | " + a.alarmName;
                    lblstate.InnerText = a.alarmState.ToString();

                    IneditHour.Value = a.hour.ToString();
                    IneditMinutes.Value = a.minutes.ToString();
                    IneditName.Value = a.alarmName.ToString();
                    dropDownState.Value = a.alarmState.ToString();
                }
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction",
               "showModal()", true);
        }

        protected void ConfirmEdit_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            int alarmId = Convert.ToInt32(Session["alarmId"]);
            int newHour = Convert.ToInt16(IneditHour.Value);
            int newMinutes = Convert.ToInt16(IneditMinutes.Value);
            string newName = IneditName.Value.ToString();
            string newState = dropDownState.Value.ToString(); 

            c.AlarmC alarmController = new c.AlarmC();

            if (alarmController.EditAlarm(alarmId, newHour, newMinutes, newName, newState))
            {
                msg = $"alert('¡Alarma editada!')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
                LoadAlarm();
            }
            else
            {
                msg = $"alert('Ocurrió un error al eliminar la alarma.')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
            }
        }

        protected void checkAlarm_ServerClick(object sender, EventArgs e)
        {
            CheckAlarms(); 
        }
    }
}