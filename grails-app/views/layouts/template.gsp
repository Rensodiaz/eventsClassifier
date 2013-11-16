<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->

<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">

    <link rel="dns-prefetch" href="//fonts.googleapis.com" />
    <link rel="dns-prefetch" href="//themes.googleusercontent.com" />

    <link rel="dns-prefetch" href="//ajax.googleapis.com" />
    <link rel="dns-prefetch" href="//cdnjs.cloudflare.com" />
    <link rel="dns-prefetch" href="//agorbatchev.typepad.com" />

    <!-- Use the .htaccess and remove these lines to avoid edge case issues.
	   More info: h5bp.com/b/378 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title><g:layoutTitle default="Sistema Obras Electricas" /></title>
    <meta name="description" content="Sistemas para la gestion de obras electricas">
    <meta name="author" content="Avathartech">

    <!-- Mobile viewport optimized: h5bp.com/viewport -->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- iPhone: Don't render numbers as call links -->
    <meta name="format-detection" content="telephone=no">

    <link rel="shortcut icon" href="favicon.ico" />
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->
    <!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->


    <!-- The Styles -->
    <!-- ---------- -->

    <!-- Layout Styles -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'grid.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'layout.css')}" />

    <!-- Icon Styles -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'icons.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css/fonts', file: 'font-awesome.css')}" />
    <!--[if IE 8]><link rel="stylesheet" href="${resource(dir: 'css/fonts', file: 'font-awesome-ie7.css')}" /><![endif]-->

    <!-- External Styles -->
    <link rel="stylesheet" href="${resource(dir: 'css/external', file: 'jquery-ui-1.8.21.custom.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css/external', file: 'jquery.chosen.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css/external', file: 'jquery.cleditor.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css/external', file: 'jquery.colorpicker.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css/external', file: 'jquery.elfinder.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css/external', file: 'jquery.fancybox.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css/external', file: 'jquery.jgrowl.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css/external', file: 'jquery.plupload.queue.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css/external/syntaxhighlighter', file: 'shCore.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css/external/syntaxhighlighter', file: 'shThemeDefault.css')}"/>

    <!-- Elements -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'elements.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'forms.css')}" />

    <!-- OPTIONAL: Print Stylesheet for Invoice -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'print-invoice.css')}" />

    <!-- Typographics -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'typographics.css')}" />

    <!-- Responsive Design -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'media-queries.css')}" />

    <!-- Bad IE Styles -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'ie-fixes.css')}" />





    <!-- The Scripts -->
    <!-- ----------- -->
    <script>
        var imagenRuta="${application.contextPath}/";
    </script>

    <!-- JavaScript at the top (will be cached by browser) -->

    <!-- Load Webfont loader -->
    <script type="text/javascript">
        window.WebFontConfig = {
            google: { families: [ 'PT Sans:400,700' ] },
            active: function(){ $(window).trigger('fontsloaded') }
        };
    </script>
    <script defer async src="https://ajax.googleapis.com/ajax/libs/webfont/1.0.28/webfont.js"></script>

    <!-- Essential polyfills -->
    <script src="${resource(dir: "js/mylibs/polyfills", file: "modernizr-2.6.1.min.js")}"></script>
    <script src="${resource(dir: "js/mylibs/polyfills", file: "respond.js")}"></script>
    <script src="${resource(dir: "js/mylibs/polyfills", file: "matchmedia.js")}"></script>
    <!--[if lt IE 9]><script src="${resource(dir: "js/mylibs/polyfills", file: "selectivizr-min.js")}"></script><![endif]-->
    <!--[if lt IE 10]><script src="${resource(dir: "js/mylibs/polyfills", file: "excanvas.js")}"></script><![endif]-->
    <!--[if lt IE 10]><script src="${resource(dir: "js/mylibs/polyfills", file: "classlist.js")}"></script><![endif]-->

    <!-- Grab frameworks from CDNs -->
    <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="${resource(dir: "js/libs", file: "jquery-1.7.2.min.js")}"><\/script>')</script>

    <!-- Do the same with jQuery UI -->
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>
    <script>window.jQuery.ui || document.write('<script src="${resource(dir: "js/libs", file: "jquery-ui-1.8.21.min.js")}"><\/script>')</script>

    <!-- Do the same with Lo-Dash.js -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/lodash.js/0.4.2/lodash.min.js"></script>
    <script>window._ || document.write('<script src="${resource(dir: "js/libs", file: "lo-dash.min.js")}"><\/script>')</script>



    <!-- scripts concatenated and minified via build script -->

    <!-- General Scripts -->
    <script src="${resource(dir: "js/mylibs", file: "jquery.hashchange.js")}"></script>
    <script src="${resource(dir: "js/mylibs", file: "jquery.idle-timer.js")}"></script>
    <script src="${resource(dir: "js/mylibs", file: "jquery.plusplus.js")}"></script>
    <script src="${resource(dir: "js/mylibs", file: "jquery.jgrowl.js")}"></script>
    <script src="${resource(dir: "js/mylibs", file: "jquery.scrollTo.js")}"></script>
    <script src="${resource(dir: "js/mylibs", file: "jquery.ui.touch-punch.js")}"></script>
    <script src="${resource(dir: "js/mylibs", file: "jquery.ui.multiaccordion.js")}"></script>
    <script src="${resource(dir: "js/mylibs", file: "number-functions.js")}"></script>

    <!-- Forms -->
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.autosize.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.checkbox.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.chosen.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.cleditor.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.colorpicker.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.ellipsis.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.fileinput.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.fullcalendar.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.maskedinput.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.mousewheel.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.placeholder.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.pwdmeter.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.ui.datetimepicker.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.ui.spinner.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms", file: "jquery.validate.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms/uploader", file: "plupload.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms/uploader", file: "plupload.html5.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms/uploader", file: "plupload.html4.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms/uploader", file: "plupload.flash.js")}"></script>
    <script src="${resource(dir: "js/mylibs/forms/uploader/jquery.plupload.queue", file: "jquery.plupload.queue.js")}"></script>

    <!-- Charts -->
    <script src="${resource(dir: "js/mylibs/charts", file: "jquery.flot.js")}"></script>
    <script src="${resource(dir: "js/mylibs/charts", file: "jquery.flot.orderBars.js")}"></script>
    <script src="${resource(dir: "js/mylibs/charts", file: "jquery.flot.pie.js")}"></script>
    <script src="${resource(dir: "js/mylibs/charts", file: "jquery.flot.resize.js")}"></script>

    <!-- Explorer -->
    <script src="${resource(dir: "js/mylibs/explorer", file: "jquery.elfinder.js")}"></script>

    <!-- Fullstats -->
    <script src="${resource(dir: "js/mylibs/fullstats", file: "jquery.css-transform.js")}"></script>
    <script src="${resource(dir: "js/mylibs/fullstats", file: "jquery.animate-css-rotate-scale.js")}"></script>
    <script src="${resource(dir: "js/mylibs/fullstats", file: "jquery.sparkline.js")}"></script>

    <!-- Syntax Highlighter -->
    <script src="${resource(dir: "js/mylibs/syntaxhighlighter", file: "shCore.js")}"></script>
    <script src="${resource(dir: "js/mylibs/syntaxhighlighter", file: "shAutoloader.js")}"></script>

    <!-- Dynamic Tables -->
    <script src="${resource(dir: "js/mylibs/dynamic-tables", file: "jquery.dataTables.js")}"></script>
    <script src="${resource(dir: "js/mylibs/dynamic-tables", file: "jquery.dataTables.tableTools.zeroClipboard.js")}"></script>
    <script src="${resource(dir: "js/mylibs/dynamic-tables", file: "jquery.dataTables.tableTools.js")}"></script>

    <!-- Gallery -->
    <script src="${resource(dir: "js/mylibs/gallery", file: "jquery.fancybox.js")}"></script>

    <!-- Tooltips -->
    <script src="${resource(dir: "js/mylibs/tooltips", file: "jquery.tipsy.js")}"></script>

    <!-- Do not touch! -->
    <script src="${resource(dir: "js", file: "mango.js")}"></script>
    <script src="${resource(dir: "js", file: "plugins.js")}"></script>
    <script src="${resource(dir: "js", file: "script.js")}"></script>

    <!-- Your custom JS goes here -->
    <script src="${resource(dir: "js", file: "app.js")}"></script>

    <!-- end scripts -->
    <g:layoutHead/>

</head>

<body>

<g:layoutBody/>

</body>
</html>