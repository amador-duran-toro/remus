<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =================================================== -->
<!-- File    : REM_PFC_SpecificationDocument.xsl         -->
<!-- Content : Hoja de estilo para documentación de PFCs -->
<!-- Author  : Amador Durán Toro                         -->
<!-- Date    : 2005/07/17                                -->
<!-- Version : 1.1                                       -->
<!-- =================================================== -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"     
    version="1.0">
    
<!-- =============================================== -->
<!-- Specification Document template (1er documento) -->
<!-- =============================================== -->

<xsl:template match="rem:c_requirementsSpecification">

	<html xmlns="http://www.w3.org/1999/xhtml">

	<!-- Cabecera -->

	<xsl:comment>Cabecera</xsl:comment>
	<head>     
  	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
		<title>PFC <xsl:value-of select="../rem:name"/></title>
		<link rel="stylesheet" 
			  href="css/REM_PFC.css" 
			  type="text/css" />
	</head>

	<!-- Cuerpo -->

	<xsl:comment>Cuerpo</xsl:comment>
	<body>
  
    <!-- Depuración -->
		<!--
    <div>
      Nº de cambios: 
      <xsl:value-of 
        select="count(document('D:\Documents and Settings\Amador\Mis Documentos\Mis asignaturas\PFC\REM.Test\Test (Change).log.xml')//rem:change[
          not( starts-with( rem:owner, 'CRS' ) ) and
          not( starts-with( rem:owner, 'DRS' ) ) and
          not( starts-with( rem:owner, 'CHS' ) ) and
          not( starts-with( rem:owner, 'DFS' ) )                              
        ])"
      />
    </div>
  	-->
		
		<!-- Portada del PFC -->
		<xsl:comment>Portada del PFC</xsl:comment> 

		<xsl:comment>Logo de la Universidad de Sevilla</xsl:comment>
		<div id="portada_Logo_div">
		  <img id="portada_Logo_img"
			   alt="Universidad de Sevilla"
			   src="imagenes/rem_pfc/logo_us.gif"/>
		</div>

		<xsl:comment>Nombre de la Escuela</xsl:comment>
		<div id="portada_ETSII_div">
      <xsl:value-of select="//rem:organization[@oid='ORG-0001']/rem:name"/>
		</div>

		<xsl:comment>Nombre de la titulación</xsl:comment>
		<div id="portada_Titulacion_div">
      <xsl:value-of select="//rem:organization[@oid='ORG-0003']/rem:name"/>
		</div>

		<xsl:comment>Título del PFC</xsl:comment>
		<div id="portada_PFC_div">
		  <xsl:value-of select="rem:name"/>  
		</div>

		<xsl:comment>Nombre del alumno</xsl:comment>
		<div id="portada_Alumno_div">
		  Realizado por<br/>
      <xsl:for-each select="//rem:stakeholder[rem:stakeholderRole='Alumno']">
  		  <xsl:value-of select="rem:name"/><br/>
      </xsl:for-each>
		</div>

		<xsl:comment>Nombre del director</xsl:comment>
		<div id="portada_Director_div">
		  Dirigido por<br/>
		  <xsl:value-of select="//rem:stakeholder[rem:stakeholderRole='Director']/rem:name"/>
		</div>

		<xsl:comment>Departamento</xsl:comment>
		<div id="portada_Departamento_div">
		  Departamento<br/>
		  <xsl:value-of select="//rem:organization[@oid='ORG-0002']/rem:name"/>
		</div> 

		<xsl:comment>Fecha</xsl:comment>
		<div id="portada_Fecha_div">
		  Sevilla,
      <xsl:call-template name="MonthName">
        <xsl:with-param name="month" select="rem:version/rem:date/rem:month"/>
      </xsl:call-template>
      de <xsl:value-of select="rem:version/rem:date/rem:year"/>
		</div> 

    <!-- Esta es la única forma de que el Word meta un salto de página -->
    <br clear="all" style="page-break-before:always"/>        
    
		<!-- Índice del PFC-->
    <!-- Esto debería hacerse usando mode -->
		<div class="pfc_indice">

		<xsl:comment>Índice del PFC</xsl:comment>

		<h1 align="left"><xsl:value-of select="$rem:lang_TOC"/></h1>
		<p><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</p>
  	<table border="0" width="100%" class="TOC">

		  <xsl:for-each select="rem:section[rem:level='1']">
         <xsl:choose>
           <xsl:when test="starts-with(normalize-space(rem:comments), $rem:lang_parte)">
     			   <tr>
     			    <th align="left" valign="top" width="100%" colspan="4">
                <div class="pfc_indice_parte">
         					<a href="#{@oid}">
                     Parte <xsl:number count="//rem:section[starts-with(normalize-space(rem:comments), $rem:lang_parte)]" format="I"/>:
                     <xsl:value-of select="rem:name"/>
                  </a>
                 </div>
               </th>
              </tr>                          
           </xsl:when>
           <xsl:otherwise>
             <tr>
               <th align="left" valign="top">
                 <xsl:value-of select="rem:number"/>
               </th>
               <th align="left" valign="top" width="100%" colspan="3">             
      				  <a href="#{@oid}">
                   <xsl:value-of select="rem:name"/>
                 </a>
               </th>
               </tr>             
            </xsl:otherwise>
          </xsl:choose>

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

		</div>
		
    <!-- Esta es la única forma de que el Word meta un salto de página -->
    <!--
    <br clear="all" style="page-break-before:always"/>
    -->        

    <!-- Document body -->

    <xsl:for-each select=
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
    >
      <xsl:apply-templates select="."/>
      <p><xsl:text> </xsl:text></p>
    </xsl:for-each>

		<xsl:comment>Validadores W3C</xsl:comment>
		<div id="validadores_W3C_div">

			<a id="validador_CSS_a" 
				 href="http://jigsaw.w3.org/css-validator">
				 <img id="validador_CSS_img" 
				 			src="imagenes/rem_pfc/vcss.png" 
							alt="Valid CSS!" />			 
		  </a>
			
		  <a id="validador_XHTML_a" 
			 	 href="http://validator.w3.org/check/referer">
			   <img id="validador_XHTML_img" 
				 			src="imagenes/rem_pfc/valid-xhtml11.png"
							alt="Valid XHTML 1.1!" />
			</a>

		</div>
    
    </body>
