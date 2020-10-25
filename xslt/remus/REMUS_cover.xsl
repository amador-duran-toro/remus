<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_cover.xsl                                -->
<!-- Content : REM XSLT for subjects at US - document cover   -->
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
<!-- document_cover template                                  -->
<!-- ======================================================== -->

<xsl:template name="document_cover">

    <div id="document_cover">

        <!-- for debugging, hidden in CSS -->
        <div id="browser_info">
            <script>
                document.write( navigator.userAgent + "<br/>" );
                for( var opt in converter.getOptions() ) {
                    document.write( "local option : " + opt + " = " + converter.getOption(opt) + "<br/>" );
                }
                for( var opt in showdown.getOptions() ) {
                    document.write( "global option : " + opt + " = " + showdown.getOption(opt) + "<br/>" );
                }
            </script>
        </div>

        <div id="project_name">
            <xsl:value-of select="$rem:lang_project"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="../rem:name"/>
        </div>

        <div id="document_logo">
            <img alt="Universidad de Sevilla" src="https://cdn.jsdelivr.net/gh/amador-duran-toro/rem/assets/images/logo_us.gif"/>
        </div>

        <div id="document_name">
            <xsl:apply-templates select="rem:name"/>
        </div>

        <div id="document_version">
            <xsl:value-of select="$rem:lang_version"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="rem:version/rem:major"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="rem:version/rem:minor"/>
        </div>

        <div id="document_date">
            <xsl:value-of select="$rem:lang_date"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="rem:version/rem:date"/>
        </div>

        <div id="document_prepared_for">
            <xsl:value-of select="$rem:lang_prepared_for"/>
            <xsl:choose>
                <xsl:when test="not(rem:preparedFor)"><p class="tbd">?</p></xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="id(rem:preparedFor/@organizations)">
                        <xsl:sort select="rem:name"/>
                            <p>
                                <a href="#{@oid}"><xsl:apply-templates select="rem:name"/></a>
                            </p>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </div>

        <div id="document_prepared_by">
            <xsl:value-of select="$rem:lang_prepared_by"/>
            <xsl:choose>
                <xsl:when test="not(rem:preparedBy)"><p class="tbd">?</p></xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="id(rem:preparedBy/@organizations)">
                        <xsl:sort select="rem:name"/>
                            <p>
                                <a href="#{@oid}"><xsl:apply-templates select="rem:name"/></a>
                            </p>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </div>

    </div>

</xsl:template>

</xsl:stylesheet>
