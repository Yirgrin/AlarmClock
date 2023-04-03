<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alarmPage.aspx.cs" Inherits="Alarm.Views.alarmPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Alarm Page</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
    <!-- JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../css/js/JsAlarm.js"></script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="timerDisplay" id="lbltime" runat="server">00:00:00</div>
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
                        <span style="font-family: monospace; font-size: 20px; color: white; display: grid; margin-top: 1.5em; border-bottom: 1px solid #898f9b; padding-bottom: 0.6em;">
                            <%#Eval ("hour")%>:<%#Eval ("minutes")%> | <%#Eval ("alarmName")%></span>
                    </div>
                    <div>
                        <button dataid='<%# Eval("alarmId")%>' runat="server" onserverclick="btnDeleteAlarm_ServerClick" style="font-size: 2em; border: none; cursor: pointer; background-color: transparent;">
                            <img src="../css/trash.png" /></button>
                        <button data-id='<%# Eval("alarmId")%>' runat="server" onserverclick="btnEditAlarm_ServerClick" data-bs-toggle="modal" data-bs-target="#modalEdit" style="font-size: 2em; border: none; cursor: pointer; background-color: transparent;">
                            <img src="../css/edit.png" /></button>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title fs-5" id="exampleModalLabel">
                            <label>Edit Alarm</label>
                        </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h4 id="lblalarm" runat="server" style="text-align: center;"> </h4>
                        <div class="container">
                            <div class="inputs">
                                <input type="number" id="IneditHour" runat="server"
                                    placeholder="00" min="0" max="23" />
                                <input type="number" id="IneditMinutes" runat="server"
                                    placeholder="00" min="0" max="59" />
                                <input type="text" id="IneditName" runat="server"
                                    placeholder="alarm name" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                        <button dataId='<%# Eval("alarmId")%>' runat="server" onserverclick="ConfirmEdit_ServerClick" class="btn btn-secondary">Confirm</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>




