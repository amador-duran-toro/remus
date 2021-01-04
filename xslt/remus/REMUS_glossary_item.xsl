<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_glossary_item.xsl                        -->
<!-- Content : REM XSLT for subjects at US - glossary item    -->
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

<!-- =========================================================== -->
<!-- rem:glossaryItem template                                   -->
<!-- =========================================================== -->

<xsl:template match="rem:glossaryItem">

    <!-- [bib] tag as the first word in glossary item's comments -->
    <xsl:variable name="class">
        <xsl:choose>
            <xsl:when test="starts-with(normalize-space(rem:comments), $rem:bib_tag)">bib</xsl:when>
            <xsl:otherwise>glo</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <!-- This template is similar to paragraph template, except that the glossary item    -->
    <!-- name is included as a prefix in the markdown text to generate the title.         -->
    <!-- https://stackoverflow.com/questions/12071402/difference-between-and-node-in-xslt -->

    <div id="{@oid}" class="{$class}">
        <xsl:call-template name="generate_markdown">
            <xsl:with-param name="prefix">
                <xsl:choose>
                    <xsl:when test="$class = 'bib'">[<xsl:apply-templates select="rem:name"/>]</xsl:when>
                    <xsl:otherwise>**<xsl:apply-templates select="rem:name"/>**:</xsl:otherwise>
                </xsl:choose>
            </xsl:with-param>
            <xsl:with-param name="node" select="rem:text"/>
            <xsl:with-param name="mode" select="'paragraph'"/>
        </xsl:call-template>
    </div>
</xsl:template>

</xsl:stylesheet>
