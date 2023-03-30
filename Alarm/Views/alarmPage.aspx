<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alarmPage.aspx.cs" Inherits="Alarm.Views.alarmPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Alarm Page</title>
    <!-- Font Awesome Icons -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins&family=Roboto+Mono:wght@500&display=swap"
        rel="stylesheet" />
    <!-- Stylesheet -->
    <link href="../css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="timerDisplay">00:00:00</div>
            <div class="container">
                <div class="inputs">
                    <input type="number" id="hourInput" runat="server"
                        placeholder="00" min="0" max="23" />
                    <input type="number" id="minutesInput" runat="server"
                        placeholder="00" min="0" max="59" />
                    <input type="text" id="nameInput" runat="server"
                        placeholder="alarm name" />
                </div>
            </div>
            <button id="setAlarm" runat="server" onserverclick="setAlarm_ServerClick">Set Alarm</button>
            <div class="activeAlarms"></div>

        </div>
    </form>
</body>
</html>




