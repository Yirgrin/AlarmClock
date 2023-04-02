function updateTime()
{
    var now = new Date();
    var timeStr = now.toLocaleTimeString();
    document.getElementById("lbltime").innerText = timeStr;
}

// Actualizar la hora cada segundo
setInterval(updateTime, 1000);

// Enviar la hora actual al servidor con una petición AJAX
$.ajax({
    type: 'POST',
    url: '/api/checkalarms',
    data: { time: now },
    success: function (data) {
        // Manejar la respuesta del servidor (por ejemplo, mostrar una alerta si una alarma se ha activado)
        if (data.alarms.length > 0) {
            alert('La alarma ' + data.alarms[0].name + ' ha sonado a las ' + data.time + '.');
        }
    }
});