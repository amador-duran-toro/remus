<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_SystemOperation.xsl           -->
<!-- Content : Stylesheet for System Operations  -->
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
<!-- rem:systemOperation template                   -->
<!-- ============================================== -->

<xsl:template match="rem:systemOperation">
    <xsl:call-template name="GenerateAnchor"/>

    <table border="1" width="100%">    
        <xsl:call-template name="D_Requirement_Top"/>

        <!-- description -->

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_description"/>
			</th>
            <td align="left" valign="top">
                <xsl:apply-templates select="rem:description"/>
            </td>
        </tr>

        <!-- parameters -->

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_parameters"/>
			</th>
            <td align="left" valign="top">
                <xsl:if test="not(rem:parameter)">
                    <xsl:value-of select="$rem:lang_none"/>
                </xsl:if>
                <xsl:for-each select="rem:parameter">
                    <xsl:call-template name="GenerateAnchor"/>
                    <code><xsl:value-of select="rem:name"/> : <xsl:call-template name="GenerateType"/> -- <em><xsl:apply-templates select="rem:description"/></em></code><br/>
                </xsl:for-each>
            </td>
        </tr>

        <!-- precondition expressions -->

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_preconditions"/>
			</th>
            <td align="left" valign="top">
                <xsl:if test="not(rem:preconditionexpression)">
                    <xsl:value-of select="$rem:lang_none"/>            
                </xsl:if>
                <xsl:for-each select="rem:preconditionexpression">
                    <xsl:call-template name="GenerateAnchor"/>                
                    <b><xsl:value-of select="rem:name"/></b>: 
					<xsl:apply-templates select="rem:expression/rem:natural"/><br/>
                </xsl:for-each>
            </td>
        </tr>

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_OCL_preconditions"/>
			</th>
            <td align="left" valign="top">
                <xsl:if test="not(rem:preconditionExpression)">
                    <code>true</code>
                </xsl:if>
                <xsl:for-each select="rem:preconditionExpression">
                    <code><b><xsl:value-of select="rem:name"/></b>: <xsl:value-of select="rem:expression/rem:ocl"/></code><br/>
                </xsl:for-each>
            </td>
        </tr>

        <!-- postcondition expressions -->

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_postconditions"/>
			</th>
            <td align="left" valign="top">
                <xsl:if test="not(rem:postconditionExpression)">
                    <xsl:value-of select="$rem:lang_none"/>
                </xsl:if>
                <xsl:for-each select="rem:postconditionExpression">
                    <xsl:call-template name="GenerateAnchor"/>                
                    <b><xsl:value-of select="rem:name"/></b>: <xsl:apply-templates select="rem:expression/rem:natural"/><br/>
                </xsl:for-each>
            </td>
        </tr>

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_OCL_postconditions"/>
			</th>
            <td align="left" valign="top">
                <xsl:if test="not(rem:postconditionExpression)">
                    <code>true</code>
                </xsl:if>
                <xsl:for-each select="rem:postconditionExpression">
                    <code><b><xsl:value-of select="rem:name"/></b>: <xsl:value-of select="rem:expression/rem:ocl"/></code><br/>
                </xsl:for-each>
            </td>
        </tr>

        <xsl:call-template name="D_Requirement_Bottom"/>
    </table>

    <p/>

    <xsl:apply-templates select="rem:operationException"/>
</xsl:template>

<!-- ============================================== -->
<!-- rem:systemOperation/rem:name template          -->
<!-- ============================================== -->

<xsl:template match="rem:systemOperation/rem:name">
    <tr>
		<xsl:attribute name="bgcolor">
			<xsl:value-of select="$rem:header_background"/>
		</xsl:attribute>
        <th align="left" valign="top">
			<xsl:value-of select="../@oid"/>
		</th>
        <th align="left" valign="top" width="100%">
            <xsl:value-of select="."/>
        </th>
    </tr>
    <xsl:if test="../rem:resultType">
        <th align="left" valign="top">
			<xsl:value-of select="$rem:lang_result_type"/>
		</th>
        <td align="left" valign="top">
            <code><xsl:value-of select="../rem:resultType"/></code>
        </td>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
