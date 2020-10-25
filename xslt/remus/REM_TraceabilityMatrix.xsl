<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================= -->
<!-- File    : REM_TraceabilityMatrix.xsl    -->
<!-- Content : Stylesheet for REM TMs        -->
<!-- Author  : Amador Duran Toro             -->
<!-- Date    : 2001/01/30                    -->
<!-- Version : 1.2                           -->
<!-- ======================================= -->
<!-- Last update : 2002/07/19                -->
<!-- header_background variable used         -->
<!-- ======================================= -->
<!-- Last update : 2002/05/29                -->
<!-- Namespace URI has changed               -->
<!-- ======================================= -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================================= -->
<!-- rem:traceabilityMatrix template               -->
<!-- ============================================= -->

<!-- =============================== -->
<!-- rem:traceabilityMatrix template -->
<!-- =============================== -->

<xsl:template match="rem:traceabilityMatrix">
    <xsl:call-template name="GenerateAnchor"/>

    <table border="1" width="100%">
		<xsl:apply-templates select="rem:tr"/>
    </table>
   
    <p align="center">
        <b>
			<xsl:value-of select="$rem:lang_traceability_matrix"/>
		</b>: 
        <xsl:value-of select="rem:name"/>
    </p>
</xsl:template>

<!-- ====================================== -->
<!-- rem:traceabilityMatrix/rem:tr template -->
<!-- ====================================== -->

<xsl:template match="rem:tr">
	<tr>
		<xsl:apply-templates/>
	</tr>
</xsl:template>

<!-- ============================================ -->
<!-- rem:traceabilityMatrix/rem:th[@oid] template -->
<!-- ============================================ -->

<xsl:template match="rem:th[@oid]">
	<xsl:choose>
		<xsl:when test="position()=1">
			<th align="left" valign="top">
				<xsl:attribute name="bgcolor">
					<xsl:value-of select="$rem:header_background"/>
				</xsl:attribute>
				<a>
					<xsl:attribute name="href">
						#<xsl:value-of select="@oid"/>
					</xsl:attribute>
					<xsl:value-of select="@oid"/>
				</a>
			</th>
		</xsl:when>
		<xsl:otherwise>
			<th align="center" valign="top">
				<xsl:attribute name="bgcolor">
					<xsl:value-of select="$rem:header_background"/>
				</xsl:attribute>
				<a>
					<xsl:attribute name="href">
						#<xsl:value-of select="@oid"/>
					</xsl:attribute>
					<xsl:value-of select="@oid"/>
				</a>
			</th>
        </xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- ================================================= -->
<!-- rem:traceabilityMatrix/rem:th[not(@oid)] template -->
<!-- ================================================= -->

<xsl:template match="rem:th">
	<th>
		<xsl:attribute name="bgcolor">
			<xsl:value-of select="$rem:header_background"/>
		</xsl:attribute>
		<xsl:value-of select="../../@oid"/>
	</th>
</xsl:template>

<!-- ====================================== -->
<!-- rem:traceabilityMatrix/rem:td template -->
<!-- ====================================== -->

<xsl:template match="rem:td">
	<td align="center" valign="top">
		<xsl:choose>
			<xsl:when test="@mark='yes'">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$rem:traceImage"/>
					</xsl:attribute>
				</img>
            </xsl:when>
			<xsl:otherwise>
				-
            </xsl:otherwise>
        </xsl:choose>
	</td>
</xsl:template>

</xsl:stylesheet>
