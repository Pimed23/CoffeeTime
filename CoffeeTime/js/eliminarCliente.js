cargar_mod_cliente = function( cliente ) {
    document.getElementById('codigo').value = cliente[0]['id_cliente'];
    document.getElementById('nombre').value = cliente[0]['nombre'];
    document.getElementById('p_apellido').value = cliente[0]['p_apellido'];
    document.getElementById('s_apellido').value = cliente[0]['s_apellido'];
}

function enviar() {
    var cod_mod = document.getElementById('cod_mod').value;
    var datos = 'codigo='+cod_mod;
    $.ajax({
        type: 'POST',
        url: "php/modificarCliente.php",
        data: datos,
        success: function( response ) {
            if( response == "0") {
                alert("No se encontro persona");
            } else {
                var cliente = JSON.parse( response );
                cargar_mod_cliente( cliente );
            }
        }, error: function( response, status, error ) {
            alert("No encontrado");
        }
    });
    return false;
}
