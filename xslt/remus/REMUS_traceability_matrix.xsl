<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================================== -->
<!-- File    : REMUS_traceability_matrix.xsl                     -->
<!-- Content : REM XSLT for subjects at US - traceability matrix -->
<!-- Author  : Amador Dur�n Toro                                 -->
<!-- Date    : 2020/07/28                                        -->
<!-- Version : 3.0                                               -->
<!-- =========================================================== -->

<!-- =========================================================== -->
<!-- exclude-result-prefixes="rem" must be set in all files      -->
<!-- to avoid xmlsn:rem="..." to appear in HTML tags.            -->
<!-- =========================================================== -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    exclude-result-prefixes="rem"
>

<!-- ============================================= -->
<!-- rem:traceabilityMatrix template               -->
<!-- ============================================= -->

<xsl:template match="rem:traceabilityMatrix">
    <div id="{@oid}" class="traceability_matrix">
        <table class="traceability_matrix remus_table">
            <thead>
                <xsl:apply-templates select="rem:tr[position()=1]"/>
            </thead>
            <tbody>
                <xsl:apply-templates select="rem:tr[position()>1]"/>
            </tbody>
        </table>

        <p class="matrix_caption">
            <span class="matrix_caption_label">
                <xsl:value-of select="$rem:lang_traceability_matrix"/>
                <xsl:text> </xsl:text>
                <!-- from is needed to restart numbering in each document          -->
                <!-- level is needed to avoid restarting numbering in each section -->
                <xsl:number
                    from="rem:c_requirementsSpecification |
                          rem:d_requirementsSpecification |
                          rem:defectsSpecification        |
                          rem:changeRequestsSpecification"
                    level="any"/>:
                <xsl:text> </xsl:text>
            </span>
            <!-- not applying markdown -->
            <!-- <xsl:apply-templates select="rem:name"/> -->
            <!-- applying markdown -->
            <xsl:call-template name="generate_markdown">
                <xsl:with-param name="node" select="rem:name"/>
            </xsl:call-template>
        </p>
    </div>
</xsl:template>

<!-- ====================================== -->
<!-- rem:traceabilityMatrix/rem:tr template -->
<!-- ====================================== -->

<!-- first row -->
<xsl:template match="rem:tr[position()=1]">
    <tr>
        <xsl:apply-templates mode="first_row"/>
    </tr>
</xsl:template>

<!-- rest of rows -->
<xsl:template match="rem:tr">
    <tr>
        <xsl:apply-templates/>
    </tr>
</xsl:template>

<!-- ============================================ -->
<!-- rem:th templates in first_row mode           -->
<!-- ============================================ -->

<!-- first row, first column -->
<xsl:template match="rem:th[not(@oid)]" mode="first_row">
    <xsl:variable name="icon">traceabilityMatrix.png</xsl:variable>
    <th class="matrix_oid">
        <img src="{concat($rem:base_url_icons,$icon)}"/>
        <xsl:text> </xsl:text>
        <span class="matriz_oid"><xsl:value-of select="../../@oid"/></span>
        <br/>
        <button class="reduce_font">A-</button>
        <button class="increase_font">A+</button>
    </th>
</xsl:template>

<!-- first row, rest of columns -->
<xsl:template match="rem:th[@oid]" mode="first_row">
    <th class="matrix_column">
        <a href="#{@oid}" title="{@oid} - {id(@oid)/rem:name}">
            <xsl:value-of select="@oid"/>
        </a>
    </th>
</xsl:template>

<!-- ============================================ -->
<!-- rem:th template                              -->
<!-- ============================================ -->

<xsl:template match="rem:th[@oid]">
    <th>
        <a href="#{@oid}" title="{@oid} - {id(@oid)/rem:name}">
            <xsl:value-of select="@oid"/>
        </a>
    </th>
</xsl:template>

<!-- ====================================== -->
<!-- rem:td template                        -->
<!-- ====================================== -->

<xsl:template match="rem:td">
    <td>
        <xsl:choose>
            <xsl:when test="@mark='yes'">
                <xsl:attribute name="class">trace</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>-</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </td>
</xsl:template>

</xsl:stylesheet>
