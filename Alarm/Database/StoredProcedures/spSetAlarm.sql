
CREATE PROCEDURE spSetAlarm

@hour int,
@minutes int, 
@name varchar(100), 
@days varchar(100)


AS
BEGIN

	INSERT INTO dbo.Alarms VALUES(@hour, @minutes, @name, @days)

END
GO
