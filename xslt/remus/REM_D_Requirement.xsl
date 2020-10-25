<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_D_Requirement.xsl             -->
<!-- Author  : Amador Duran Toro                 -->
<!-- Date    : 2001/01/30                        -->
<!-- Version : 1.0                               -->
<!-- =========================================== -->

<!-- Stylesheet for C-Requirements               -->

<!-- Last update : 2002/06/08                    -->
<!-- RelatedObjectives and RelatedRequirements   -->
<!-- have been substituted by Dependencies       -->

<!-- Last update : 2002/05/29                    -->
<!-- Namespace URI has changed                   -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================================= -->
<!-- D_Requirement (abstract class) templates      -->
<!-- ============================================= -->

<!-- ============================================= -->
<!-- D_Requirement_Top template                    -->
<!-- ============================================= -->

<xsl:template name="D_Requirement_Top">
    <xsl:param name="span">1</xsl:param>

    <xsl:apply-templates select="rem:name" />

    <xsl:apply-templates select="rem:version"/>

    <xsl:call-template name="Authors">
        <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>

    <xsl:call-template name="Dependencies">
        <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>
</xsl:template>

<!-- ============================================= -->
<!-- D_Requirement_Bottom template                 -->
<!-- ============================================= -->

<xsl:template name="D_Requirement_Bottom">
    <xsl:param name="span">1</xsl:param>

    <xsl:call-template name="SpecificationObject_Bottom">
        <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>
</xsl:template>

<!-- ============================================= -->
<!-- GenerateType template                         -->
<!-- ============================================= -->

<xsl:template name="GenerateType">
    <code>
    <xsl:choose>
        <xsl:when test="rem:isSet">
            Set(
        </xsl:when>
        <xsl:when test="rem:isSequence">
            Sequence(
        </xsl:when>
        <xsl:when test="rem:isBag">
            Bag(
        </xsl:when>
    </xsl:choose>
    <xsl:value-of select="id(@baseType)/rem:name"/>
    <xsl:if test="rem:isSet|rem:isSequence|rem:isBag">
        )
    </xsl:if>
    </code>
</xsl:template>

</xsl:stylesheet>
