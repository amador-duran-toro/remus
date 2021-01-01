<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_alternative.xsl                          -->
<!-- Content : REM XSLT for subjects at US - alternative      -->
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
<!-- ============================== -->
<!-- rem:alternative template       -->
<!-- ============================== -->

<xsl:template match="rem:alternative">
    <li id="{@oid}" class="alternative">
        <span class="alternative_name"><xsl:apply-templates select="rem:name"/></span>
        <xsl:if test="rem:authors">
            (<xsl:for-each select="id(rem:authors/@stakeholders)">
                <a href="#{@oid}"><xsl:apply-templates select="rem:name"/></a><xsl:if test="not(position()=last())">, </xsl:if>
            </xsl:for-each>)
        </xsl:if>
        <xsl:call-template name="generate_markdown">
            <xsl:with-param name="node" select="rem:description"/>
            <xsl:with-param name="node_class" select="'alternative_description'"/>
            <xsl:with-param name="mode" select="'paragraph'"/>
        </xsl:call-template>
    </li>
</xsl:template>

</xsl:stylesheet>
