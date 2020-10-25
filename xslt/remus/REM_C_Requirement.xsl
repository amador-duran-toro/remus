<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_C_Requirement.xsl             -->
<!-- Author  : Amador Duran Toro                 -->
<!-- Date    : 2001/01/30                        -->
<!-- Version : 1.1                               -->
<!-- =========================================== -->

<!-- Stylesheet for C-Requirements               -->

<!-- Last update : 2002/10/20                    -->
<!-- Dependencies are now sorted by @target, not -->
<!-- by @oid which was not in scope              -->

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
<!-- C_Requirement (abstract class) templates      -->
<!-- ============================================= -->

<!-- ============================================= -->
<!-- C_Requirement_Top template                    -->
<!-- ============================================= -->

<xsl:template name="C_Requirement_Top">
    <xsl:param name="span">1</xsl:param>

    <xsl:call-template name="SpecificationObject_Top">
        <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>

    <xsl:call-template name="Dependencies">
        <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>
</xsl:template>

<!-- ============================================= -->
<!-- C_Requirement_Bottom template                 -->
<!-- ============================================= -->

<xsl:template name="C_Requirement_Bottom">
    <xsl:param name="span">1</xsl:param>

    <!-- rem:importance -->

    <xsl:choose>
        <xsl:when test="rem:importance/@value">
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_importance"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="id(rem:importance/@value)/rem:name"/>
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_importance"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="rem:importance/rem:tbd"/>
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>

    <!-- rem:urgency -->

    <xsl:choose>
        <xsl:when test="rem:urgency/@value">
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_urgency"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="id(rem:urgency/@value)/rem:name"/>
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_urgency"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="rem:urgency/rem:tbd"/>
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>

    <!-- rem:status -->

    <xsl:choose>
        <xsl:when test="rem:status/@value">
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_status"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="id(rem:status/@value)/rem:name"/>
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_status"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="rem:status/rem:tbd"/>
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>

    <!-- rem:stability -->

    <xsl:choose>
        <xsl:when test="rem:stability/@value">
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_stability"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="id(rem:stability/@value)/rem:name"/>
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_stability"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="rem:stability/rem:tbd"/>
                <xsl:with-param name="span" select="$span"/>
            </xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>

    <xsl:call-template name="SpecificationObject_Bottom">
        <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>
</xsl:template>

<!-- ============================================= -->
<!-- Dependencies template                         -->
<!-- ============================================= -->

<xsl:template name="Dependencies">
    <xsl:param name="span">1</xsl:param>

    <xsl:variable
        name="DEPENDENCIES"
        select="//rem:trace[
                    @source=current()/@oid and (
                        ( name( id(@target) ) = 'rem:objective'                ) or
                        ( name( id(@target) ) = 'rem:informationRequirement'   ) or
                        ( name( id(@target) ) = 'rem:constraintRequirement'    ) or
                        ( name( id(@target) ) = 'rem:useCase'                  ) or
                        ( name( id(@target) ) = 'rem:functionalRequirement'    ) or
                        ( name( id(@target) ) = 'rem:nonFunctionalRequirement' )
                    )
                ]"
    />

    <tr>
        <th align="left" valign="top">
            <xsl:value-of select="$rem:lang_dependencies"/>
        </th>

        <td align="left" valign="top">
            <xsl:attribute name="colspan">
                <xsl:value-of select="$span"/>
            </xsl:attribute>

            <xsl:choose>
                <xsl:when test="not($DEPENDENCIES)">
                    <xsl:value-of select="$rem:lang_none"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="$DEPENDENCIES">
                    <xsl:sort select="@target"/>
                        <li>
                            <a>
                                <xsl:attribute name="href">#<xsl:value-of select="@target"/></xsl:attribute>
                                [<xsl:value-of select="@target"/>] <xsl:value-of select="id(@target)/rem:name"/>
                            </a>
                        </li>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

        </td>
    </tr>
</xsl:template>

</xsl:stylesheet>
