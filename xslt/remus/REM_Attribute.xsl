<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_Attribute.xsl                 -->
<!-- Content : Stylesheet for Attributes         -->
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
<!-- rem:attribute template                         -->
<!-- ============================================== -->

<xsl:template match="rem:attribute">
    <xsl:call-template name="GenerateAnchor"/>

    <table border="1" width="100%">

	    <xsl:apply-templates select="rem:name"/>

		<tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_description"/>
			</th>

			<td align="left" valign="top">
				<xsl:value-of select="$rem:lang_att_lp_01"/>
				<em>
					<xsl:apply-templates select="rem:description"/>
				</em>
			</td>
		</tr>

		<xsl:if test="rem:isVariable|rem:isConstant">
			<tr>
				<th align="left" valign="top">
					<xsl:value-of select="$rem:lang_type"/>
				</th>
				<td align="left" valign="top">
					<xsl:call-template name="GenerateType"/>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="rem:isVariable and rem:expression">
			<tr>    
				<th align="left" valign="top">
					<xsl:value-of select="$rem:lang_initialValue"/>
				</th>
				<td align="left" valign="top">
					<code>
						<xsl:apply-templates select="rem:expression/rem:ocl"/>
					</code>
				</td>
			</tr>            
		</xsl:if>

		<xsl:if test="rem:isDerived">
			<tr>    
				<th align="left" valign="top">
					<xsl:value-of select="$rem:lang_expression"/>
				</th>
				<td align="left" valign="top">
					<code>
						<xsl:apply-templates select="rem:expression/rem:ocl"/>
					</code>
				</td>
			</tr>            
		</xsl:if>

	    <xsl:call-template name="GenerateRow"> 
		    <xsl:with-param name="title">
				<xsl:value-of select="$rem:lang_comments"/>		
			</xsl:with-param>
	        <xsl:with-param name="node" select="rem:comments"/> 
	    </xsl:call-template>

    </table>
    <p/>
</xsl:template>

<!-- ============================================== -->
<!-- rem:attribute/rem:name template                -->
<!-- ============================================== -->

<xsl:template match="rem:attribute/rem:name">
    <tr>
		<xsl:attribute name="bgcolor">
			<xsl:value-of select="$rem:header_background"/>
		</xsl:attribute>

        <th align="left" valign="top" nowrap="1">
            <xsl:choose>
                <xsl:when test="../rem:isConstant">
                    <xsl:value-of select="$rem:lang_constant_attribute"/>
                </xsl:when>
                <xsl:when test="../rem:isVariable">
                    <xsl:value-of select="$rem:lang_variable_attribute"/>
                </xsl:when>
                <xsl:when test="../rem:isDerived">
                    <xsl:value-of select="$rem:lang_derived_attribute"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$rem:lang_attribute"/>
                </xsl:otherwise>
            </xsl:choose>
        </th>
        <th align="left" valign="top" width="100%">
            <xsl:value-of select="../../rem:name"/>::<xsl:value-of select="."/>
        </th>
    </tr>
</xsl:template>

<!-- ==================================================== -->
<!-- rem:associationType/rem:attribute/rem:name template  -->
<!-- ==================================================== -->

<xsl:template match="rem:associationType/rem:attribute/rem:name">
    <tr>
		<xsl:attribute name="bgcolor">
			<xsl:value-of select="$rem:header_background"/>
		</xsl:attribute>

        <th align="left" valign="top" nowrap="1">
            <xsl:choose>
                <xsl:when test="../rem:isConstant">
                    <xsl:value-of select="$rem:lang_constant_attribute"/>
                </xsl:when>
                <xsl:when test="../rem:isVariable">
                    <xsl:value-of select="$rem:lang_variable_attribute"/>
                </xsl:when>
                <xsl:when test="../rem:isDerived">
                    <xsl:value-of select="$rem:lang_derived_attribute"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$rem:lang_attribute"/>
                </xsl:otherwise>
            </xsl:choose>
        </th>	
        
		<xsl:call-template name="GenerateAssociationName"/>
    
	</tr>
</xsl:template>

</xsl:stylesheet>
