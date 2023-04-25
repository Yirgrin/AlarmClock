
function updateTime() {
    var now = new Date();
    var timeStr = now.toLocaleTimeString();
    document.getElementById("lbltime").innerText = timeStr;
}

// Actualizar la hora cada segundo
window.onload = function () {
    updateTime();
    setInterval(updateTime, 1000);
};


// Llamar a la función de comprobación cada segundo
setInterval(CheckAlarms, 1000);

function showModal() {

    var myModal = new bootstrap.Modal(document.getElementById("exampleModal"), {});
    document.onreadystatechange = function () {
        myModal.show();
    };
}
