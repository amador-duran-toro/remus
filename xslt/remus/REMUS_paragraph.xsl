<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_paragraph.xsl                            -->
<!-- Content : REM XSLT for subjects at US - paragraph        -->
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
<!-- rem:paragraph template                                      -->
<!-- =========================================================== -->

<xsl:template match="rem:paragraph">
    <xsl:choose>
        <!-- [link] tag as the first word in paragraph's name -->
        <xsl:when test="starts-with(normalize-space(rem:name), $rem:link_tag)">
            <xsl:apply-templates select="id(rem:text)"/>
        </xsl:when>
        <xsl:otherwise>
            <div id="{@oid}">
                <xsl:choose>
                    <!-- [part] tag as the first word in paragraph's name -->
                    <xsl:when test="starts-with(normalize-space(rem:name), $rem:part_tag)">
                        <xsl:choose>
                            <!-- [part] paragraphs must be direct children of documents' root -->
                            <xsl:when test="local-name(../..) = 'requirementsProject'">
                                <xsl:apply-templates select="." mode="part"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <script>
                                warnings.push({
                                    oid: "<xsl:value-of select="@oid"/>",
                                    message:'Tagged paragraph \"<xsl:apply-templates select="rem:name"/>\": parts must be children of the document root only!'
                                });
                                </script>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- [info] tag as part of the name of the paragraph -->
                    <xsl:otherwise>
                        <xsl:if test="contains(rem:name,$rem:info_tag)">
                            <xsl:attribute name="class">info</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="generate_markdown">
                            <xsl:with-param name="node" select="rem:text"/>
                            <xsl:with-param name="mode" select="'paragraph'"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- =========================================================== -->
<!-- rem:paragraph template in "part" mode                       -->
<!-- =========================================================== -->

<!-- This approach is better than using a section for parts.     -->
<!-- It does not break section numbering.                        -->

<xsl:template match="rem:paragraph" mode="part">
    <xsl:call-template name="rem:pagebreak"/>
    <div id="{@oid}" class="part">
        <xsl:value-of select="$rem:lang_part"/><xsl:text> </xsl:text>
        <xsl:number count="//rem:paragraph[starts-with(normalize-space(rem:name), $rem:part_tag)]" format="I"/>
        <br/>
        <xsl:variable name="name" select="substring-after(normalize-space(rem:name),$rem:part_tag)"/>
        <xsl:value-of select="$name"/>
    </div>
    <xsl:call-template name="rem:pagebreak"/>
</xsl:template>

<!-- =========================================================== -->
<!-- rem:paragraph template in "toc" mode for "parts"            -->
<!-- =========================================================== -->

<xsl:template match="rem:paragraph" mode="toc">
    <br/><br/>
    <li>
        <xsl:value-of select="$rem:lang_part"/><xsl:text> </xsl:text>
        <xsl:number count="//rem:paragraph[starts-with(normalize-space(rem:name), $rem:part_tag)]" format="I"/>
        <xsl:variable name="name" select="substring-after(normalize-space(rem:name),$rem:part_tag)"/>
        <a href="#{@oid}"><xsl:value-of select="$name"/></a>
    </li>
    <br/><br/>
</xsl:template>

</xsl:stylesheet>

