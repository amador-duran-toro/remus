<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_ValueType.xsl                 -->
<!-- Content : Stylesheet for Value Types        -->
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
<!-- rem:userDefinedValueType template              -->
<!-- ============================================== -->

<xsl:template match="rem:userDefinedValueType">
    <xsl:call-template name="GenerateAnchor"/>

    <table border="1" width="100%">    
        <xsl:call-template name="D_Requirement_Top"/>

        <!-- description -->

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_description"/>
			</th>
            <td align="left" valign="top">
				<xsl:value-of select="$rem:lang_vt_lp_01"/>
				<em>
					<xsl:apply-templates select="rem:description"/>
				</em>
            </td>
        </tr>

        <!-- definition -->

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_definition"/>
			</th>
            <td align="left" valign="top">
                <code>
					<xsl:apply-templates select="rem:definition"/>
				</code>
            </td>
        </tr>

        <xsl:call-template name="D_Requirement_Bottom"/>
    </table>

    <p/>

    <xsl:apply-templates select="rem:attribute"/>
    <xsl:apply-templates select="rem:invariantExpression"/>
</xsl:template>

</xsl:stylesheet>
