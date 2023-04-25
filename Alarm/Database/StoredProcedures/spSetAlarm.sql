USE [AlarmClock]
GO
/****** Object:  StoredProcedure [dbo].[spSetAlarm]    Script Date: 24/04/2023 08:11:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spSetAlarm]

@hour int,
@minutes int, 
@name varchar(100),
@state varchar(20), 
@day varchar(50)



AS
BEGIN

	INSERT INTO dbo.Alarms VALUES(@hour, @minutes, @name, @state, @day)

END
