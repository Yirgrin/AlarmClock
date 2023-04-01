
CREATE PROCEDURE spDeleteAlarm

@alarmId INT

AS
BEGIN
	DELETE FROM Alarms WHERE alarmId = @alarmId 
END
GO
