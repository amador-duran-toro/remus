<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ========================================================= -->
<!-- File    : REM_Simplified_SpecificationObject.xsl          -->
<!-- Content : Simplified stylesheet for Specification Objects -->
<!-- Author  : Amador Durán Toro                               -->
<!-- Date    : 2002/10/20                                      -->
<!-- Version : 1.0                                             -->
<!-- ========================================================= -->
<!-- Last update : 2002/07/12                                  -->
<!-- First version                                             -->
<!-- ========================================================= -->
<!-- Last update : 2002/07/14                                  -->
<!-- Authors/Sources use <ul> now                              -->
<!-- ========================================================= -->
<!-- Last update : 2002/10/20                                  -->
<!-- Dependencies are now sorted by @target, not               -->
<!-- by @oid which was not in scope                            -->
<!-- ========================================================= -->
<!-- Last update : 2019/11/03                                  -->
<!-- Update for the RE subject                                 -->
<!-- ========================================================= -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================================= -->
<!-- SpecificationObject (abstract class) template -->
<!-- ============================================= -->

<xsl:template name="SpecificationObject_Top">
    <xsl:param name="span">1</xsl:param>
   
    <xsl:apply-templates select="rem:name"/>   
    <xsl:apply-templates select="rem:version"/>
    
    <xsl:call-template name="Authors">
        <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>
    
    <xsl:call-template name="Sources">
        <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>   
</xsl:template>

<!-- Si se pasa una cadena en el parámetro node,     -->
<!-- no se puede usar apply-templates en GenerateRow -->

<!-- Esto lo único que hace es procesar los comentarios -->

<xsl:template name="SpecificationObject_Bottom">
    <xsl:param name="span">1</xsl:param>
    <xsl:variable name="ns-comments" select="normalize-space(rem:comments)"/>

    <xsl:call-template name="GenerateRow"> 
        <xsl:with-param name="title">
			<xsl:value-of select="$rem:lang_comments"/>		
		</xsl:with-param>
        <xsl:with-param name="node" select="$ns-comments"/>
        <!-- <xsl:with-param name="node" select="normalize-space(rem:comments)"/> -->
        <!-- <xsl:with-param name="node" select="rem:comments"/> -->
        <xsl:with-param name="span" select="$span"/>        
    </xsl:call-template>
</xsl:template>

<!-- ============================================= -->
<!-- rem:version                                   -->
<!-- ============================================= -->

<xsl:template match="rem:version">
    <tr>
		<th align="left" valign="top">
			<xsl:value-of select="$rem:lang_version"/>
		</th>
        <td align="left" valign="top">
            <xsl:value-of select="rem:major"/>.<xsl:value-of select="rem:minor"/> 
			( <xsl:apply-templates select="rem:date"/> )
        </td>
    </tr>
</xsl:template>

<!-- ============================================= -->
<!-- Authors/Sources template                      -->
<!-- ============================================= -->

<xsl:template name="Authors">
    <xsl:param name="span">1</xsl:param>

    <xsl:if test="rem:authors">
        <tr>
            <th align="left" valign="top">
	            <xsl:value-of select="$rem:lang_authors"/>
	        </th>
            <td align="left" valign="top" colspan="{$span}">
                <xsl:apply-templates select="rem:authors"/>
            </td>
       </tr>
    </xsl:if>
</xsl:template>

<xsl:template name="Sources">
    <xsl:param name="span">1</xsl:param>

    <xsl:if test="rem:sources">
        <tr>
            <th align="left" valign="top">
	            <xsl:value-of select="$rem:lang_sources"/>
	        </th>
            <td align="left" valign="top" colspan="{$span}">
                <xsl:apply-templates select="rem:sources"/>
            </td>
       </tr>
    </xsl:if>
</xsl:template>

<!-- ============================================== -->
<!-- rem:authors|rem:sources template               -->
<!-- ============================================== -->

<xsl:template match="rem:authors|rem:sources">
	<ul class="stakeholders">
    <xsl:for-each select="id(@stakeholders)">
      <xsl:sort select="rem:name"/>
      <li>
	    <a href="#{@oid}"><xsl:value-of select="rem:name"/></a>
	  </li>
    </xsl:for-each>
	</ul>
</xsl:template>

</xsl:stylesheet>