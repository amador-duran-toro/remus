<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =================================================== -->
<!-- File    : REM_TraceabilityMatrix.xsl                -->
<!-- Content : Hoja de estilo para documentación de PFCs -->
<!-- Author  : Amador Durán Toro                         -->
<!-- Date    : 2005/07/18                                -->
<!-- Version : 1.1                                       -->
<!-- =================================================== -->

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

    <table id="{@oid}" border="1" width="100%">
			<xsl:apply-templates select="rem:tr"/>
    </table>
   
    <p align="center">
      <b><xsl:value-of select="$rem:lang_traceability_matrix"/></b>:  
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
			<th class="trmatrix" align="left" valign="top">
				<a href="#{@oid}"><xsl:value-of select="@oid"/></a>
			</th>
		</xsl:when>

		<xsl:otherwise>
			<th class="trmatrix" align="center" valign="top">
				<a href="#{@oid}"><xsl:value-of select="@oid"/></a>
			</th>
    </xsl:otherwise>

	</xsl:choose>

</xsl:template>

<!-- ================================================= -->
<!-- rem:traceabilityMatrix/rem:th[not(@oid)] template -->
<!-- ================================================= -->

<xsl:template match="rem:th">
	<th class="trmatrix">
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
				<img src="{$rem:traceImage}"/>
      </xsl:when>
			<xsl:otherwise>
				-
			</xsl:otherwise>
    </xsl:choose>
	</td>
</xsl:template>

</xsl:stylesheet>
