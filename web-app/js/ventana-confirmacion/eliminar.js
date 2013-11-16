/**
 * Created with IntelliJ IDEA.
 * User: jpm
 * Date: 4/6/13
 * Time: 4:29 PM
 * To change this template use File | Settings | File Templates.
 */

function abrirVentanaDialogConfirmacionEliminar(opcion, idElemento, idElementoAlterno1, idElementoAlterno2) {

    if(opcion == "material") {

        $("#eliminarElementoForm").attr("action", "procesandoEliminarMaterial");
        $("#idElemento").attr("name", 'idMaterial');

    }  else if (opcion == "categoria") {

        $("#eliminarElementoForm").attr("action", "procesandoEliminarCategoria");
        $("#idElemento").attr("name", 'idCategoria');

    } else if(opcion == "subCategoria") {

        $("#eliminarElementoForm").attr("action", "procesandoEliminarSubCategoria");
        $("#idElemento").attr("name", 'idSubCategoria');

    } else if(opcion == "unidadConstructiva") {

        $("#eliminarElementoForm").attr("action", "procesandoEliminarUnidadConstructiva");
        $("#idElemento").attr("name", 'idUnidadConstructiva');

    } else if(opcion == "suplidor") {

        $("#eliminarElementoForm").attr("action", "procesandoEliminarSuplidor");
        $("#idElemento").attr("name", 'idSuplidor');

    } else if(opcion == "suplidorMaterial") {

        $("#eliminarElementoForm").attr("action", "procesandoEliminarSuplidorMaterial");
        $("#idElemento").attr("name", 'idDetallePrecioSuplidor');
        $("#idElementoAlterno1").attr("name", 'idMaterial');
        $("#idElementoAlterno2").attr("name", 'requestFrom');

    } else if(opcion == "subCategoriaEnCat"){ //eliminar sub categoria desde: agregarSubCategoriaCat

        $("#eliminarElementoForm").attr("action", "procesandoEliminarSubCategoria");
        $("#idElemento").attr("name", 'idSubCategoria');

    } else if(opcion == "proyecto") {

        $("#eliminarElementoForm").attr("action", "procesandoEliminarProyecto");
        $("#idElemento").attr("name", 'idProyecto');

    } else if (opcion == "materialSesionTrabajo"){

        $("#eliminarElementoForm").attr("action", "procesandoEliminarMaterialSesionTrabajo");
        $("#idElemento").attr("name", 'idMaterial');

    } else if(opcion == "unidadConsSesionTrabajo") {

        $("#eliminarElementoForm").attr("action", "procesandoEliminarUnidadConsSesionTrabajo");
        $("#idElemento").attr("name", 'idUnidadCons');

    } else if(opcion == "brigadaSesionTrabajo"){

        $("#eliminarElementoForm").attr("action", "procesandoEliminarBrigadaSesionTrabajo");
        $("#idElemento").attr("name", 'idBrigada');

    } else if(opcion == "trabajo") {

        $("#eliminarElementoForm").attr("action", "procesandoEliminarTrabajo");
        $("#idElemento").attr("name", 'idTrabajo');

    }

    if(opcion == "suplidorMaterial"){

        $("#idElemento").attr("value", idElemento);
        $("#idElementoAlterno1").attr("value", idElementoAlterno1);
        $("#idElementoAlterno2").attr("value", idElementoAlterno2);

    } else
        $("#idElemento").attr("value", idElemento);

    $( "#dialogConfirmacionEliminar" ).dialog({
        autoOpen: false,
        buttons: {
            "Sí": function() {
                $("#eliminarElementoForm").submit();
            },
            "Cancelar": function() {

                $( this ).dialog( "close" );
            }
        }

    });
    $( "#dialogConfirmacionEliminar" ).dialog( "open" );
}
