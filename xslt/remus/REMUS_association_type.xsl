<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================================== -->
<!-- File    : REMUS_association.xsl                             -->
<!-- Content : REM XSLT for subjects at US - association         -->
<!-- Author  : Amador Durán Toro                                 -->
<!-- Date    : 2020/10/17                                        -->
<!-- Version : 3.0                                               -->
<!-- =========================================================== -->

<!-- =========================================================== -->
<!-- exclude-result-prefixes="rem" must be set in all files      -->
<!-- to avoid xmlsn:rem="..." to appear in HTML tags.            -->
<!-- =========================================================== -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    exclude-result-prefixes="rem"
>

<!-- ============================================== -->
<!-- rem:associationType template                   -->
<!-- ============================================== -->

<xsl:template match="rem:associationType">
    <div id="{@oid}" class="association_type">
        <table class="association_type remus_table">
            <xsl:call-template name="generate_expanded_header"/>
            <tr>
                <td colspan="2">
                    <div class="code">
                        <xsl:apply-templates select="." mode="code"/>
                    </div>
                </td>
            </tr>
            <xsl:call-template name="generate_comments_row"/>
        </table>
    </div>
</xsl:template>

<!-- ============================================== -->
<!-- rem:associationType template (mode code)       -->
<!-- ============================================== -->

<xsl:template match="rem:associationType" mode="code">
    <xsl:if test="string-length(rem:description)">
        <div>
            <span class="code_comment">/**</span>
            <xsl:call-template name="generate_markdown">
                <xsl:with-param name="node" select="rem:description"/>
                <xsl:with-param name="node_class" select="'code_comment code_description'"/>
                <xsl:with-param name="mode" select="'paragraph'"/>
            </xsl:call-template>
            <span class="code_comment">*/</span>
        </div>
    </xsl:if>

    <xsl:variable name="association_declaration">
        <xsl:choose>
            <xsl:when test="rem:isDerived">derived association</xsl:when>
            <xsl:otherwise>association</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="css_association_declaration">
        <xsl:choose>
            <xsl:when test="rem:isDerived">abstract</xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <span class="keyword {$css_association_declaration}">
        <xsl:value-of select="$association_declaration"/>
        <xsl:text> </xsl:text>
    </span>
    <span class="class_name {$css_association_declaration}">
        <xsl:apply-templates select="rem:name"/>
    </span>

    <br/>
    {<br/>

    <!-- roles -->

    <xsl:if test="rem:role">
        <div class="code_comment code_header"><xsl:value-of select="$rem:lang_code_roles"/></div>
        <ul class="properties">
            <xsl:apply-templates select="rem:role" mode="code"/>
        </ul>
    </xsl:if>

    <!-- attributes -->

    <xsl:if test="rem:attribute">
        <br/>
        <div class="code_comment code_header"><xsl:value-of select="$rem:lang_code_attributes"/></div>
        <ul class="properties">
            <xsl:apply-templates select="rem:attribute" mode="code"/>
        </ul>
    </xsl:if>

    <!-- invariants -->

    <xsl:if test="rem:invariantExpression">
        <br/>
        <div class="code_comment code_header"><xsl:value-of select="$rem:lang_code_invariants"/></div>
        <ul class="properties">
            <xsl:apply-templates select="rem:invariantExpression" mode="code"/>
        </ul>
    </xsl:if>

    }
</xsl:template>

<!-- ==================================================== -->
<!-- rem:associationType/rem:name template                -->
<!-- ==================================================== -->

<xsl:template match="rem:associationType/rem:name">
    <xsl:value-of select="."/>(
    <xsl:for-each select="../rem:role">
        <xsl:value-of select="id(@baseType)/rem:name"/><xsl:if test="not(position()=last())">, </xsl:if>
    </xsl:for-each>
    <xsl:choose>
        <xsl:when test="not(../rem:role)">?, ?</xsl:when>
        <xsl:when test="count(../rem:role) = 1">, ?</xsl:when>
    </xsl:choose>
    )
</xsl:template>

</xsl:stylesheet>
