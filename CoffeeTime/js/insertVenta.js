var arrProductos = [];
var arrMostrar = [];
var total = 0;

contar_repetidos = function( productos, repetido ) {
    var count = 0;
    for( var i = 0; i < productos.length; ++i ) {
        if( productos[i][0]['id_producto'] == repetido[0]['id_producto']) {
            ++count;
        }
    }
    return count;
}


cargar_ventas = function( productos ) {
    var header = "<thead>\n" 
                    +"<tr>\n"
                        +"<th>Cantidad</th>\n"
                        +"<th>Producto</th>\n"
                        +"<th>Precio Unitario</th>\n"
                        +"<th>Precio Total</th>\n"
                    +"</tr>\n"
                 +"</thread>";	
    $('.ventas').append(header);
    
    for( var i = 0; i < productos.length; ++i ) {
        var row = "<tr>\n"
                +"<td>"+productos[i][0]+"</td>\n"
                +"<td>"+productos[i][1]+"</td>\n"
                +"<td>"+productos[i][2]+"</td>\n"
                +"<td>"+productos[i][3]+"</td>\n"
               +"</tr>"
        $('.ventas').append(row);
    }
    total = 0;
    for( var i = 0; i < productos.length; ++i ) {
        total += parseFloat(productos[i][3]);
    }

    var footer = "<tr>\n"
                +"<td>Total</td>\n"
                +"<td></td>\n"
                +"<td></td>\n"
                +"<td>"+total.toFixed(2)+"</td>\n"
            +"</tr>"
    $('.ventas').append(footer);
}

function limpiar() {
    $("thead").remove();
    $("tr").remove();
    $("td").remove();
}

function cargarVenta(){
    var paramstr = window.location.href;
    var datos = paramstr.substring(41);
    $(document).ready(function(){
        var ajax = $.ajax({
            data: datos,
            url: "php/insertVenta.php",
            type: 'POST',
            success: function( response ) {
                console.log(response);
                var productos = JSON.parse( response );
                arrProductos.push(productos);
                var cant = contar_repetidos( arrProductos, productos );
                var temp = [ cant, productos[0]['nombre'], parseFloat(productos[0]['precio']).toFixed(2), (cant * parseFloat(productos[0]['precio'])).toFixed(2)];
                
                for( var i = 0; i < arrMostrar.length; ++i ) {

                    if( arrMostrar[i][1] == temp[1]) {
                        arrMostrar.splice( i, 1 );
                    }
                }

                arrMostrar.push(temp);
                limpiar();
                console.log(arrMostrar);
                cargar_ventas( arrMostrar );
            },
            error: function(response, status, error) {
                alert("No encontrado");
            }
        });
    });
}

function enviar_data() {
    location.href='agregar-factura.html?total='+total;
}