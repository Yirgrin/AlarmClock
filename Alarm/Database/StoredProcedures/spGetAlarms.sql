
CREATE PROCEDURE spGetAlarms

AS
BEGIN
	SELECT 
		hour,
		minutes, 
		name
	FROM Alarms

END
GO
