var total = 0;
var cant_facturas = 0;
cargar_facturas = function( facturas ) {
    var header = "<thead>\n" 
                    +"<tr>\n"
                        +"<th>Nro Factura</th>\n"
                        +"<th>Nombre</th>\n"
                        +"<th>Monto pagado</th>\n"
                        +"<th>Efectivo</th>\n"
                        +"<th>Cambio</th>\n"
                        +"<th>Fecha</th>\n"
                        +"<th>Forma de pago</th>\n"
                    +"</tr>\n"
                 +"</thread>";

    $('.facturas').append(header);
 
    for( var i = 0; i < facturas.length; ++i ) {
        var row = "<tr>\n"
                +"<td>"+facturas[i]['id_factura']+"</td>\n"
                +"<td>"+facturas[i]['nombre']+"</td>\n"
                +"<td>"+facturas[i]['total_pagar']+"</td>\n"
                +"<td>"+facturas[i]['efectivo']+"</td>\n"
                +"<td>"+facturas[i]['cambio']+"</td>\n"
                +"<td>"+facturas[i]['fecha']+"</td>\n"
                +"<td>"+facturas[i]['modo']+"</td>\n"
               +"</tr>"
        $('.facturas').append(row);
    }

    total = 0;
    cant_facturas = 0;

    for( var i = 0; i < facturas.length; ++i ) {
        total += parseFloat(facturas[i]['total_pagar']);
        cant_facturas = i + 1;
    }

    var footer = "<tr>\n"
                +"<td>Cantidad</td>\n"
                +"<td>"+cant_facturas+"</td>\n"
                +"<td>Activos totales</td>\n"
                +"<td>"+total.toFixed(2)+"</td>\n"
                +"<td></td>\n"
                +"<td></td>\n"
                +"<td></td>\n"
            +"</tr>"
    $('.facturas').append(footer);

}
function limpiar() {
    $("thead").remove();
    $("tr").remove();
    $("td").remove();
}

$(document).ready(function(){
    var ajax = $.ajax({
        data: {},
        url: "php/mostrarFactura.php",
        type: 'POST',
        success: function( response ) {
            var facturas = JSON.parse( response );
            cargar_facturas( facturas );
        },
        error: function(response, status, error) {
            alert("No encontrado");
        }
    });
});
