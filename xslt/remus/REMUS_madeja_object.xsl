<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_madeja_object.xsl                        -->
<!-- Content : REM XSLT for subjects at US - madeja object    -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2021/01/04                                     -->
<!-- Version : 3.0                                            -->
<!-- ======================================================== -->

<!-- ======================================================== -->
<!-- exclude-result-prefixes="rem" must be set in all files   -->
<!-- to avoid xmlsn:rem="..." to appear in HTML tags.         -->
<!-- ======================================================== -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    exclude-result-prefixes="rem msxsl"
>

<!-- ======================================================== -->
<!-- isMadejaObject function                                  -->
<!--                                                          -->
<!-- Implemented using the msxml:script tag, that allows the  -->
<!-- use of Javascript functions and regular expressions in   -->
<!-- XSLT transformations.                                    -->
<!-- It returns the MADEJA object's OID or false otherwise.   -->
<!-- ======================================================== -->

<msxsl:script implements-prefix="rem">
<![CDATA[
var regexp = /^\[((FOR|DEB|ANA|PNA|HU)-\d+)\]\s*((.)*)/;

function isMadejaObject(s) {
    return regexp.test(s) ? RegExp.$1 : false;
}

function getMadejaPrefix(s) {
    return regexp.test(s) ? RegExp.$2 : "?";
}

function getMadejaName(s) {
    return regexp.test(s) ? RegExp.$3 : "?";
}
]]>
</msxsl:script>

<!-- =========================================================== -->
<!-- rem:glossaryItem[rem:isMadejaObject(rem:name)] template     -->
<!-- =========================================================== -->

<xsl:template match="rem:glossaryItem[rem:isMadejaObject(string(normalize-space(rem:name)))]">
    <xsl:variable name="name" select="string(normalize-space(rem:name))"/>
    <xsl:variable name="label" select="rem:isMadejaObject($name)"/>
    <xsl:variable name="icon" select="concat('madeja_',rem:toLowerCase(rem:getMadejaPrefix($name)))"/>

    <div id="{@oid}">
        <table class="madeja_object remus_table">

            <xsl:call-template name="generate_header">
                <xsl:with-param name="label" select="$label"/>
                <xsl:with-param name="icon"  select="$icon"/>
            </xsl:call-template>

            <xsl:call-template name="generate_simple_row">
                <xsl:with-param name="label"   select="$rem:lang_version"/>
                <xsl:with-param name="content" select="rem:version"/>
            </xsl:call-template>

            <xsl:call-template name="generate_stakeholders">
                <xsl:with-param name="label"   select="$rem:lang_authors"/>
                <xsl:with-param name="content" select="rem:authors"/>
            </xsl:call-template>

            <xsl:call-template name="generate_stakeholders">
                <xsl:with-param name="label"   select="$rem:lang_sources"/>
                <xsl:with-param name="content" select="rem:sources"/>
            </xsl:call-template>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_description"/>
                <xsl:with-param name="content" select="rem:text"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
            </xsl:call-template>

            <xsl:call-template name="generate_comments_row"/>
        </table>
    </div>

</xsl:template>

<xsl:template match="rem:glossaryItem[rem:isMadejaObject(string(normalize-space(rem:name)))]/rem:name">
    <xsl:value-of select="rem:getMadejaName(string(normalize-space(.)))"/>
</xsl:template>

</xsl:stylesheet>
