USE [AlarmClock]
GO
/****** Object:  StoredProcedure [dbo].[spEditAlarm]    Script Date: 23/04/2023 04:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spEditAlarm]

@alarmId int,
@newHour int,
@newMinutes int, 
@newName varchar(100),
@newstate varchar(20)

AS
BEGIN
	UPDATE Alarms
    SET hour = @newHour, minutes = @newMinutes, name = @newName, alarmState = @newstate
    WHERE alarmId = @alarmId;
END
