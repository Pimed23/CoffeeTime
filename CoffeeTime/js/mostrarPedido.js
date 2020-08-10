var total = 0;
cargar_pedidos = function( pedidos ) {
    var header = "<thead>\n" 
                    +"<tr>\n"
                        +"<th>Codigo</th>\n"
                        +"<th>Nombre</th>\n"
                        +"<th>Fecha</th>\n"
                        +"<th>Cantidad</th>\n"
                        +"<th>Precio</th>\n"
                        +"<th>Total</th>\n"
                    +"</tr>\n"
                 +"</thread>";	
    $('.pedidos').append(header);

    total = 0
    for( var i = 0; i < pedidos.length; ++i ) {
        var parcial = parseFloat(pedidos[i]['precio']) * parseFloat(pedidos[i]['cantidad']);
        total += parcial;
        var row = "<tr>\n"
                +"<td>"+pedidos[i]['id_pedido']+"</td>\n"
                +"<td>"+pedidos[i]['nombre']+"</td>\n"
                +"<td>"+pedidos[i]['fecha']+"</td>\n"
                +"<td>"+pedidos[i]['cantidad']+"</td>\n"
                +"<td>"+pedidos[i]['precio']+"</td>\n"
                +"<td>"+parcial.toFixed(2)+"</td>\n"
               +"</tr>"
        $('.pedidos').append(row);
    }

    var footer = "<tr>\n"
                +"<td>Gastos totales</td>\n"
                +"<td></td>\n"
                +"<td></td>\n"
                +"<td></td>\n"
                +"<td></td>\n"
                +"<td>"+total.toFixed(2)+"</td>\n"
            +"</tr>"
    $('.pedidos').append(footer);
}

function limpiar() {
    $("thead").remove();
    $("tr").remove();
    $("td").remove();
}

$(document).ready(function(){
    var ajax = $.ajax({
        data: {},
        url: "php/mostrarPedido.php",
        type: 'POST',
        success: function( response ) {
            var pedidos = JSON.parse( response );
            cargar_pedidos( pedidos );
        },
        error: function(response, status, error) {
            alert("No encontrado");
        }
    });
});