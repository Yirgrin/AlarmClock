USE [AlarmClock]
GO
/****** Object:  StoredProcedure [dbo].[spGetAlarms]    Script Date: 23/04/2023 04:20:27 p. m. ******/
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
		alarmState
	FROM Alarms

END
