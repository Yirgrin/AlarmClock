﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using m = Alarm.Model; 

namespace Alarm.Database
{
    public class Database
    {
        SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=AlarmClock;Integrated Security=True");

        public void SetAlarm (int hour, int minutes, string alarmName, string alarmState, string alarmDay)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@hour", hour),
                new SqlParameter("@minutes", minutes),
                new SqlParameter("@name", alarmName),
                new SqlParameter("@state", alarmState),
                new SqlParameter("@day", alarmDay)
            };

            this.ExecuteQuery("[dbo].[spSetAlarm]", param);
        }

        public DataTable GetAlarms()
        {
            return this.Fill("[dbo].[spGetAlarms]", null);
        }


        public void DeleteAlarm(int alarmId)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@alarmId", alarmId),
            };

            this.ExecuteQuery("[dbo].[spDeleteAlarm]", param);
        }

        public void EditAlarm(int alarmId, int newHour, int newMinutes, string newName, string newState, string newDay)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@alarmId", alarmId),
                new SqlParameter("@newHour", newHour),
                new SqlParameter("@newMinutes", newMinutes),
                new SqlParameter("@newName", newName),
                new SqlParameter("@newState", newState), 
                new SqlParameter("@newDay", newDay)

        };

            this.ExecuteQuery("[dbo].[spEditAlarm]", param);
        }


        public DataTable Fill(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                using (this.connection)
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    DataTable ds = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ExecuteQuery(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                using (this.connection)
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}