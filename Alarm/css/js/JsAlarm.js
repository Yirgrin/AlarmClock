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


function showModal(title, msg) {

    var myModal = new bootstrap.Modal(document.getElementById("exampleModal"), {});
    document.onreadystatechange = function () {
        myModal.show();
    };
}