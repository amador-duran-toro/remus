<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_information_requirement.xsl              -->
<!-- Content : REM XSLT for subjects at US - information req. -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2020/07/24                                     -->
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

<!-- ============================================== -->
<!-- rem:informationRequirement template            -->
<!-- ============================================== -->
<!-- Note the use of colspan=2                      -->

<xsl:template match="rem:informationRequirement">
    <xsl:variable name="span" select="2"/>

    <div id="{@oid}">
        <table class="information_requirement remus_table">

            <xsl:call-template name="generate_expanded_header">
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>

            <!-- description -->
            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_description"/>
                <xsl:with-param name="prefix"  select="$rem:lang_irq_lp_01"/>
                <xsl:with-param name="content_class" select="'relevant_concept'"/>
                <xsl:with-param name="content" select="rem:relevantConcept"/>
                <xsl:with-param name="postfix" select="concat('. ', $rem:lang_irq_lp_02)"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>

            <!-- specific data -->
            <tr>
                <th>
                    <xsl:value-of select="$rem:lang_specific_data"/>
                </th>

                <td colspan="2">
                    <xsl:choose>
                        <xsl:when test="not(rem:specificData)">
                            <span class="tbd"><xsl:value-of select="$rem:lang_TBD"/></span>
                        </xsl:when>
                        <xsl:otherwise>
                            <ul class="specific_data">
                                <xsl:apply-templates select="rem:specificData"/>
                            </ul>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <!-- lifetime -->
            <xsl:if test="not(rem:averageLifeTime/rem:tbd) or not(rem:maximumLifeTime/rem:tbd)">
                <xsl:call-template name="generate_lifetime"/>
            </xsl:if>

            <!-- ocurrences -->
            <xsl:if test="not(rem:averageOcurrences/rem:tbd) or not(rem:maximumOcurrences/rem:tbd)">
                <xsl:call-template name="generate_ocurrences"/>
            </xsl:if>

            <xsl:call-template name="generate_priority_rows">
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>

            <xsl:call-template name="generate_comments_row">
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>

        </table>
    </div>
</xsl:template>

<!-- ========================= -->
<!-- rem:specificData template -->
<!-- ========================= -->

<xsl:template match="rem:specificData">
    <xsl:variable name="comments" select="normalize-space(rem:comments)"/>
    <xsl:variable name="show_comments" select="($comments != $rem:lang_none) and (string-length($comments) > 0)"/>
    <xsl:variable name="postfix">
        <xsl:if test="$show_comments">
            <xsl:text> (_</xsl:text>
            <xsl:copy-of select="rem:comments"/>
            <xsl:text>_)</xsl:text>
        </xsl:if>
    </xsl:variable>

    <li id="{@oid}">
        <xsl:call-template name="generate_markdown">
            <xsl:with-param name="node"   select="rem:description"/>
            <xsl:with-param name="postfix" select="$postfix"/>
        </xsl:call-template>
    </li>
</xsl:template>

<!-- ================================ -->
<!-- rem:rem:averageLifeTime template -->
<!-- ================================ -->

<xsl:template name="generate_lifetime">
    <tr>
        <th rowspan="2">
            <xsl:value-of select="$rem:lang_lifetime"/>
        </th>
        <th>
            <xsl:value-of select="$rem:lang_average"/>
        </th>
        <th>
            <xsl:value-of select="$rem:lang_maximum"/>
        </th>
    </tr>

    <tr>
        <td>
            <xsl:choose>
                <xsl:when test="rem:averageLifeTime/rem:tbd">
                    <xsl:apply-templates select="rem:averageLifeTime/rem:tbd"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="rem:averageLifeTime/rem:value"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="id(rem:averageLifeTime/rem:timeUnit/@value)/rem:name"/>
                </xsl:otherwise>
            </xsl:choose>
        </td>

        <td>
            <xsl:choose>
                <xsl:when test="rem:maximumLifeTime/rem:tbd">
                    <xsl:apply-templates select="rem:maximumLifeTime/rem:tbd"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="rem:maximumLifeTime/rem:value"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="id(rem:maximumLifeTime/rem:timeUnit/@value)/rem:name"/>
                </xsl:otherwise>
            </xsl:choose>
        </td>
    </tr>
</xsl:template>

<!-- ============================== -->
<!-- rem:averageOcurrences template -->
<!-- ============================== -->

<xsl:template name="generate_ocurrences">
    <tr>
        <th rowspan="2">
            <xsl:value-of select="$rem:lang_simultaneous_ocurrences"/>
        </th>
        <th>
            <xsl:value-of select="$rem:lang_average"/>
        </th>
        <th>
            <xsl:value-of select="$rem:lang_maximum"/>
        </th>
    </tr>

    <tr>
        <td>
            <xsl:choose>
                <xsl:when test="rem:averageOcurrences/rem:tbd">
                    <xsl:apply-templates select="rem:averageOcurrences/rem:tbd"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="rem:averageOcurrences/rem:value"/>
                </xsl:otherwise>
            </xsl:choose>
        </td>

        <td>
            <xsl:choose>
                <xsl:when test="rem:maximumOcurrences/rem:tbd">
                    <xsl:apply-templates select="rem:maximumOcurrences/rem:tbd"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="rem:maximumOcurrences/rem:value"/>
                </xsl:otherwise>
            </xsl:choose>
        </td>
    </tr>
</xsl:template>

</xsl:stylesheet>
