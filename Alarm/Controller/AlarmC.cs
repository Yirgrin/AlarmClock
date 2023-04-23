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
        public bool SetAlarm(int hour, int minutes, string alarmName, string alarmState)
        {
            try
            {
                Database.Database db = new Database.Database();

                db.SetAlarm(hour, minutes, alarmName, alarmState);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public List<m.Alarm> GetAlarms()
        {
            List<m.Alarm> alarmList = new List<m.Alarm>();

            Database.Database db = new Database.Database();

            DataTable ds = db.GetAlarms();

            return ConvertDSToList(ds);

        }

        public bool DeleteAlarm(int alarmId)
        {
            try
            {
                Database.Database db = new Database.Database();

                db.DeleteAlarm(alarmId);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool EditAlarm(int alarmId, int newHour, int newMinutes, string newName, string newState)
        {
            try
            {
                Database.Database db = new Database.Database();

                db.EditAlarm(alarmId, newHour, newMinutes, newName, newState);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public List<m.Alarm> ConvertDSToList(DataTable ds)
        {
            List<m.Alarm> alarmList = new List<m.Alarm>();


            foreach (DataRow row in ds.Rows)
            {
                alarmList.Add(new m.Alarm
                {
                    alarmId = Convert.ToInt32(row["alarmId"]),
                    hour = Convert.ToInt32(row["hour"]),
                    minutes = Convert.ToInt32(row["minutes"]),
                    alarmName = Convert.ToString(row["name"]),
                    alarmState = Convert.ToString(row["alarmState"]),
                });
            }

            return alarmList;
        }
    }
}