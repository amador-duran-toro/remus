<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_AssociationType.xsl           -->
<!-- Content : Stylesheet for Association Types  -->
<!-- Author  : Amador Duran Toro                 -->
<!-- Date    : 2001/01/30                        -->
<!-- Version : 1.2                               -->
<!-- =========================================== -->
<!-- Last update : 2002/07/14                    -->
<!-- header_background variable used             -->
<!-- =========================================== -->
<!-- Last update : 2002/05/29                    -->
<!-- Namespace URI has changed                   -->
<!-- =========================================== -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================================== -->
<!-- rem:associationType template                   -->
<!-- ============================================== -->

<xsl:template match="rem:associationType">
    <xsl:call-template name="GenerateAnchor"/>

    <table border="1" width="100%">    
        <xsl:call-template name="D_Requirement_Top"/>

        <!-- description -->

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_description"/>
			</th>
            <td align="left" valign="top">
				<xsl:value-of select="$rem:lang_at_lp_01"/>
				<em>
					<xsl:apply-templates select="rem:description"/>
				</em>
            </td>
        </tr>

        <xsl:call-template name="D_Requirement_Bottom"/>
    </table>

    <p/>

    <xsl:apply-templates select="rem:role"/>
    <xsl:apply-templates select="rem:attribute"/>
    <xsl:apply-templates select="rem:invariantExpression"/>
</xsl:template>

<!-- ============================================== -->
<!-- rem:associationType/rem:name template          -->
<!-- ============================================== -->

<xsl:template match="rem:associationType/rem:name">
    <tr>
		<xsl:attribute name="bgcolor">
			<xsl:value-of select="$rem:header_background"/>
		</xsl:attribute>
        <th align="left" valign="top">
			<xsl:value-of select="../@oid"/>
		</th>
		
        <th align="left" valign="top" width="100%">
            <xsl:value-of select="."/>(
            <xsl:for-each select="../rem:role">
                <xsl:value-of select="id(@baseType)/rem:name"/><xsl:if test="not(position()=last())">, </xsl:if>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="not(../rem:role)">
                    ?, ?
                </xsl:when>
                <xsl:when test="count(../rem:role) = 1">
                    , ?
                </xsl:when>
            </xsl:choose>
            )
        </th>
    </tr>
</xsl:template>

<!-- ============================================= -->
<!-- GenerateAssociationName                       -->
<!-- ============================================= -->

<xsl:template name="GenerateAssociationName">
	<th align="left" valign="top" width="100%">
		<xsl:value-of select="../../rem:name"/>(
        <xsl:for-each select="../../rem:role">
			<xsl:value-of select="id(@baseType)/rem:name"/><xsl:if test="not(position()=last())">, </xsl:if>
        </xsl:for-each>
        <xsl:choose>
			<xsl:when test="not(../../rem:role)">
				?, ?
            </xsl:when>
            <xsl:when test="count(../../rem:role) = 1">
				, ?
            </xsl:when>
        </xsl:choose>
        )::<xsl:value-of select="."/>
	</th>
</xsl:template>

</xsl:stylesheet>
