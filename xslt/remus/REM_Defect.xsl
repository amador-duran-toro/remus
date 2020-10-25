<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_Defect.xsl                    -->
<!-- Content : Stylesheet for Defects            -->
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

<!-- ============================== -->
<!-- rem:defect template            -->
<!-- ============================== -->

<xsl:template match="rem:defect">
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

        <xsl:choose>
            <xsl:when test="rem:importance/@value">
                <xsl:call-template name="GenerateRow"> 
	                <xsl:with-param name="title">
						<xsl:value-of select="$rem:lang_importance"/>
					</xsl:with-param> 
                    <xsl:with-param name="node" select="id(rem:importance/@value)/rem:name"/>
                </xsl:call-template>    
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="GenerateRow"> 
	                <xsl:with-param name="title">
						<xsl:value-of select="$rem:lang_importance"/>
					</xsl:with-param> 
                    <xsl:with-param name="node" select="rem:importance/rem:tbd"/>
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
                </xsl:call-template>    
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="GenerateRow"> 
	                <xsl:with-param name="title">
						<xsl:value-of select="$rem:lang_urgency"/>
					</xsl:with-param> 
                    <xsl:with-param name="node" select="rem:urgency/rem:tbd"/>
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
                </xsl:call-template>    
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="GenerateRow"> 
	                <xsl:with-param name="title">
						<xsl:value-of select="$rem:lang_status"/>
					</xsl:with-param> 
                    <xsl:with-param name="node" select="rem:status/rem:tbd"/>
                </xsl:call-template>    
            </xsl:otherwise>
        </xsl:choose>  

        <xsl:call-template name="SpecificationObject_Bottom"/>
    </table>
    <p/>
    
    <xsl:apply-templates select="rem:alternative"/>
</xsl:template>

<!-- ============================== -->
<!-- rem:defect/rem:name template   -->
<!-- ============================== -->

<xsl:template match="rem:defect/rem:name">
    <tr>
		<xsl:attribute name="bgcolor">
			<xsl:value-of select="$rem:header_background"/>
		</xsl:attribute>
        <th align="left" valign="top">
			<xsl:value-of select="../@oid"/>
		</th>
		<th align="left" valign="top" width="100%">
			<xsl:apply-templates/> 
			<xsl:if test="../rem:defectType/@value">
				( <xsl:value-of select="id(../rem:defectType/@value)/rem:name"/> )
			</xsl:if>
		</th>
    </tr>
</xsl:template>

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
    <tr bgcolor="#c0c0c0">
        <th align="left" valign="top" nowrap="1">
			<xsl:value-of select="$rem:lang_alternative"/>
		</th>
        <th align="left" valign="top" width="100%">
            <xsl:value-of select="../../rem:name"/>::<xsl:value-of select="."/>
        </th>
    </tr>
</xsl:template>

</xsl:stylesheet>
