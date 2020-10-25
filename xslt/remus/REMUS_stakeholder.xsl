<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_stakeholder.xsl                          -->
<!-- Content : REM XSLT for subjects at US - stakeholder      -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2020/07/21                                     -->
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
<!-- rem:stakeholder template                      -->
<!-- ============================================= -->

<xsl:template match="rem:stakeholder">
    <xsl:variable name="is_developer" select="rem:isDeveloper"/>
    <xsl:variable name="is_customer"  select="rem:isCustomer"/>
    <xsl:variable name="is_user"      select="rem:isUser"/>
    <xsl:variable name="role_count"   select="count(rem:isDeveloper|rem:isCustomer|rem:isUser)"/>

    <xsl:variable name="is_stakeholder">
        <xsl:if test="$is_developer">
            <xsl:value-of select="rem:toLowerCase(string($rem:lang_isDeveloper))"/>
            <xsl:if test="$is_customer or $is_user">, </xsl:if>
        </xsl:if>
        <xsl:if test="$is_customer">
            <xsl:value-of select="rem:toLowerCase(string($rem:lang_isCustomer))"/>
            <xsl:if test="$is_user">, </xsl:if>
        </xsl:if>
        <xsl:if test="$is_user">
            <xsl:value-of select="rem:toLowerCase(string($rem:lang_isUser))"/>
        </xsl:if>
    </xsl:variable>

    <div id="{@oid}">
        <table class="stakeholder remus_table">

            <xsl:call-template name="generate_header">
                <xsl:with-param name="label" select="$rem:lang_stakeholder"/>
            </xsl:call-template>

            <tr>
                <th>
                    <xsl:value-of select="$rem:lang_organization"/>
                </th>
                <td>
                    <xsl:choose>
                        <xsl:when test="not(rem:worksFor)"><xsl:value-of select="$rem:lang_freelance"/></xsl:when>
                        <xsl:otherwise>
                            <a href="#{rem:worksFor/@organization}">
                                <xsl:value-of select="id(rem:worksFor/@organization)/rem:name"/>
                            </a>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"     select="$rem:lang_role"/>
                <xsl:with-param name="content"   select="rem:stakeholderRole"/>
                <xsl:with-param name="postfix">
                    <xsl:if test="$role_count > 0">
                        (<xsl:value-of select="$is_stakeholder"/>)
                    </xsl:if>
                </xsl:with-param>
                <xsl:with-param name="mandatory" select="true()"/>
            </xsl:call-template>

            <!--
            <xsl:call-template name="generate_is_row">
                <xsl:with-param name="label" select="$rem:lang_isDeveloper"/>
                <xsl:with-param name="node"  select="rem:isDeveloper"/>
            </xsl:call-template>

            <xsl:call-template name="generate_is_row">
                <xsl:with-param name="label" select="$rem:lang_isCustomer"/>
                <xsl:with-param name="node"  select="rem:isCustomer"/>
            </xsl:call-template>

            <xsl:call-template name="generate_is_row">
                <xsl:with-param name="label" select="$rem:lang_isUser"/>
                <xsl:with-param name="node"  select="rem:isUser"/>
            </xsl:call-template>
            -->

            <xsl:call-template name="generate_comments_row"/>

        </table>
    </div>
</xsl:template>

<!-- ============================================= -->
<!-- generate_is_row template                      -->
<!-- ============================================= -->

<!--
<xsl:template name="generate_is_row">
    <xsl:param name="label"/>
    <xsl:param name="node"/>

    <tr>
        <th>
            <xsl:value-of select="$label"/>
        </th>
        <td>
            <xsl:choose>
                <xsl:when test="not($node)">
                    <xsl:value-of select="$rem:lang_no"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$rem:lang_yes"/>
                </xsl:otherwise>
            </xsl:choose>
        </td>
    </tr>
</xsl:template>
-->

</xsl:stylesheet>