</html>

</xsl:template>

<!-- ===================================================== -->
<!-- Specification Document template (resto de documentos) -->
<!-- ===================================================== -->

<xsl:template match="rem:d_requirementsSpecification|rem:defectsSpecification|rem:changeRequestsSpecification">

	<html xmlns="http://www.w3.org/1999/xhtml">

	<!-- Cabecera -->

	<xsl:comment>Cabecera</xsl:comment>
	<head>     
  	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
		<title>PFC <xsl:value-of select="../rem:name"/></title>
		<link rel="stylesheet" 
			  href="css/REM_PFC.css" 
			  type="text/css" />
	</head>

	<!-- Cuerpo -->

	<xsl:comment>Cuerpo</xsl:comment>
	<body>

		<xsl:comment>Logo de la Universidad de Sevilla</xsl:comment>
		<div id="portada_Logo_div">
		  <img id="portada_Logo_img"
			   alt="Universidad de Sevilla"
			   src="imagenes/rem_pfc/logo_us.gif"/>
		</div>

		<xsl:comment>Nombre del documento</xsl:comment>
		<div id="portada_PFC_div">
		  <xsl:value-of select="rem:name"/>  
		</div>

    <!-- Document body -->

    <xsl:for-each select=
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
    >
      <xsl:apply-templates select="."/>
      <p><xsl:text> </xsl:text></p>
    </xsl:for-each>
   
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
