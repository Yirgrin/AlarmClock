using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using m = Alarm.Model;


namespace Alarm.Controller
{
    public class AlarmC
    {
        public bool SetAlarm(int hour, int minutes, string alarmName)
        {
            try
            {
                Database.Database db = new Database.Database();

                db.SetAlarm(hour, minutes, alarmName);

                return true;
            }
            catch
            {
                return false;
            }

        }
    }
}