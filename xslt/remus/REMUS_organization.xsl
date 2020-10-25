<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_organization.xsl                         -->
<!-- Content : REM XSLT for subjects at US - organization     -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2020/07/14                                     -->
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
<!-- ============================================= -->
<!-- rem:organization template                     -->
<!-- ============================================= -->

<xsl:template match="rem:organization">
    <div id="{@oid}">
        <table class="organization remus_table">

            <xsl:call-template name="generate_header">
                <xsl:with-param name="label" select="$rem:lang_organization"/>
            </xsl:call-template>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_address"/>
                <xsl:with-param name="content" select="rem:address"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
            </xsl:call-template>

            <xsl:call-template name="generate_simple_row">
                <xsl:with-param name="label"   select="$rem:lang_telephone"/>
                <xsl:with-param name="content" select="rem:telephone"/>
            </xsl:call-template>

            <xsl:call-template name="generate_simple_row">
                <xsl:with-param name="label"   select="$rem:lang_fax"/>
                <xsl:with-param name="content" select="rem:fax"/>
            </xsl:call-template>

            <xsl:call-template name="generate_comments_row"/>

        </table>
    </div>
</xsl:template>

</xsl:stylesheet>
