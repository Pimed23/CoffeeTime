cargar_clientes = function( insumos ) {
    var header = "<thead>\n" 
                    +"<tr>\n"
                        +"<th>Codigo</th>\n"
                        +"<th>Nombre</th>\n"
                        +"<th>Cantidad</th>\n"
                        +"<th>Umbral</th>\n"
                        +"<th>Proveedor</th>\n"
                    +"</tr>\n"
                 +"</thread>";	
    $('.insumos').append(header);
 
    for( var i = 0; i < insumos.length; ++i ) {
        var row = "<tr>\n"
                +"<td>"+insumos[i]['id_insumo']+"</td>\n"
                +"<td>"+insumos[i]['nombre']+"</td>\n"
                +"<td>"+insumos[i]['cantidad']+"</td>\n"
                +"<td>"+insumos[i]['umbral']+"</td>\n"
                +"<td>"+insumos[i]['proveedor']+"</td>\n"
               +"</tr>"
        $('.insumos').append(row);
    }
}

$(document).ready(function(){
    var ajax = $.ajax({
        data: {},
        url: "php/mostrarInsumo.php",
        type: 'POST',
        success: function( response ) {
            var insumos = JSON.parse( response );
            cargar_clientes( insumos );
        },
        error: function(response, status, error) {
            alert("No encontrado");
        }
    });
});
