cargar_productos = function( productos ) {
    for( var i = 0; i < productos.length; ++i ) {
        var row = "<li class=dinamic><a class=dinamic href='#?producto="+productos[i]['id_producto']+"' ondblclick='cargarVenta()'><img src='pictures/"+ productos[i]['imagen']+"' class='image__'></a></li>\n"
        $('.list-image').append(row);
    }
}

function limpiar() {
    $(".dinamic").remove();
    $("img").remove();
}

$(document).ready(function(){
    var ajax = $.ajax({
        data: {},
        url: "php/mostrarProducto.php",
        type: 'POST',
        success: function( response ) {
            var productos = JSON.parse( response );
            console.log( productos );
            cargar_productos( productos );
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
            url: "php/filtrarProducto.php",
            type: 'POST',
            success: function( response ) {
                console.log(response);
                var productos = JSON.parse( response );
                limpiar();
                cargar_productos( productos );
            },
            error: function(response, status, error) {
                alert("No encontrado");
            }
        });
    });
}