cargar_clientes = function( clientes ) {
    var header = "<thead>\n" 
                    +"<tr>\n"
                        +"<th>Codigo</th>\n"
                        +"<th>Apellido Paterno</th>\n"
                        +"<th>Apellido Materno</th>\n"
                        +"<th>Nombre</th>\n"
                        +"<th>Num. Contacto</th>\n"
                    +"</tr>\n"
                 +"</thread>";	
    $('.clientes').append(header);
 
    for( var i = 0; i < clientes.length; ++i ) {
        var row = "<tr>\n"
                +"<td>"+clientes[i]['id_cliente']+"</td>\n"
                +"<td>"+clientes[i]['nombre']+"</td>\n"
                +"<td>"+clientes[i]['p_apellido']+"</td>\n"
                +"<td>"+clientes[i]['s_apellido']+"</td>\n"
                +"<td>"+clientes[i]['num_contacto']+"</td>\n"
               +"</tr>"
        $('.clientes').append(row);
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
        url: "php/mostrarCliente.php",
        type: 'POST',
        success: function( response ) {
            var clientes = JSON.parse( response );
            cargar_clientes( clientes );
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
            url: "php/filtrarCliente.php",
            type: 'POST',
            success: function( response ) {
                console.log(response);
                var clientes = JSON.parse( response );
                limpiar();
                cargar_clientes( clientes );
            },
            error: function(response, status, error) {
                alert("No encontrado");
            }
        });
    });
}