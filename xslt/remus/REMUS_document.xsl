<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_document.xsl                             -->
<!-- Content : REM XSLT for subjects at US - document         -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2020/04/12                                     -->
<!-- Version : 3.0                                            -->
<!-- ======================================================== -->

<!-- ======================================================== -->
<!-- exclude-result-prefixes="rem" must be set in all files   -->
<!-- to avoid xmlsn:rem="..." to appear in HTML tags.         -->
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
        <meta name="generatedBy" content="REMUS (REM 1.3)"/>

        <!-- <link rel="stylesheet" href="https://raw.githubusercontent.com/amador-duran-toro/remus/master/assets/stylesheets/remus.css"/> -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/amador-duran-toro/remus/assets/stylesheets/remus.css"/>

        <title>
            <xsl:value-of select="$rem:lang_project"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="../rem:name"/>
        </title>

        <!-- =========================================================== -->
        <!-- After several tests, showdown 1.0.2 is the best option for  -->
        <!-- adding markdown capabilities to IE7, which only accepts     -->
        <!-- non-minified version of showdown 1.0.2.                     -->
        <!--                                                             -->
        <!-- The non-minified 1.9.1 version of showdown, that needs      -->
        <!-- es5-shim.js, causes some problems with HTML tags inside     -->
        <!-- markdown text raising a script error.                       -->
        <!-- =========================================================== -->

        <!-- IE 7 only accepts the non-minified 1.9.1 version of showdown, that needs es5-shim.js -->
        <!--
        <script src="https://cdnjs.cloudflare.com/ajax/libs/es5-shim/4.5.14/es5-shim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/es5-shim/4.5.14/es5-sham.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/json3/3.3.2/json3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/es6-shim/0.35.5/es6-shim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/es6-shim/0.35.5/es6-sham.min.js"></script>
        -->

        <!-- TODO: usar el CDN de github -->
        <!-- "https://github.com/showdownjs/showdown" -->
        <!-- "https://github.com/showdownjs/showdown/wiki/Showdown's-Markdown-syntax" -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/showdown/1.0.2/showdown.js"></script>

        <script>
            // showdown 1.0.2 (supported in IE 7 without es5-shim)
            // Usage
            // var result = converter.makeHtml(text);
            // converter.setOption( "key", "value" );

            var converter = new showdown.Converter();
            converter.setOption( "parseImgDimensions", true );

            // function to be used in XLST templates
            // if inline=true, all CRLF tags are replaced
            // by spaces to avoid internal <p>..</p> and
            // the enclosing <p>..</p> (if any) is discarded.

            function generate_markdown( id, inline )
            {
                // optional parameter
                if ( inline === undefined ) {
                    inline = false;
                }

                var md_id   = id + "-md";
                var html_id = id + "-html";

                var md_container   = document.getElementById( md_id );
                var html_container = document.getElementById( html_id );

                var md_text = md_container.value;

                md_container.value = "remus_text = " + md_text; // for debugging

                // Simple text replace can be performed using split and join faster
                // than using replace with a regular expression as described in:
                // https://dmitripavlutin.com/replace-all-string-occurrences-javascript/

                /* no internal <p>...</p> in inline mode */
                var newline = inline ? " " : "\n";
                var two_newlines = newline + newline;

                var crlf_tag             = "<xsl:value-of select="$rem:CRLF_tag"/>";
                var two_crlf_tags        = crlf_tag + crlf_tag;
                var three_spaces_newline = "   " + newline;
                var reg_exp = new RegExp( "(" + crlf_tag + ")(?!(\\d\\.)|\\*|\\+|\\-|\\<xsl:text disable-output-escaping="yes">&lt;</xsl:text>)", 'g' );

                // if ( inline )
                //      replace all CRLF by spaces
                // else
                //      replace all CRLF+CRLF into \n\n
                //      replace all CRLF not followed by *,+,-,> or a digit+period into 3 spaces + \n
                //      replace all remaining CRLF into \n
                // endif
                //
                // try regular expressions at: https://regexr.com/

                if ( inline ) {
                    md_text = md_text.split( crlf_tag ).join( newline );
                }
                else {
                    md_text = md_text.split( two_crlf_tags ).join( newline + newline );
                    md_text = md_text.replace( reg_exp, three_spaces_newline + "$2" );
                    md_text = md_text.split( crlf_tag ).join( newline );
                }

                md_container.value += "\n\nmd_text = " + md_text; // for debugging

                // Don't get rid of enclosing <p>...</p> in paragraph mode,
                // double \n inside markdown will close the first <p> generating an
                // unbalanced </p> later and wrong html that will raise an
                // error when assigned to innerHTML.

                var html_text = converter.makeHtml( md_text );

                if ( inline ) {
                    // get rid of enclosing <p>...</p> (if any)
                    // warning: generated item lists are not inside <p>...</p>
                    // length("<p>") == 3, length("</p>") == 4
                    if ( html_text.indexOf("<p>")       == 0 <xsl:text disable-output-escaping="yes">&amp;&amp;</xsl:text>
                         html_text.lastIndexOf("</p>")  == html_text.length - 4 )
                    {
                        html_text = html_text.slice( 3, -4 );
                    }
                }

                md_container.value += ("\n\nhtml_text = " + html_text); // for debugging

                html_container.innerHTML = html_text;
            }

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
