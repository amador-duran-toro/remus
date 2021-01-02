<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_defect.xsl                               -->
<!-- Content : REM XSLT for subjects at US - defect           -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2021/01/02                                     -->
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
<!-- rem:defect template                           -->
<!-- ============================================= -->

<xsl:template match="rem:defect">
    <div id="{@oid}">
        <table class="defect remus_table">

            <xsl:call-template name="generate_expanded_header"/>

            <!-- directly affected objects -->
            <xsl:call-template name="generate_directly_affected_objects"/>

            <!-- indirectly affected objects -->
            <xsl:call-template name="generate_indirectly_affected_objects"/>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_description"/>
                <xsl:with-param name="content" select="rem:description"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
            </xsl:call-template>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_possible_solution"/>
                <xsl:with-param name="content" select="rem:solution"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
            </xsl:call-template>

            <!-- alternatives -->
            <xsl:call-template name="generate_alternatives"/>

            <xsl:call-template name="generate_priority_rows"/>
            <xsl:call-template name="generate_comments_row"/>

        </table>
    </div>
</xsl:template>

<!-- ============================== -->
<!-- rem:defect/rem:name template   -->
<!-- ============================== -->

<xsl:template match="rem:defect/rem:name">
    <xsl:apply-templates/>
    <xsl:if test="../rem:defectType/@value">
        (<xsl:value-of select="id(../rem:defectType/@value)/rem:name"/>
         <xsl:text> </xsl:text>
         <img src="{concat($rem:base_url_icons,$rem:infoImage)}" class="info_icon" width="16px">
            <xsl:attribute name="title">
                <xsl:value-of select="id(../rem:defectType/@value)/rem:description"/>
            </xsl:attribute>
         </img>)
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
