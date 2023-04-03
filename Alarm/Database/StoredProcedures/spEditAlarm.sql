CREATE PROCEDURE spEditAlarm

@alarmId int,
@newHour int,
@newMinutes int, 
@newName varchar(100)

AS
BEGIN
	UPDATE Alarms
    SET hour = @newHour, minutes = @newMinutes, name = @newName
    WHERE alarmId = @alarmId;
END
GO
