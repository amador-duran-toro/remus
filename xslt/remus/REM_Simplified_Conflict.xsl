<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_Simplified_Conflict.xsl       -->
<!-- Author  : Amador Duran Toro                 -->
<!-- Date    : 2002/10/20                        -->
<!-- Version : 1.0                               -->
<!-- =========================================== -->

<!-- Simplified stylesheet for Conflicts       -->
<!-- Last update : 2002/05/29                  -->
<!-- Namespace URI has changed                 -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================== -->
<!-- rem:conflict template            -->
<!-- ============================== -->

<xsl:template match="rem:conflict">
    <xsl:call-template name="GenerateAnchor"/>

    <table border="1" width="100%">
        <xsl:call-template name="SpecificationObject_Top"/>
        <xsl:call-template name="DirectlyAffectedObjects"/>
        <xsl:call-template name="IndirectlyAffectedObjects"/>

        <!-- rem:description -->

        <xsl:call-template name="GenerateRow">
            <xsl:with-param name="title">
                <xsl:value-of select="$rem:lang_description"/>
            </xsl:with-param>
            <xsl:with-param name="node" select="rem:description"/>
        </xsl:call-template>

        <!-- rem:solution -->

        <xsl:call-template name="GenerateRow">
            <xsl:with-param name="title">
                <xsl:value-of select="$rem:lang_possible_solution"/>
            </xsl:with-param>
            <xsl:with-param name="node" select="rem:solution"/>
        </xsl:call-template>

        <!-- rem:importance -->

        <xsl:if test="rem:importance/@value">
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_importance"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="id(rem:importance/@value)/rem:name"/>
            </xsl:call-template>
        </xsl:if>

        <!-- rem:urgency -->

        <xsl:if test="rem:urgency/@value">
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_urgency"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="id(rem:urgency/@value)/rem:name"/>
            </xsl:call-template>
        </xsl:if>

        <!-- rem:status -->

        <xsl:if test="rem:status/@value">
            <xsl:call-template name="GenerateRow">
                <xsl:with-param name="title">
                    <xsl:value-of select="$rem:lang_status"/>
                </xsl:with-param>
                <xsl:with-param name="node" select="id(rem:status/@value)/rem:name"/>
            </xsl:call-template>
        </xsl:if>

        <xsl:call-template name="SpecificationObject_Bottom"/>
    </table>
    <p/>

    <xsl:apply-templates select="rem:alternative"/>
</xsl:template>

</xsl:stylesheet>
