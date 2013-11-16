/**
 * Created with IntelliJ IDEA.
 * User: avathartech
 * Date: 03/12/13
 * Time: 10:50 AM
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(function(){

    $(".agregarMaterialOpcion").click(function(e){

        e.preventDefault();

        var idMaterial = $(this).attr("id");
        var nombre = $(this).attr("name");
        var cantidad = $("input[id=input_" + idMaterial + "]").val();
        var tipoProceso= $("#tipoProceso").val();

        agregarMaterial(idMaterial, nombre, cantidad, tipoProceso);


    });

    $(".inputCantidad").focusout(function(){

        var idMaterial = $(this).attr("id");
        var cantidad = $(this).val();


        modificarEstructuraMaterial(idMaterial, cantidad);
    });

    $("#limpiarListaMateriales").click(function(e){

        e.preventDefault();
        limpiarEstructuraMaterial();


    })
    //para limpiar los materiales del movimiento inventario
    $("#limpiarListaMaterialesInventario").click(function(e){

        e.preventDefault();
        limpiarEstructuraMaterialInventario();
    })

    //para limpiar los materiales del movimiento transferencia
    $("#limpiarListaMaterialesInventarioTransferencia").click(function(e){

        e.preventDefault();
        limpiarEstructuraMaterialTransferencia();
    })
});

function urlDeProceso(accion) {

    if(accion == "agregar"){
        return "/SOE/materiales/procesandoAgregarMaterialEstructuraMaterial";
    } else if(accion == "modificar"){
        return "/SOE/materiales/procesandoModificarMaterialEstructuraMaterial";
    } else if(accion == "limpiar"){
        return "/SOE/materiales/procesandoLimpiarEstructuraMaterial";
    } else if (accion == "mantenerDatosUnidadCons"){
        return "/SOE/materiales/mantenerDatosUnidadCons";
    } else if (accion == "limpiarMovimiento"){
        return "/SOE/inventario/procesandoLimpiarMaterialMovimiento";
    } else if (accion == "limpiarMovimientoTransferencia"){
        return "/SOE/inventario/procesandoLimpiarMaterialesTranferencia";
    }

}
function abrirVentana() {
    $( "#ventanaBusquedaMaterial" ).dialog({
        width: 600,
        close: function( event, ui ) {

            var unidadNombre = $("#nombre").val();
            var unidadDescripcion = $("#descripcion").val();
            var unidadServicio = $("#servicio").val();
            var unidadPrecioManoObraGenerico = $("#precioManoObraGenerico").val();
            var unidadHoraTrabajoGenerico = $("#horaTrabajoGenerico").val();

            $.post(
                urlDeProceso("mantenerDatosUnidadCons"),
                {unidadNombre: unidadNombre, unidadDescripcion: unidadDescripcion, unidadServicio: unidadServicio, unidadPrecioManoObraGenerico: unidadPrecioManoObraGenerico, unidadHoraTrabajoGenerico: unidadHoraTrabajoGenerico},
                function(data){
                  alert(data);

                });

            window.location = "agregarUnidadConstructiva";

        },
        autoOpen: false
    });
    $( "#ventanaBusquedaMaterial" ).dialog( "open" );
}


//para cerrar la ventana del movimientoInventario
function abrirVentanaMovimiento(){
    $("#ventanaBusquedaMaterial").dialog({
        width: 600,
        close: function(event, ui){window.location= "movimientoInventario"}, autoOpen:false
    });
    $( "#ventanaBusquedaMaterial").dialog("open");
}

//para cerrar la ventana del movimiento transferencia
function abrirVentanaMovimientoTransferencia(){
    $("#ventanaBusquedaMaterial").dialog({
        width: 600,
        close: function(event, ui){window.location= "movInventarioTransferencia"}, autoOpen:false
    });
    $( "#ventanaBusquedaMaterial").dialog("open");
}


function agregarMaterial(idMaterial, nombre, cantidad, tipoProceso) {

    $.post(
        urlDeProceso("agregar"),
        {idMaterial: idMaterial, nombre: nombre, cantidad: cantidad, tipoProceso: tipoProceso},
        function(data){
            alert(data);

        });
}



function limpiarEstructuraMaterial() {

    var unidadNombre = $("#nombre").val();
    var unidadDescripcion = $("#descripcion").val();

    $.post(
        urlDeProceso("limpiar"),
        {unidadNombre: unidadNombre, unidadDescripcion: unidadDescripcion},
        function(data){
            window.location = "agregarUnidadConstructiva";
        });

}

//funcion para limpiar los materiales del movimiento inventario

function limpiarEstructuraMaterialInventario(){

    $.post(
        urlDeProceso("limpiarMovimiento"),
        function(data){
            window.location = "movimientoInventario";
        });

}
//funcion para limpiar los materiales del movimiento inventario

function limpiarEstructuraMaterialTransferencia(){

    $.post(
        urlDeProceso("limpiarMovimientoTransferencia"),
        function(data){
            window.location = "movInventarioTransferencia";
        });

}


//esta es para la vista movimiento inventario
function modificarCostoMaterial(){
    return "/SOE/inventario/procesandoModificarCostoMaterial";
}
//para el movimiento del inventario
function modificarCantidadMaterial(){
    return "/SOE/inventario/procesandoModificarCantidadMaterial";
}

//para el movimiento del inventario
function modificarCantidadMaterialTranfer(){
    return "/SOE/inventario/procesandoModificarCantidadMaterialTranfer";
}

//procesar formulario unidad constructiva
function procesarFormulario() {
    $("form[name=agregarUnidadConstructivaForm]").submit();
}

//procesar formulario movimiento inventario
function procesarMovimientoInventario(){
    $("form[name=movimientoInventario]").submit();
}

//procesar formulario movimiento inventario transferencia
function procesarMovTransferencia(){
    $("form[name=movimientoInventarioTransferencia]").submit();
}

//procesar formulario de editar las transferencias
function procesarEditarTransferencia(){
    $("form[name=editarTransferencia]").submit();
}