/**
 * Created with IntelliJ IDEA.
 * User: jpm
 * Date: 4/11/13
 * Time: 10:55 PM
 * To change this template use File | Settings | File Templates.
 */



function procesarFormAgregarUnidadConsSession() {

    $("form[name=agregarUnidadConsSessionForm]").submit();

}

function procesarFormAgregarBrigadaSession() {

    $("form[name=agregarBrigadaSessionForm]").submit();

}

function procesarFormAgregarMaterialSession() {

    $("form[name=agregarMaterialSessionForm]").submit();

}

function abrirVentanaBusquedaUnidadCons() {
    $( "#ventanaBusquedaUnidadCons" ).dialog({
        width: 600,
        autoOpen: false
    });
    $( "#ventanaBusquedaUnidadCons" ).dialog( "open" );
}

function abrirVentanaBusquedaMateriales() {
    $( "#ventanaBusquedaMaterial" ).dialog({
        width: 600,
        autoOpen: false
    });
    $( "#ventanaBusquedaMaterial" ).dialog( "open" );
}

function abrirVentanaBusquedaBrigadas() {
    $( "#ventanaBusquedaBrigada" ).dialog({
        width: 600,
        autoOpen: false
    });
    $( "#ventanaBusquedaBrigada" ).dialog( "open" );
}


function editarMaterialSession(idMaterial, cantidad){

    //alert(idMaterial + " "+ cantidad);

    $.post(
        "/SOE/proyecto/procesandoEditarMaterialSesionTrabajo",
        {idMaterial: idMaterial, cantidad: cantidad},
        function(data){
            alert(data);
        });
}

function editarBrigadaSession(idBrigada, cantidad){

    //alert(idMaterial + " "+ cantidad);

    $.post(
        "/SOE/proyecto/procesandoEditarBrigadaSesionTrabajo",
        {idBrigada: idBrigada, cantidad: cantidad},
        function(data){
            alert(data);
        });
}

function editarUnidadConstructivaSession(idUnidadCons, cantidad){

   // alert(idUnidadCons + " "+ cantidad);

    $.post(
        "/SOE/proyecto/procesandoEditarUnidadConstructivaSesionTrabajo",
        {idUnidadCons: idUnidadCons, cantidad: cantidad},
        function(data){
            alert(data);
        });
}


//Esto fue eliminado debido a que quitamos el asunto de los precios contenmplar el precio
//De los materiales.
//function editarSuplidorSession(contenido) {
//
//    var idSuplidor;
//    var idMaterial;
//
//    contenido = contenido.split("/");
//
//    idSuplidor = contenido[0];
//    idMaterial = contenido[1];
//
//    $.post(
//        "/SOE/proyecto/procesandoEditarPrecioSuplidorSesionTrabajo",
//        {idSuplidor: idSuplidor, idMaterial: idMaterial},
//        function(data){
//
//            //alert(data);
//            $("td[id=precioSuplidor_"+idMaterial+"]").text("$ "+ data);
//        });
//
//   // alert(idMaterial+ " " + idSuplidor);
//
//}





