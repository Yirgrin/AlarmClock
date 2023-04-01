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

            <%--REPEATER QUE MUESTRA LAS ALARMAS--%>
            <asp:Repeater ID="alarmsList" runat="server">
                <ItemTemplate>
                    <div>
                        <span style="font-family: monospace; 
                        font-size: 20px; color: white; display: grid;
                        margin-top: 1.5em; border-bottom: 1px solid #898f9b; padding-bottom: 0.6em;">
                        <%#Eval ("hour")%>:<%#Eval ("minutes")%> | <%#Eval ("alarmName")%></span>
                    </div>
                    <div>
                       <button dataid='<%# Eval("id")%>' runat="server" onserverclick="btnDeleteAlarm_ServerClick" style="font-size: 2em; border: none;cursor: pointer; background-color: transparent;">
                          <img src="../css/trash.png" /></button>
                       <%--<button style="font-size: 2em; border: none;cursor: pointer; background-color: transparent;" dataid='<%# Eval("id")%>' runat="server" onserverclick="btnEditAlarm_ServerClick1">
                          <img src="../css/edit.png" /></button>--%>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>




