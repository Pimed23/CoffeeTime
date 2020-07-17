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
