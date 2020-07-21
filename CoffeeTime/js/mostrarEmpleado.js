cargar_empleados = function( empleados ) {
    var header = "<thead>\n" 
                    +"<tr>\n"
                        +"<th>Codigo</th>\n"
                        +"<th>Apellido Paterno</th>\n"
                        +"<th>Apellido Materno</th>\n"
                        +"<th>Nombre</th>\n"
                        +"<th>Fecha Nacimiento</th>\n"
                        +"<th>Num. Contacto</th>\n"
                        +"<th>Direccion</th>\n"
                        +"<th>Jefe</th>\n"
                    +"</tr>\n"
                 +"</thread>";	
    $('.empleados').append(header);

 
    for( var i = 0; i < empleados.length; ++i ) {
        var row = "<tr>\n"
                +"<td>"+empleados[i]['id_empleado']+"</td>\n"
                +"<td>"+empleados[i]['nombre']+"</td>\n"
                +"<td>"+empleados[i]['p_apellido']+"</td>\n"
                +"<td>"+empleados[i]['s_apellido']+"</td>\n"
                +"<td>"+empleados[i]['fech_nac']+"</td>\n"
                +"<td>"+empleados[i]['num_contacto']+"</td>\n"
                +"<td>"+empleados[i]['direccion']+"</td>\n"
                +"<td>"+empleados[i]['jefe']+"</td>\n"
               +"</tr>"
        $('.empleados').append(row);
    }
}

function limpiar() {
    $("thead").remove();
    $("tr").remove();
    $("td").remove();
}

$(document).ready(function(){
    var ajax = $.ajax({
        data: {},
        url: "php/mostrarEmpleado.php",
        type: 'POST',
        success: function( response ) {
            var empleados = JSON.parse( response );
            cargar_empleados( empleados );
        },
        error: function(response, status, error) {
            alert("No encontrado");
        }
    });
});

function myFunction(){
    var filtro = document.getElementById('filtro').value;
    var datos = 'filtro='+filtro;
    console.log(datos);
    
    $(document).ready(function(){
        var ajax = $.ajax({
            data: datos,
            url: "php/filtrarEmpleados.php",
            type: 'POST',
            success: function( response ) {
                console.log(response);
                var empleados = JSON.parse( response );
                limpiar();
                cargar_empleados( empleados );
            },
            error: function(response, status, error) {
                alert("No encontrado");
            }
        });
    });
}

