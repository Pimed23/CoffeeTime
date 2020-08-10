var paramstr = window.location.search;
paramstr = paramstr.substring(7);
console.log(paramstr);
document.getElementById("monto_pagado").value = paramstr + '.00';


function calcular_cambio() {
    var total = parseFloat(document.getElementById("monto_pagado").value);
    var efect = parseFloat(document.getElementById("efectivo").value);
    var cambio = efect - total;

    document.getElementById("cambio").value = cambio.toFixed(2); 
}