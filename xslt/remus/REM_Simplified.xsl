<?xml version="1.0" encoding="iso-8859-1"?>

<!-- =================================================== -->
<!-- File    : REM_RE_main.xsl                           -->
<!-- Content : REM stylesheet for RE subject - main file -->
<!-- Author  : Amador Durán Toro                         -->
<!-- Date    : 2020/01/31                                -->
<!-- Version : 1.0                                       -->
<!-- =================================================== -->

<!-- exclude-result-prefixes does not work in XSLT 1.0 -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
	exclude-result-prefixes="rem"
>

<!-- ============================================= -->
<!-- Output method                                 -->
<!-- ============================================= -->

<xsl:output
    method="xml"
    indent="yes"
    omit-xml-declaration="yes"
/>
	
<!-- ============================================= -->
<!-- Global variables                              -->
<!-- ============================================= -->

<!-- Esto debería ir en una hoja de estilo CSS -->
<xsl:variable name="rem:header_background">#c8e0e0</xsl:variable>

<!-- ============================================= -->
<!-- Includes                                      -->
<!-- ============================================= -->

<xsl:include href="REM_Simplified_SpecificationDocument.xsl"/>
    <xsl:include href="../default/REM_Date.xsl"/>
    <xsl:include href="../default/REM_Time.xsl"/>
    <xsl:include href="REM_Simplified_TraceImage.xsl"/>
    <xsl:include href="REM_Simplified_SpecificationObject.xsl"/>
        <xsl:include href="REM_Simplified_Section.xsl"/>
        <xsl:include href="REM_Simplified_Paragraph.xsl"/>
        <xsl:include href="REM_GlossaryItem.xsl"/>
        <xsl:include href="REM_GraphicFile.xsl"/>
        <xsl:include href="REM_Organization.xsl"/>
        <xsl:include href="REM_Stakeholder.xsl"/>
        <xsl:include href="REM_Meeting.xsl"/>
        <xsl:include href="REM_Actor.xsl"/>
        <xsl:include href="REM_Simplified_C_Requirement.xsl"/>
            <xsl:include href="REM_Objective.xsl"/>
            <xsl:include href="REM_InformationRequirement.xsl"/>
            <xsl:include href="REM_ConstraintRequirement.xsl"/>
            <xsl:include href="REM_Simplified_UseCase.xsl"/>
            <xsl:include href="REM_FunctionalRequirement.xsl"/>
            <xsl:include href="REM_NonFunctionalRequirement.xsl"/>
        <xsl:include href="REM_TraceabilityMatrix.xsl"/>
        <xsl:include href="REM_D_Requirement.xsl"/>
            <xsl:include href="REM_ObjectType.xsl"/>
            <xsl:include href="REM_ValueType.xsl"/>
            <xsl:include href="REM_AssociationType.xsl"/>
                <xsl:include href="REM_Attribute.xsl"/>
                <xsl:include href="REM_Invariant.xsl"/>
                <xsl:include href="REM_Role.xsl"/>
            <xsl:include href="REM_SystemOperation.xsl"/>
                <xsl:include href="REM_OperationException.xsl"/>
        <xsl:include href="REM_Simplified_Conflict.xsl"/>
        <xsl:include href="REM_Defect.xsl"/>
            <xsl:include href="REM_Alternative.xsl"/>
        <xsl:include href="REM_ChangeRequest.xsl"/>
            <xsl:include href="REM_AffectedObjects.xsl"/>


<!-- ============================================= -->
<!-- rem:text template                             -->
<!-- ============================================= -->

<xsl:template match="rem:text">
    <xsl:apply-templates/>
</xsl:template>

<!-- ============================================= -->
<!-- rem:ref template                              -->
<!-- ============================================= -->

<xsl:template match="rem:ref">
    <a href="#{@oid}">

    <xsl:choose>
      <xsl:when test="//rem:glossaryItem[@oid=current()/@oid]">
        <xsl:for-each select="//rem:glossaryItem[@oid=current()/@oid]">
          <xsl:attribute name="title">
		    <xsl:value-of select="normalize-space(rem:text)"/></xsl:attribute>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="id(@oid)">
          <xsl:attribute name="title"><xsl:value-of select="normalize-space(rem:name)"/></xsl:attribute>
         </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:value-of select="."/>

    </a>
</xsl:template>

<!-- ============================================= -->
<!-- rem:tbd template                              -->
<!-- ============================================= -->

<xsl:template match="rem:tbd">
    <span class="tbd"><xsl:value-of select="$rem:lang_TBD"/></span>
</xsl:template>

<!-- ============================================= -->
<!-- br template                                   -->
<!-- ============================================= -->

<xsl:template match="br">
    <xsl:copy/>
</xsl:template>

<!-- Esto hace que si hay dos <br/> seguidos se genere un <p/> -->
<!-- Mejora la visualización en el Word (en HTML da igual)     --> 

<!-- Los <br/> con otro detrás generan un <p> -->
<xsl:template match="rem:text/br[following-sibling::node()[1][self::br]]">
  <p/>
</xsl:template>

<!-- Los <br/> con otro delante se ignoran -->
<xsl:template match="rem:text/br[preceding-sibling::node()[1][self::br]]"/>

<!-- ============================================== -->
<!-- Auxiliary templates                            -->
<!-- ============================================== -->

<!-- ============================================= -->
<!-- rem:name                                      -->
<!-- ============================================= -->

<!-- NOTE: anchors inside tables don't work in IE 5.5 -->

<xsl:template match="rem:name">
    <tr class="name">
        <th align="left" valign="top">
            <xsl:value-of select="../@oid"/>
        </th>
        <th align="left" valign="top" width="100%">
            <xsl:apply-templates/>
        </th>
    </tr>
</xsl:template>

<xsl:template match="
      rem:changeRequestStatusValue/rem:name |
      rem:conflictStatusValue/rem:name      |
      rem:defectStatusValue/rem:name        |
      rem:defectTypeValue/rem:name          |
      rem:importanceValue/rem:name          |
      rem:stabilityValue/rem:name           |
      rem:statusValue/rem:name              |
      rem:terminationValue/rem:name         |
      rem:timeIntervalValue/rem:name        |
      rem:timeUnitValue/rem:name            |
      rem:urgencyValue/rem:name"
>
    <xsl:value-of select="."/>
</xsl:template>

<!-- ============================================= -->
<!-- GenerateRow                                   -->
<!-- ============================================= -->

<xsl:template name="GenerateRow">
    <xsl:param name="title"/>
    <xsl:param name="node" select="/.."/>
    <xsl:param name="span">1</xsl:param>
    <tr>
        <th align="left" valign="top"><xsl:value-of select="$title"/></th>
        <td align="left" valign="top">
            <xsl:if test="$title = $rem:lang_comments">
              <xsl:attribute name="class">comment</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="colspan"><xsl:value-of select="$span"/></xsl:attribute>
			<!-- Parece que hay problemas con esta expresión -->
            <xsl:value-of select="$node"/>
            <!-- <xsl:apply-templates select="$node"/> -->
        </td>
    </tr>
</xsl:template>

<!-- ============================================= -->
<!-- GenerateAnchor                                -->
<!-- ============================================= -->

<xsl:template name="GenerateAnchor">
  <a name="{@oid}"/>
</xsl:template>

</xsl:stylesheet>
