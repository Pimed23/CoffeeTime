cargar_reservas = function( reservas ) {
    var header = "<thead>\n" 
                    +"<tr>\n"
                        +"<th>Codigo</th>\n"
                        +"<th>Fecha</th>\n"
                        +"<th>Hora</th>\n"
                        +"<th>Cliente</th>\n"
                    +"</tr>\n"
                 +"</thread>";	
    $('.reservas').append(header);

 
    for( var i = 0; i < reservas.length; ++i ) {
        var row = "<tr>\n"
                +"<td>"+reservas[i]['id_reservacion']+"</td>\n"
                +"<td>"+reservas[i]['fecha']+"</td>\n"
                +"<td>"+reservas[i]['hora']+"</td>\n"
                +"<td>"+reservas[i]['nombre']+"</td>\n"
               +"</tr>"
        $('.reservas').append(row);
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
        url: "php/mostrarReservas.php",
        type: 'POST',
        success: function( response ) {
            var reservas = JSON.parse( response );
            cargar_reservas( reservas );
        },
        error: function(response, status, error) {
            alert("No encontrado");
        }
    });
});
