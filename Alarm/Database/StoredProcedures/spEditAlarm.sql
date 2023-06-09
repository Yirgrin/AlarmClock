USE [AlarmClock]
GO
/****** Object:  StoredProcedure [dbo].[spEditAlarm]    Script Date: 25/04/2023 04:02:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spEditAlarm]

@alarmId int,
@newHour int,
@newMinutes int, 
@newName varchar(100),
@newstate varchar(20), 
@newDay varchar(50)

AS
BEGIN
	UPDATE Alarms
    SET hour = @newHour, minutes = @newMinutes, name = @newName, alarmState = @newstate, alarmDay = @newDay
    WHERE alarmId = @alarmId;
END
