<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_meeting.xsl                              -->
<!-- Content : REM XSLT for subjects at US - meeting          -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2020/07/22                                     -->
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
<!-- rem:meeting template                          -->
<!-- ============================================= -->

<xsl:template match="rem:meeting">
    <div id="{@oid}">
        <table class="meeting remus_table">

            <xsl:call-template name="generate_header">
                <xsl:with-param name="label" select="$rem:lang_meeting"/>
            </xsl:call-template>

            <xsl:call-template name="generate_simple_row">
                <xsl:with-param name="label"     select="$rem:lang_date"/>
                <xsl:with-param name="content"   select="rem:date"/>
                <xsl:with-param name="mandatory" select="true()"/>
            </xsl:call-template>

            <xsl:call-template name="generate_simple_row">
                <xsl:with-param name="label"   select="$rem:lang_time"/>
                <xsl:with-param name="content" select="rem:time"/>
                <xsl:with-param name="mandatory" select="true()"/>
            </xsl:call-template>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_place"/>
                <xsl:with-param name="content" select="rem:place"/>
            </xsl:call-template>

            <xsl:call-template name="generate_stakeholders">
                <xsl:with-param name="label"   select="$rem:lang_attenders"/>
                <xsl:with-param name="content" select="rem:attenders"/>
                <xsl:with-param name="mandatory" select="true()"/>
            </xsl:call-template>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_results"/>
                <xsl:with-param name="content" select="rem:results"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
            </xsl:call-template>

            <xsl:call-template name="generate_comments_row"/>

        </table>
    </div>
</xsl:template>

</xsl:stylesheet>
