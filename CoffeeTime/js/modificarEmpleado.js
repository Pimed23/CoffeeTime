cargar_mod_empleado = function( empleado ) {
    document.getElementById('codigo').value = empleado[0]['id_empleado'];
    document.getElementById('nombre').value = empleado[0]['nombre'];
    document.getElementById('p_apellido').value = empleado[0]['p_apellido'];
    document.getElementById('s_apellido').value = empleado[0]['s_apellido'];
    document.getElementById('cargo').value = empleado[0]['id_cargo'];
    document.getElementById('fech_nac').value = empleado[0]['fech_nac'];
    document.getElementById('telefono').value = empleado[0]['num_contacto'];
    document.getElementById('direccion').value = empleado[0]['direccion'];
    document.getElementById('cod_jefe').value = empleado[0]['id_jefe'];
}

function enviar() {
    var cod_mod = document.getElementById('cod_mod').value;
    var datos = 'codigo='+cod_mod;
    $.ajax({
        type: 'POST',
        url: "php/modificarEmpleado.php",
        data: datos,
        success: function( response ) {
            if( response == "0") {
                alert("No se encontro persona");
            } else {
                var empleado = JSON.parse( response );
                console.log( empleado );
                cargar_mod_empleado( empleado );
            }
        }, error: function( response, status, error ) {
            alert("No encontrado");
        }
    });
    return false;
}
