<?xml version="1.0" encoding="iso-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_text.xsl                                 -->
<!-- Content : REM stylesheet for RE subject - text           -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2021/01/06                                     -->
<!-- Version : 3.1                                            -->
<!-- ======================================================== -->

<!-- ======================================================== -->
<!-- exclude-result-prefixes="rem" must be set in all files   -->
<!-- to avoid xmlsn:rem="..." to appear in HTML tags.         -->
<!-- ======================================================== -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    exclude-result-prefixes="rem msxsl"
>

<!-- ======================================================== -->
<!-- Version 3.1                                              -->
<!-- Markdown to HTML transformation performed in XSLT using  -->
<!-- msxsl:script with showdown 1.0.2. It is much faster than -->
<!-- doing it in the browser.                                 -->
<!-- ======================================================== -->

<!-- ======================================================== -->
<!--  IE 7 supports these element properties:                 -->
<!--      innerHTML                                           -->
<!--      innerText                                           -->
<!--      outerText                                           -->
<!--  but not these other element properties:                 -->
<!--      nodeValue                                           -->
<!--      textContent                                         -->
<!-- ======================================================== -->

<!-- ======================================================== -->
<!-- markdown templates                                       -->
<!-- ======================================================== -->

<!--
In order to allow markdown code in the text of some REMUS objetcs,
and to avoid the double blank line effect of MSXML3 because of the
CRLF codes, the content of rem:text and other object fields in
"markdown" mode is generated as follows:

1. text()
Get rid of the CRLF characters that are responsible for the double-blank
line effect that spoil markdown code when generating HTML.

2. <br/> inserted automatically by REMUS
Change <br/> for rem:CRLF_tag, that will be replaced by \n in Javascript,
generating correct markdown code without double blank lines.

3. rem:ref
Since [link_text](link) in markdown does not support a title attribute,
ref:ref is generated as a link with a title attribute, as in the default
stylesheet. Fortunately, showdown accepts <a> elements inside markdown code.
-->

<!-- ======================================================== -->
<!-- generate_markdown template                               -->
<!--                                                          -->
<!-- This template must be called with the parent node as the -->
<!-- current node in order to access the @oid attribute.      -->
<!-- Note that prefix and postfix are processed as markdown   -->
<!-- using msxsl:node-set($prefix).                           -->
<!-- ======================================================== -->

<!-- oid param is added for those situations in which more than -->
<!-- one markdown text must be generated for elements with the  -->
<!-- same local-name() under the same ancestor.                 -->
<!-- This is the case in rem:operationException                 -->

<xsl:template name="generate_markdown">
    <xsl:param name="oid" select="@oid"/>
    <xsl:param name="node" />
    <xsl:param name="node_class" />
    <xsl:param name="prefix"  />
    <xsl:param name="space_after_prefix" select="true()"/>
    <xsl:param name="postfix" />
    <xsl:param name="space_before_postfix" select="false()"/>
    <xsl:param name="mode" select="'inline'"/>

    <xsl:variable name="_id" select="concat($oid,'-',local-name($node))"/>
    <xsl:variable name="prefix_space" select="rem:bool2space($space_after_prefix)"/>
    <xsl:variable name="postfix_space" select="rem:bool2space($space_before_postfix)"/>

    <xsl:variable name="processed_prefix">
        <xsl:apply-templates select="msxsl:node-set($prefix)" mode="markdown"/>
    </xsl:variable>

    <xsl:variable name="processed_postfix">
        <xsl:apply-templates select="msxsl:node-set($postfix)" mode="markdown"/>
    </xsl:variable>

    <!-- Use normalize-space for prefix/postfix to avoid the 4 initial  -->
    <!-- spaces that make showdown treat the prefix as source code.     -->
    <xsl:variable name="md_text">
        <xsl:if test="$prefix">
            <xsl:copy-of select="$processed_prefix"/>
            <xsl:value-of select="$prefix_space"/>
        </xsl:if>
        <xsl:apply-templates select="$node" mode="markdown"/>
        <xsl:if test="$postfix">
            <xsl:value-of select="$postfix_space"/>
            <xsl:copy-of select="$processed_postfix"/>
        </xsl:if>
    </xsl:variable>

    <!-- md_text = <xsl:value-of select="$md_text"/> -->

    <!-- WARNING: string() only returns text, not element tags, i.e. must use &lt; and &gt; for elements -->
    <xsl:choose>
        <xsl:when test="$mode = 'inline'">
            <span id="{$_id}-html" class="{$node_class}">
                <xsl:value-of disable-output-escaping="yes" select="rem:makeHtml(string($md_text),true)"/>
            </span>
        </xsl:when>
        <xsl:otherwise>
            <!-- NODE CLASS HERE -->
            <!-- using xsl:if test="$node_class" and xsl:attribute messes all up -->
            <div id="{$_id}-html" class="{$node_class}">
                <xsl:value-of disable-output-escaping="yes" select="rem:makeHtml(string($md_text))"/>
            </div>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- ======================================================== -->
