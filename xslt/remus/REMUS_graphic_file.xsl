<?xml version="1.0" encoding="iso-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_graphic_file.xsl                         -->
<!-- Content : REM XSLT for subjects at US - graphic file     -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2020/04/13                                     -->
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
<!-- rem:graphicFile template                                 -->
<!-- ======================================================== -->

<xsl:template match="rem:graphicFile">

    <!-- [width=999%] inside comments, then width=999%% -->
    <xsl:variable name="has_width" select="contains(rem:comments, $rem:width_tag)" />
    <xsl:variable name="width" select="substring-before( substring-after(rem:comments, $rem:width_tag), ']')"/>

    <!-- [base64] inside comments, the use the rest of the comment as base64 data -->
    <xsl:variable name="base64" select="contains(rem:comments, $rem:base64_tag)" />

    <div id="{@oid}" class="figure">
        <img class="figure_image">
            <xsl:attribute name="src">
                <xsl:choose>
                    <xsl:when test="$base64">
                        <xsl:value-of select="substring-after(rem:comments, $rem:base64_tag)" disable-output-escaping="yes" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space(rem:fileName)" disable-output-escaping="yes" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:if test="$has_width">
                <xsl:attribute name="width"><xsl:value-of select="$width"/>%</xsl:attribute>
            </xsl:if>
        </img>

        <p class="figure_caption">
            <span class="figure_caption_label">
                <xsl:value-of select="$rem:lang_figure"/>
                <xsl:text> </xsl:text>
                <xsl:number level="any"/>:<!-- important to avoid restarting numbering in each section -->
                <xsl:text> </xsl:text>
            </span>
            <!-- not applying markdown -->
            <!-- <xsl:apply-templates select="rem:name"/> -->
            <!-- applying markdown -->
            <xsl:call-template name="generate_markdown">
                <xsl:with-param name="node" select="rem:name"/>
            </xsl:call-template>
            <!--
            This doesn't work. Read rem:name templates.
            <xsl:apply-templates select="rem:name" mode="md" />
            -->
        </p>
    </div>

</xsl:template>

</xsl:stylesheet>
