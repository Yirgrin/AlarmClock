USE [AlarmClock]
GO
/****** Object:  StoredProcedure [dbo].[spSetAlarm]    Script Date: 31/03/2023 04:08:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spSetAlarm]

@hour int,
@minutes int, 
@name varchar(100)


AS
BEGIN

	INSERT INTO dbo.Alarms VALUES(@hour, @minutes, @name)

END
