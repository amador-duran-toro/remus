<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_defect.xsl                               -->
<!-- Content : REM XSLT for subjects at US - defect           -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2021/01/02                                     -->
<!-- Version : 3.0                                            -->
<!-- ======================================================== -->

<!-- ======================================================== -->
<!-- exclude-result-prefixes="rem" must be set in all files   -->
<!-- to avoid xmlsn:rem="..." to appear in HTML tags.         -->
<!-- ======================================================== -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    exclude-result-prefixes="rem"
>
<!-- ============================================= -->
<!-- rem:defect template                           -->
<!-- ============================================= -->

<xsl:template match="rem:defect">
    <div id="{@oid}">
        <table class="defect remus_table">

            <xsl:call-template name="generate_expanded_header"/>

            <!-- directly affected objects -->
            <tr>
                <th>
                    <xsl:value-of select="$rem:lang_directly_affected_objects"/>
                </th>

                <td>
                    <xsl:choose>
                        <xsl:when test="not(rem:directlyAffects)">
                            <span class="tbd"><xsl:value-of select="$rem:lang_TBD"/></span>
                        </xsl:when>
                        <xsl:otherwise>
                            <ul class="affected_objects">
                                <xsl:for-each select="id(rem:directlyAffects/@affected)">
                                    <li>
                                        <a href="#{@oid}">
                                            [<xsl:value-of select="@oid"/>] <xsl:value-of select="rem:name"/>
                                        </a>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <!-- indirectly affected objects -->
            <tr>
                <th>
                    <xsl:value-of select="$rem:lang_indirectly_affected_objects"/>
                </th>

                <td>
                    <xsl:choose>
                        <xsl:when test="not(rem:indirectlyAffects)">
                            <span class="tbd"><xsl:value-of select="$rem:lang_TBD"/></span>
                        </xsl:when>
                        <xsl:otherwise>
                            <ul class="affected_objects">
                                <xsl:for-each select="id(rem:indirectlyAffects/@affected)">
                                    <li>
                                        <a href="#{@oid}">
                                            [<xsl:value-of select="@oid"/>] <xsl:value-of select="rem:name"/>
                                        </a>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_description"/>
                <xsl:with-param name="content" select="rem:description"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
            </xsl:call-template>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_possible_solution"/>
                <xsl:with-param name="content" select="rem:solution"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
            </xsl:call-template>

            <!-- alternatives -->

            <xsl:if test="rem:alternative">
                <tr>
                    <th>
                        <xsl:value-of select="$rem:lang_alternatives"/>
                    </th>

                    <td>
                        <ol class="alternatives">
                            <xsl:apply-templates select="rem:alternative"/>
                        </ol>
                    </td>
                </tr>
            </xsl:if>

            <xsl:call-template name="generate_priority_rows"/>
            <xsl:call-template name="generate_comments_row"/>

        </table>
    </div>
</xsl:template>

<!-- ============================== -->
<!-- rem:defect/rem:name template   -->
<!-- ============================== -->

<xsl:template match="rem:defect/rem:name">
    <xsl:apply-templates/>
    <xsl:if test="../rem:defectType/@value">
        (<xsl:value-of select="id(../rem:defectType/@value)/rem:name"/>
         <img src="{concat($rem:base_url_icons,$rem:infoImage)}">
            <xsl:attribute name="title">
                <xsl:value-of select="id(../rem:defectType/@value)/rem:description"/>
            </xsl:attribute>
         </img>)
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
