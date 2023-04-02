USE [AlarmClock]
GO
/****** Object:  StoredProcedure [dbo].[spGetAlarms]    Script Date: 02/04/2023 03:11:01 p. m. ******/
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
		name
	FROM Alarms

END
