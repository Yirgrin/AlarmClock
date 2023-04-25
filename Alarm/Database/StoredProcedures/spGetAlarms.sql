USE [AlarmClock]
GO
/****** Object:  StoredProcedure [dbo].[spGetAlarms]    Script Date: 24/04/2023 08:16:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetAlarms]

AS
BEGIN
	SELECT 
		alarmId, 
		hour,
		minutes, 
		name, 
		alarmState, 
		alarmDay
	FROM Alarms

END
