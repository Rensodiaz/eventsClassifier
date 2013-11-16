<%--
  Created by IntelliJ IDEA.
  User: vacax
  Date: 10/01/13
  Time: 23:18
  Representa el template
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="template" />
    <title><g:layoutTitle default="Prueba..."/></title>
    <g:pageProperty name="page.header" />
</head>
<body>

<!-- Some dialogs etc. -->

<!-- The loading box -->
<div id="loading-overlay"></div>
<div id="loading">
    <span>Loading...</span>
</div>
<!-- End of loading box -->

<!--------------------------------->
<!-- Now, the page itself begins -->
<!--------------------------------->

<!-- The toolbar at the top -->
<section id="toolbar">
    <div class="container_12">

        <!-- Left side -->
        <div class="left">
            <ul class="breadcrumb">

                <li><a href="inicio">Twitter App DM</a></li>
                <g:pageProperty name="page.izquierda_boton"/>
            </ul>
        </div>
        <!-- End of .left -->

        <!-- Right side -->
        <div class="right">
            <ul>
                <li class="red"><a href="logout">Log Out</a></li>
                <g:pageProperty name="page.derecha_boton"/>
            </ul>
        </div><!-- End of .right -->

        <div class="phone">

            <!-- User Link -->
            <li><a href="#"><span class="icon icon-user"></span></a></li>
            <!-- Navigation -->
            <li><a class="navigation" href="#"><span class="icon icon-list"></span></a></li>

        </div>

    </div>
</section><!-- End of #toolbar -->

<!-- The header containing the logo -->
<header class="container_12">
    <a href="#"><img src="${resource(dir: "img", file: "logo.png")}" alt="Mango" width="191" height="60"></a>
    <a class="phone-title" href="#"><img src="${resource(dir: "img", file: "logo-mobile.png")}" alt="Mango" height="22" width="70" /></a>

    <div class="buttons">
        <a href="#">
            <span class="icon icon-sitemap"></span>
            grafica de actividades
        </a>
    </div>
</header><!-- End of header -->

<!-- The container of the sidebar and content box -->
<div role="main" id="main" class="container_12 clearfix">

    <!-- The blue toolbar stripe -->
    <section class="toolbar">
        <div class="user">
            <g:if test="${session.user!=null}">
                <div class="avatar">
                    %{--<img src="${resource(dir: "img/layout/content/toolbar/user", file: "avatar.png")}"/>--}%
                    <img src="${session.user.profileImg}"/>
                </div>

                <span>${session.user.screenName}</span>
                <ul>
                    <li class="line"></li>
                    <li><a href="logout">Logout</a></li>
                </ul>
            </g:if>
        </div>
        <ul class="shortcuts">
            <g:pageProperty name="page.shortcuts"/>
        </ul>
        <input type="search" data-source="extras/search.php" placeholder="Search..." autocomplete="off">
    </section><!-- End of .toolbar-->

<!-- The sidebar -->
    <aside>
        <div class="top">

            <!-- Navigation -->
            <nav><ul class="collapsible accordion">

                <!--Das -->
                <li class="current"><a href="#"><img src="${resource(dir: "img/icons/packs/fugue/16x16", file: "dashboard.png")}" alt="" height=16 width=16>Dashboard</a></li>


               <!-- Movimiento inventario-->
                <li>
                    <a class="close" href="javascript:void(0);"><img src="${resource(dir: "img/icons/packs/fugue/16x16", file: "ui-layered-pane.png")}" alt="" height=16 width=16>Sugerencias</a>
                    <ul>
                        <li><g:link controller="TwitterLogin" action="closterizarModelHashtags"><span class="icon icon-table"></span>Sugerencia por Hashtags</g:link></li>
                        <li><g:link controller="TwitterLogin" action="closterizarModelRetweets"><span class="icon icon-table"></span>Sugerencia por Retweets</g:link></li>

                    </ul>
                </li>
                <!-- Fin movimiento inventario-->


            </ul></nav><!-- End of nav -->

        </div><!-- End of .top -->
    </aside><!-- End of sidebar -->

<!-- Here goes the content. -->
    <section id="content" class="container_12 clearfix" >

        <!-- Your Boxes Here! -->
        <g:pageProperty name="page.contenido" />

    </section><!-- End of #content -->

</div><!-- End of #main -->

<!-- The footer -->
<footer class="container_12">
    <ul class="grid_6">
        <li><a href="#">Acerca De</a></li>
    </ul>

    <span class="grid_6">
        Copyright &copy; ${new Date().format("yyyy")} <a href="http://www.avathartech.com">AvatharTech</a>
    </span>
</footer><!-- End of footer -->

<!-- Spawn $$.loaded -->
<script>
    $$.loaded();
</script>

<!-- Prompt IE 6 users to install Chrome Frame. Remove this if you want to support IE 6.
	   chromium.org/developers/how-tos/chrome-frame-getting-started -->
<!--[if lt IE 7 ]>
	<script defer src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
	<script defer>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
	<![endif]-->


</body>
</html>