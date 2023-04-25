USE [master]
GO
/****** Object:  Database [AlarmClock]    Script Date: 25/04/2023 04:11:28 p. m. ******/
CREATE DATABASE [AlarmClock]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlarmClock', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AlarmClock.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlarmClock_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AlarmClock_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AlarmClock] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlarmClock].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlarmClock] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlarmClock] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlarmClock] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlarmClock] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlarmClock] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlarmClock] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlarmClock] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlarmClock] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlarmClock] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlarmClock] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlarmClock] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlarmClock] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlarmClock] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlarmClock] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlarmClock] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlarmClock] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlarmClock] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlarmClock] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlarmClock] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlarmClock] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlarmClock] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlarmClock] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlarmClock] SET RECOVERY FULL 
GO
ALTER DATABASE [AlarmClock] SET  MULTI_USER 
GO
ALTER DATABASE [AlarmClock] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlarmClock] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlarmClock] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlarmClock] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlarmClock] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlarmClock] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlarmClock', N'ON'
GO
ALTER DATABASE [AlarmClock] SET QUERY_STORE = ON
GO
ALTER DATABASE [AlarmClock] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AlarmClock]
GO
/****** Object:  Table [dbo].[Alarms]    Script Date: 25/04/2023 04:11:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alarms](
	[alarmId] [int] IDENTITY(1,1) NOT NULL,
	[hour] [int] NOT NULL,
	[minutes] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[alarmState] [varchar](50) NOT NULL,
	[alarmDay] [varchar](50) NULL,
 CONSTRAINT [PK_Alarm] PRIMARY KEY CLUSTERED 
(
	[alarmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alarms] ON 
GO
INSERT [dbo].[Alarms] ([alarmId], [hour], [minutes], [name], [alarmState], [alarmDay]) VALUES (26, 12, 30, N'trabajo', N'Active', N'martes')
GO
INSERT [dbo].[Alarms] ([alarmId], [hour], [minutes], [name], [alarmState], [alarmDay]) VALUES (27, 18, 22, N'tarea', N'Active', N'viernes')
GO
SET IDENTITY_INSERT [dbo].[Alarms] OFF
GO
/****** Object:  StoredProcedure [dbo].[spDeleteAlarm]    Script Date: 25/04/2023 04:11:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteAlarm]

@alarmId INT

AS
BEGIN
	DELETE FROM Alarms WHERE alarmId = @alarmId 
END
GO
/****** Object:  StoredProcedure [dbo].[spEditAlarm]    Script Date: 25/04/2023 04:11:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEditAlarm]

@alarmId int,
@newHour int,
@newMinutes int, 
@newName varchar(100),
@newstate varchar(20), 
@newDay varchar(50)

AS
BEGIN
	UPDATE Alarms
    SET hour = @newHour, minutes = @newMinutes, name = @newName, alarmState = @newstate, alarmDay = @newDay
    WHERE alarmId = @alarmId;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAlarms]    Script Date: 25/04/2023 04:11:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAlarms]

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
GO
/****** Object:  StoredProcedure [dbo].[spSetAlarm]    Script Date: 25/04/2023 04:11:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSetAlarm]

@hour int,
@minutes int, 
@name varchar(100),
@state varchar(20), 
@day varchar(50)



AS
BEGIN

	INSERT INTO dbo.Alarms VALUES(@hour, @minutes, @name, @state, @day)

END
GO
USE [master]
GO
ALTER DATABASE [AlarmClock] SET  READ_WRITE 
GO
