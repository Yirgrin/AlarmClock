using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alarm.Model
{
    public class Alarm
    {
        public int alarmId { get; set; }
        public int hour {get; set;}
        public int minutes {get; set;}
        public string alarmName {get; set;}
        public string alarmDays { get; set; }
    }
}