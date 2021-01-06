<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_document.xsl                             -->
<!-- Content : REM XSLT for subjects at US - document         -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2020/01/06                                     -->
<!-- Version : 3.1                                            -->
<!-- ======================================================== -->

<!-- ======================================================== -->
<!-- exclude-result-prefixes="rem" must be set in all files   -->
<!-- to avoid xmlsn:rem="..." to appear in HTML tags.         -->
<!-- ======================================================== -->

<!-- ======================================================== -->
<!-- Version 3.1                                              -->
<!-- Markdown to HTML transformation performed in XSLT using  -->
<!-- msxsl:script with showdown 1.0.2. It is much faster than -->
<!-- doing it in the browser.                                 -->
<!-- ======================================================== -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    exclude-result-prefixes="rem"
>

<!-- ======================================================== -->
<!-- Specification Document template                          -->
<!-- ======================================================== -->

<xsl:template match="
    rem:c_requirementsSpecification |
    rem:d_requirementsSpecification |
    rem:defectsSpecification        |
    rem:changeRequestsSpecification"
>
    <!-- <!doctype html> -->
    <xsl:text disable-output-escaping='yes'>&lt;!doctype html&gt;&#xa;</xsl:text>

    <html lang="{$rem:lang}">

    <!-- header -->
    <head>
        <meta charset="iso-8859-1"/>
        <meta name="generatedBy" content="REMUS"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/amador-duran-toro/remus/assets/stylesheets/remus.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/amador-duran-toro/remus/assets/stylesheets/madeja.css"/>

        <title>
            <xsl:value-of select="$rem:lang_project"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="../rem:name"/>
        </title>

        <script>
            // array for user warnings
            var warnings = new Array();
        </script>
    </head>

    <!-- document body -->
    <body>

        <div id="warning_container" class="ui-widget">
            <span id="warning_title"><xsl:value-of select="$rem:lang_warnings"/></span>
            <div id="warning_messages"></div>
        </div>

        <!-- Cover -->
        <xsl:call-template name="document_cover"/>

        <xsl:call-template name="rem:pagebreak"/>

        <!-- Table of contents -->
        <nav id="toc" role="navigation">
            <h1><xsl:value-of select="$rem:lang_TOC"/></h1>
            <ul class="toc_list toc_list_level_1">
                <xsl:apply-templates select="rem:section|rem:paragraph[starts-with(normalize-space(rem:name), $rem:part_tag)]" mode="toc"/>
            </ul>
        </nav>

        <xsl:call-template name="rem:pagebreak"/>

        <!-- Document body -->

        <!-- apply templates to all document's children except documents's properties -->
        <xsl:apply-templates select="*[not(contains('name version comments',local-name()))]"/>

        <!-- ======================================================== -->
        <!-- jQuery 1.12.4 is the latest version of jQuery that is    -->
        <!-- supposed to support IE6, IE7, and IE8.                   -->
        <!--                                                          -->
        <!-- IE7 accepts the minified versions of jQuery 1.12.4 and   -->
        <!-- jQueryUI 1.12.1, although the latter is not used.        -->
        <!-- ======================================================== -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
        <script>
            // set tooltips of rem:ref references to glossary items or class supertypes
            $( ".rem_ref" ).each( function () {
                var sharp_position = this.href.lastIndexOf("#");
                var id_glossary_item = this.href.substring( sharp_position + 1 ) + "-text-html";
                var id_supertype = this.href.substring( sharp_position + 1 ) + "-description-html";

                // some rem:refs to use cases do not have -text-html elements
                if ( document.getElementById( id_glossary_item ) )
                    this.title = document.getElementById( id_glossary_item ).innerText;

                else if ( document.getElementById( id_supertype ) )
                    this.title = document.getElementById( id_supertype ).innerText;
            });

            // set tooltips of rem:tbd elements
            $( ".tbd" ).each( function () {
                this.title = '<xsl:value-of select="$rem:lang_TBD_expanded"/>';
            });

            // show warnings (if any)
            if ( warnings.length ) {
                var warning_list = $("<ul></ul>");
                for ( var i = 0; i <xsl:text disable-output-escaping="yes">&lt;</xsl:text> warnings.length; i++ ) {
                    var warning = warnings[ i ];
                    var warning_link = $('<a href ="#' + warning.oid + '">' + warning.oid + '</a>' );
                    var warning_message = ": " + warning.message;
                    var warning_item = $("<li></li>").append(warning_link, warning_message);

                    warning_list.append( warning_item );
                }
                $("#warning_messages").append( warning_list );
                $("#warning_container").show();
            }

            // manage traceability matrices buttons
            function update_font_size( parent_table, size )
            {
                var matrix_columns = parent_table.find( "th.matrix_column" );
                var font_size = parseInt( matrix_columns.eq(0).css( "font-size" ), 10 );

                matrix_columns.css( "font-size", font_size + size );
            }

            $( "button.reduce_font" ).click( function() {
                var parent_table = $(this).parents( "table.traceability_matrix" );
                update_font_size( parent_table, -1 );
            });

            $( "button.increase_font" ).click( function() {
                var parent_table = $(this).parents( "table.traceability_matrix" );
                update_font_size( parent_table, 1 );
            });
        </script>

        <!-- shim for min-width in IE7 -->
        <script src="https://cdn.jsdelivr.net/gh/amador-duran-toro/remus/assets/javascripts/ie7-shim-min-width.js"></script>
        <script>
            fixMinWidthForIE();
        </script>

    </body>

    </html>

</xsl:template>

</xsl:stylesheet>
