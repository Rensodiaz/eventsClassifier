<%--
  Created by IntelliJ IDEA.
  User: Renso
  Date: 4/23/13
  Time: 12:37 PM
  To change this template use File | Settings | File Templates.
--%>
<g:applyLayout name="template_contenido">

    <content tag="contenido">
        <!-- Inicio de contenido -->
        <div class="grid_12">


        <g:if test="${flash.validacion == true}">  <!-- Validando los campos del formulario -->
            <div class="alert success">
                <span class="icon"></span>
                ${flash.mensajeValidacion}
            </div>
        </g:if>
        <g:elseif test="${flash.validacion == false}">  <!-- Si ocurrió algún inconveniente al tratar de editar la categoría -->
            <div class="alert error">
                <span class="icon"></span>
                ${flash.mensajeValidacion}
            </div>
        </g:elseif>


            <h1> Informacion del Usuario </h1>

        <div id="datosPrincipal">
            <g:form class="grid_12">

                <div class="row">
                    <label for="id">
                        <strong>Username</strong>
                    </label>
                    <div>
                        <input type="text" name="nombre" id="id" value="${usuario.screenName}"  disabled="true" />
                    </div>
                </div>
                <div class="row">
                    <label for="nombre">
                        <strong>Nombre</strong>
                    </label>
                    <div>
                        <input type="text" name="nombre" id="nombre" value="${usuario.name}" disabled="true" />
                    </div>
                </div>
                <div class="row">
                    <label for="descripcion">
                        <strong>Descripción</strong>
                    </label>
                    <div>
                        <textarea type="text" name="descripcion" id="descripcion" disabled="true">${usuario.description}</textarea>
                    </div>
                </div>
                <div class="tabletools">
                 <div class="left">
                     <g:link class="button red" action="closterizarModelHashtags" >Regresar</g:link>
                </div>
                <div class="right">

                    <g:link class="button blue" controller="TwitterLogin" action="procesandoSeguirUsuario" params="[idUsuario: usuario.id, requestFrom:'visualizarUsuario']">Seguir usuario</g:link>

                </div>

            </g:form>
        </div>
        <!-- Fin de tab datos principal-->



        </div>
        <!-- Fin de inicio de contenido -->
    </content>
</g:applyLayout>