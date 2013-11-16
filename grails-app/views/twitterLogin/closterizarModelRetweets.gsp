<%--
  Created by IntelliJ IDEA.
  User: Renso
  Date: 4/23/13
  Time: 4:19 AM
  To change this template use File | Settings | File Templates.
--%>

<g:applyLayout name="template_contenido">

    <content tag="contenido">

        <h1> Visualizando Usuarios Recomendados por Hashtags </h1>

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

    <div class="grid_12">
        <div class="box">
            <div class="header">
                <h2>Lista de usuarios</h2>
            </div>
            <div class="content">

                <table class="styled dynamic">
                    <thead>
                    <tr>
                        <th>Username</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Acciones</th>
                    </tr>

                    </thead>
                    <tbody>
                    <g:each var="usuario" in="${usersData}">
                        <tr>
                            <td>${usuario.screenName}</td>
                            <td>${usuario.name}</td>
                            <td>${usuario.description}</td>
                            <td>
                                <g:link original-title="Ver perfil" href="#" class="button small grey tooltip" data-gravity="s" action="visualizarUsuario"  params="[idUsuario: usuario.id]"><i class="icon-search"></i></g:link>
                                <g:link original-title="Seguir" href="#" class="button small grey tooltip" data-gravity="s" action="procesandoSeguirUsuario"  params="[idUsuario: usuario.id, requestFrom: 'listarUsuarios']"><i class="icon-thumbs-up"></i></g:link>
                                <g:link original-title="Seguir" href="#" class="button small grey tooltip" data-gravity="s" action="procesandoSeguirUsuario"  params="[idUsuario: usuario.id, requestFrom: 'listarUsuarios']"><i class="icon-thumbs-up"></i></g:link>
                            </td>
                        </tr>

                    </g:each>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
        <!-- Fin de inicio de contenido -->
    </content>
</g:applyLayout>