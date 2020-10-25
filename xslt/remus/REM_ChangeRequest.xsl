<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ========================================= -->
<!-- File    : REM_ChangeRequest.xsl           -->
<!-- Content : Stylesheet for ChangeRequests   -->
<!-- Author  : Amador Duran Toro               -->
<!-- Date    : 2001/01/30                      -->
<!-- Version : 1.0                             -->
<!-- ========================================= -->
<!-- Last update : 2002/08/19                  -->
<!-- ChangeRequestStatusValue was not properly -->
<!-- generated                                 -->
<!-- ========================================= -->
<!-- Last update : 2002/05/29                  -->
<!-- Namespace URI has changed                 -->
<!-- ========================================= -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================== -->
<!-- rem:changeRequest template     -->
<!-- ============================== -->

<xsl:template match="rem:changeRequest">
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

        <!-- rem:analysis -->

        <xsl:call-template name="GenerateRow"> 
            <xsl:with-param name="title">
				<xsl:value-of select="$rem:lang_analysis"/>
			</xsl:with-param> 
            <xsl:with-param name="node" select="rem:analysis"/> 
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

</xsl:stylesheet>
