<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_functional_requirement.xsl               -->
<!-- Content : REM XSLT for subjects at US - functional req.  -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2020/07/28                                     -->
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

<!-- ============================================== -->
<!-- rem:functionalRequirement template             -->
<!-- ============================================== -->

<xsl:template match="rem:functionalRequirement">
    <div id="{@oid}">
        <table class="functional_requirement remus_table">
            <xsl:call-template name="generate_expanded_header"/>

            <xsl:call-template name="generate_markdown_row">
                <xsl:with-param name="label"   select="$rem:lang_description"/>
                <xsl:with-param name="prefix"  select="$rem:lang_the_system_shall"/>
                <xsl:with-param name="content" select="rem:description"/>
                <xsl:with-param name="postfix" select="'.'"/>
                <xsl:with-param name="mode"    select="'paragraph'"/>
            </xsl:call-template>

            <xsl:call-template name="generate_priority_rows"/>
            <xsl:call-template name="generate_comments_row"/>
        </table>
    </div>
</xsl:template>

</xsl:stylesheet>

