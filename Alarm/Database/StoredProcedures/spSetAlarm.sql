USE [AlarmClock]
GO
/****** Object:  StoredProcedure [dbo].[spSetAlarm]    Script Date: 23/04/2023 03:21:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spSetAlarm]

@hour int,
@minutes int, 
@name varchar(100),
@state varchar(20)



AS
BEGIN

	INSERT INTO dbo.Alarms VALUES(@hour, @minutes, @name, @state)

END
