<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_objective.xsl                            -->
<!-- Content : REM XSLT for subjects at US - objective        -->
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
<!-- rem:objective template                        -->
<!-- ============================================= -->

<xsl:template match="rem:objective">
    <div id="{@oid}">
        <table class="objective remus_table">

            <xsl:call-template name="generate_expanded_header"/>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_description"/>
                <xsl:with-param name="prefix"  select="$rem:lang_the_system_shall"/>
                <xsl:with-param name="content" select="rem:description"/>
                <xsl:with-param name="postfix" select="'.'"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
            </xsl:call-template>

            <!-- subobjectives -->

            <xsl:if test="rem:objective">
                <tr>
                    <th>
                        <xsl:value-of select="$rem:lang_subobjectives"/>
                    </th>
                    <td>
                        <ul class="subobjectives">
                            <xsl:apply-templates select="rem:objective"/>
                        </ul>
                    </td>
                </tr>
            </xsl:if>

            <xsl:call-template name="generate_priority_rows"/>
            <xsl:call-template name="generate_comments_row"/>

        </table>
    </div>
</xsl:template>

<!-- ============================== -->
<!-- rem:objective template (child) -->
<!-- ============================== -->

<xsl:template match="rem:objective[parent::rem:objective]">
    <xsl:variable name="comments" select="normalize-space(rem:comments)"/>
    <xsl:variable name="show_comments" select="($comments != $rem:lang_none) and (string-length($comments) > 0)"/>
    <xsl:variable name="postfix">
        <xsl:if test="$show_comments">
            <xsl:text> (_</xsl:text>
            <xsl:copy-of select="rem:comments"/>
            <xsl:text>_)</xsl:text>
        </xsl:if>
        <xsl:text>. </xsl:text>
    </xsl:variable>

    <li id="{@oid}">
        <span class="subobjective">
            [<xsl:value-of select="@oid"/>] <xsl:value-of select="rem:name"/>:
        </span>
        <xsl:call-template name="generate_markdown">
            <xsl:with-param name="node"   select="rem:description"/>
            <xsl:with-param name="prefix" select="$rem:lang_the_system_shall"/>
            <xsl:with-param name="postfix" select="$postfix"/>
        </xsl:call-template>
        <xsl:if test="rem:objective">
            <ul class="subobjectives">
                <xsl:apply-templates select="rem:objective"/>
            </ul>
        </xsl:if>
    </li>
</xsl:template>

</xsl:stylesheet>
