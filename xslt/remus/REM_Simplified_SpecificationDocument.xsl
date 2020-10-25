<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ================================================== -->
<!-- File    : REM_Simplified_SpecificationDocument.xsl -->
<!-- Content : Stylesheet for REM Documents             -->
<!-- Author  : Amador Durán Toro                        -->
<!-- Date    : 2001/01/30                               -->
<!-- Version : 1.0                                      -->
<!-- ================================================== -->
<!-- Last update : 2002/07/14                           -->
<!-- TOC has its own HTML class                         -->
<!-- ================================================== -->
<!-- Last update : 2002/07/10                           -->
<!-- Embedded styles                                    -->
<!-- ================================================== -->
<!-- Last update : 2002/05/10                           -->
<!-- Namespace URI has changed                          -->
<!-- ================================================== -->
<!-- Last update : 2019/10/30                           -->
<!-- Update for the RE subject                          -->
<!-- ================================================== -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================================= -->
<!-- Specification Document template               -->
<!-- ============================================= -->

<xsl:template match="
	rem:c_requirementsSpecification |
	rem:d_requirementsSpecification |
	rem:defectsSpecification        |
	rem:changeRequestsSpecification"
>
    <!-- <!doctype html> -->
	<xsl:text disable-output-escaping='yes'>&lt;!doctype html&gt;&#xa;</xsl:text>
	
	<!-- rem namespace is always added to the html tag -->
	<html lang="{$rem:lang}">

	<!-- header -->
	<xsl:comment>header</xsl:comment>

	<head>     
		<meta charset="iso-8859-1"/>
		<meta name="generatedBy" content="REM 1.2.2"/>
		<!-- TODO: pensar dónde poner el CSS -->
		<link rel="stylesheet" href="css/rem_simplified.css"/>
	    <title>
			<xsl:value-of select="$rem:lang_project"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="../rem:name"/>
		</title>
	</head>

    <!-- body -->
	<xsl:comment>body</xsl:comment>

	<body>
	
		<!-- cover -->
		<xsl:comment>cover</xsl:comment>

		<center>
		
		<h3>
			<xsl:value-of select="$rem:lang_project"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="../rem:name"/>
		</h3>

		<p/>		
		
		<xsl:comment>US logo</xsl:comment>
		<xsl:comment>Universidad de Sevilla logo</xsl:comment>
		<div id="portada_Logo_div">
		  <img id="portada_Logo_img"
			   alt="Universidad de Sevilla"
			   src="css/logo_us.gif"/>
		</div>
		
		<h1 class="cover">
			<xsl:value-of select="rem:name"/>
		</h1>

		<p/>

		<!-- Version -->

		<h3>
			<xsl:value-of select="$rem:lang_version"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="rem:version/rem:major"/>
			<xsl:text>.</xsl:text>
			<xsl:value-of select="rem:version/rem:minor"/>
		</h3>

		<h3>
			<xsl:value-of select="$rem:lang_date"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="rem:version/rem:date"/>
		</h3>

		<p/>

		<!-- Customer organizations -->

		<h3>
			<xsl:value-of select="$rem:lang_prepared_for"/>
		</h3>
        
		<xsl:choose>
            <xsl:when test="not(rem:preparedFor)">
                <p><font color="red">?</font></p>
            </xsl:when>
            <xsl:otherwise>
            <xsl:for-each select="id(rem:preparedFor/@organizations)">
                <xsl:sort select="rem:name"/>
				<a href="#{@oid}">
                    <p><xsl:value-of select="rem:name"/></p>
                </a>
            </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
		
		<p/>

		<!-- Developer organizations -->

		<h3>
			<xsl:value-of select="$rem:lang_prepared_by"/>
		</h3>
        
		<xsl:choose>
            <xsl:when test="not(rem:preparedBy)">
                <p><font color="red">?</font></p>
            </xsl:when>
            <xsl:otherwise>
            <xsl:for-each select="id(rem:preparedBy/@organizations)">
                <xsl:sort select="rem:name"/>
				<a href="#{@oid}">
                    <p><xsl:value-of select="rem:name"/></p>
                </a>
            </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
		
		<p/>

		</center>
    
		<!-- Esta es la única forma de que el Word meta un salto de página -->
		<br clear="all" style="page-break-before:always"/>        

		<!-- Table of contents (three first levels only) -->

		<h1 align="left"><xsl:value-of select="$rem:lang_TOC"/></h1>
		
		<p/>
		
		<table border="0" width="100%" class="TOC">
		
		<xsl:for-each select="rem:section[rem:level='1']">
			<tr>
				<th align="left" valign="top"><xsl:value-of select="rem:number"/></th>
				<th align="left" valign="top" width="100%" colspan="3">
					<a href="#{@oid}"><xsl:value-of select="rem:name"/></a>
				</th>
			</tr>
		
				<xsl:for-each select=".//rem:section[rem:level='2']">
				<tr><td/>
					<td align="left" valign="top"><xsl:value-of select="rem:number"/></td>
					<td align="left" valign="top" width="100%" colspan="2">
						<a href="#{@oid}"><xsl:value-of select="rem:name"/></a>    
					</td>
				</tr>
            
					<xsl:for-each select=".//rem:section[rem:level='3']">
					<tr><td/><td/>
						<td albgn="left" valign="top"><xsl:value-of select="rem:number"/></td>
						<td align="left" valign="top" width="100%">
							<a href="#{@oid}"><xsl:value-of select="rem:name"/></a> 
						</td>
					</tr>
					</xsl:for-each>
			
				</xsl:for-each>
				
		</xsl:for-each>
		
		</table>
    
		<!-- Esta es la única forma de que el Word meta un salto de página -->
		<br clear="all" style="page-break-before:always"/>        

		<!-- Document body -->

		<xsl:apply-templates select=
        "rem:section                  |
         rem:paragraph                |
         rem:graphicFile              |
         rem:glossaryItem             |
         rem:organization             |
         rem:stakeholder              |
         rem:meeting                  |
         rem:objective                |
         rem:actor                    |
         rem:informationRequirement   |
         rem:constraintRequirement    |
         rem:useCase                  |
         rem:functionalRequirement    |
         rem:nonFunctionalRequirement |
         rem:objectType               |
         rem:userDefinedValueType     |
         rem:associationType          |
         rem:systemOperation          |
         rem:conflict                 |
         rem:defect                   |
         rem:changeRequest            |
         rem:traceabilityMatrix"
		/>

	</body>
	
	</html>

</xsl:template>

</xsl:stylesheet>
