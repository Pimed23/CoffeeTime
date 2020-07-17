cargar_mod_insumo = function( insumo ) {
    document.getElementById('codigo').value = insumo[0]['id_insumo'];
    document.getElementById('nombre').value = insumo[0]['nombre'];
    document.getElementById('cantidad').value = insumo[0]['cantidad'];
    document.getElementById('umbral').value = insumo[0]['umbral'];
    document.getElementById('cod_proveedor').value = insumo[0]['id_proveedor'];
}

function enviar() {
    var cod_mod = document.getElementById('cod_mod').value;
    var datos = 'codigo='+cod_mod;
    $.ajax({
        type: 'POST',
        url: "php/modificarAlmacen.php",
        data: datos,
        success: function( response ) {
            if( response == "0") {
                alert("No se encontro persona");
            } else {
                var insumo = JSON.parse( response );
                cargar_mod_insumo( insumo );
            }
        }, error: function( response, status, error ) {
            alert("No encontrado");
        }
    });
    return false;
}