<!-- text() template in "markdown" mode                       -->
<!-- ======================================================== -->

<!-- markdown text is copied without CRLF to avoid double     -->
<!-- blank lines in HTML. Actual CRLFs have been previously   -->
<!-- replaced by <br/> by REMUS.                              -->

<xsl:template match="text()" mode="markdown"><xsl:value-of select="translate(.,'&#13;&#10;','')"/></xsl:template>

<!-- ======================================================== -->
<!-- br template in "markdown" mode                           -->
<!-- ======================================================== -->

<!-- <br/>s inserted by REMUS are replaced by rem:CRLF_tag    -->
<!-- that will be replaced in Javascript by '\n', which does  -->
<!-- not generate double blank lines.                         -->

<xsl:template match="br" mode="markdown"><xsl:value-of select="$rem:CRLF_tag"/></xsl:template>

<!-- ======================================================== -->
<!-- rem:ref template in "markdown" mode                      -->
<!-- ======================================================== -->

<!-- title attributes cannot be specified in markdown links, -->
<!-- but showdonw accepts HTML <a> tags inside markdown text -->
<!--
<xsl:template match="rem:paragraph/rem:text/rem:ref" mode="markdown">
    [<xsl:value-of select="."/>](#<xsl:value-of select="@oid"/>)
</xsl:template>
-->

<!-- title attribute is set in Javascript using jQuery and class "rem_ref" -->
<!-- WARNING: string() only returns text, not element tags, i.e. must use &lt; and &gt; for elements -->
<xsl:template match="rem:ref" mode="markdown">&lt;a href='#<xsl:value-of select="@oid"/>' class="rem_ref"&gt;<xsl:value-of select="."/>&lt;/a&gt;</xsl:template>

<!-- ======================================================== -->
<!-- rem:tbd templates in ordinary and "markdown" modes       -->
<!-- ======================================================== -->

<!-- TODO: ¿necesario en modo normal? Sí, para las multiplicidades -->
<xsl:template match="rem:tbd">
    <span class="tbd" title="{$rem:lang_TBD_expanded}"><xsl:value-of select="$rem:lang_TBD"/></span>
</xsl:template>

<!-- WARNING: string() only returns text, not element tags, i.e. must use &lt; and &gt; for elements -->
<xsl:template match="rem:tbd" mode="markdown">&lt;span class="tbd" title='<xsl:value-of select="$rem:lang_TBD_expanded"/>'&gt;<xsl:value-of select="$rem:lang_TBD"/>&lt;/span&gt;</xsl:template>

<!-- ======================================================== -->
<!-- <span> template in "markdown" mode                       -->
<!-- ======================================================== -->

<!-- TODO: ¿necesario? -->

<!-- <span> is not generated by REMUS but by some XSLT        -->
<!-- transformations and must be copied as is.                -->

<xsl:template match="span" mode="markdown">
    <xsl:copy-of select="."/>
</xsl:template>

<!-- ======================================================== -->
<!-- a template in "markdown" mode                            -->
<!-- ======================================================== -->

<!-- TODO: ¿necesario? -->

<!-- <a> is not generated by REMUS but by some XSLT           -->
<!-- transformations and must be copied as is.                -->

<xsl:template match="a" mode="markdown">
    <xsl:copy-of select="."/>
</xsl:template>

<!-- ======================================================== -->
<!-- rem:name                                                 -->
<!-- ======================================================== -->

<!-- Although it the DTD, rem:name can have rem:ref, rem:tbd  -->
<!-- and <br/> as children, REM 1.2.2 and REMUS (REM 1.3)     -->
<!-- only generate text. Nevertheless, "." returns only text. -->

<!-- REM 1.2.2 generates rem:name with a newline before text  -->
<!-- and make browsers go crazy about HTML tree structure.    -->
<!-- normalize-space fixes that.                              -->
<!-- This is fixed in REMUS (REM 1.3).                        -->

<xsl:template match="rem:name"><xsl:value-of select="normalize-space(.)"/></xsl:template>

</xsl:stylesheet>