<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_appendix.xsl                             -->
<!-- Content : REM XSLT for subjects at US - appendix         -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2021/01/01                                     -->
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

<!-- TODO: ¿hacer la HIDDEN appendix? -->

<!-- ======================================================== -->
<!-- Use of <xsl:element name="h{rem:level}"> inspired by     -->
<!-- https://stackoverflow.com/questions/18585591/how-to-automatically-generate-xhtml-heading-levels-using-xslt-1-0 -->
<!-- ======================================================== -->

<!-- ============================================= -->
<!-- rem:appendix template                         -->
<!-- ============================================= -->

<xsl:template match="rem:appendix">
    <xsl:element name="h{rem:level}">
        <xsl:attribute name="id"><xsl:value-of select="@oid"/></xsl:attribute>
        <xsl:attribute name="class">appendix</xsl:attribute>
        <xsl:value-of select="rem:number"/><xsl:apply-templates select="rem:name"/>
    </xsl:element>

    <!-- apply templates to all appendix's children except appendix's properties -->
    <xsl:apply-templates select="*[not(contains('name version comments level number',local-name()))]"/>
</xsl:template>

<!-- ============================================= -->
<!-- rem:appendix template in "toc" mode           -->
<!-- ============================================= -->

<!-- A <ul> parent element is assumed              -->

<xsl:template match="rem:appendix" mode="toc">
    <li><xsl:value-of select="rem:number"/><a href="#{@oid}"><xsl:apply-templates select="rem:name"/></a></li>
    <xsl:if test="rem:appendix">
        <ul class="toc_list">
            <xsl:apply-templates select="rem:appendix" mode="toc"/>
        </ul>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
