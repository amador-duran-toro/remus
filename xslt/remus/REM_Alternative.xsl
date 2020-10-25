<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_Alternative.xsl               -->
<!-- Author  : Amador Duran Toro                 -->
<!-- Date    : 2001/01/30                        -->
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

<!-- ============================== -->
<!-- rem:alternative template       -->
<!-- ============================== -->

<xsl:template match="rem:alternative">
    <xsl:call-template name="GenerateAnchor"/>

    <table border="1" width="100%">    
        <xsl:apply-templates select="rem:name"/>  
        <xsl:call-template name="Authors"/>

        <xsl:call-template name="GenerateRow"> 
            <xsl:with-param name="title">
				<xsl:value-of select="$rem:lang_description"/>			
			</xsl:with-param> 
            <xsl:with-param name="node" select="rem:description"/> 
        </xsl:call-template> 
     
        <xsl:call-template name="GenerateRow"> 
            <xsl:with-param name="title">
				<xsl:value-of select="$rem:lang_comments"/>			
			</xsl:with-param> 
            <xsl:with-param name="node" select="rem:comments"/> 
        </xsl:call-template> 
    </table>
    <p/>
</xsl:template>

<!-- ================================== -->
<!-- rem:alternative/rem:name template  -->
<!-- ================================== -->

<xsl:template match="rem:alternative/rem:name">
    <tr>
		<xsl:attribute name="bgcolor">
			<xsl:value-of select="$rem:header_background"/>
		</xsl:attribute>

        <th align="left" valign="top" nowrap="1">
			<xsl:value-of select="$rem:lang_alternative"/>
		</th>
        <th align="left" valign="top" width="100%">
            <xsl:value-of select="../../rem:name"/>::<xsl:value-of select="."/>
        </th>
    </tr>
</xsl:template>

</xsl:stylesheet>
