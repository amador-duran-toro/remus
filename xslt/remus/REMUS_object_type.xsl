<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================================== -->
<!-- File    : REMUS_object_type.xsl                             -->
<!-- Content : REM XSLT for subjects at US - object type         -->
<!-- Author  : Amador Durán Toro                                 -->
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

<!-- ============================================== -->
<!-- rem:objectType template                        -->
<!-- ============================================== -->

<xsl:template match="rem:objectType">
    <div id="{@oid}" class="object_type">
        <table class="object_type remus_table">
            <xsl:call-template name="generate_expanded_header"/>
            <tr>
                <td colspan="2">
                    <div class="code">
                        <xsl:apply-templates select="." mode="code"/>
                    </div>
                </td>
            </tr>
            <xsl:call-template name="generate_comments_row"/>
        </table>
    </div>
</xsl:template>

<!-- ============================================== -->
<!-- rem:objectType template (mode code)            -->
<!-- ============================================== -->

<xsl:template match="rem:objectType" mode="code">
    <xsl:if test="string-length(rem:description)">
        <div>
            <span class="code_comment">/**</span>
            <xsl:call-template name="generate_markdown">
                <xsl:with-param name="node" select="rem:description"/>
                <xsl:with-param name="node_class" select="'code_comment code_description'"/>
                <xsl:with-param name="mode" select="'paragraph'"/>
            </xsl:call-template>
            <span class="code_comment">*/</span>
        </div>
    </xsl:if>

    <xsl:variable name="class_declaration">
        <xsl:choose>
            <xsl:when test="rem:isAbstract">abstract class</xsl:when>
            <xsl:otherwise>class</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="css_class_declaration">
        <xsl:choose>
            <xsl:when test="rem:isAbstract">abstract</xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <!-- It does not work like this

    <xsl:choose>
        <xsl:when test="rem:isAbstract">
            <xsl:variable name="class_declaration">abstract class</xsl:variable>
            <xsl:variable name="css_class_declaration">abstract class</xsl:variable>
        </xsl:when>
        <xsl:otherwise>
            <xsl:variable name="class_declaration">class</xsl:variable>
            <xsl:variable name="css_class_declaration">class</xsl:variable>
        </xsl:otherwise>
    </xsl:choose>

    -->

    <span class="keyword {$css_class_declaration}">
        <xsl:value-of select="$class_declaration"/>
        <xsl:text> </xsl:text>
    </span>
    <span class="class_name {$css_class_declaration}">
        <xsl:value-of select="rem:name"/>
    </span>

    <!-- specializes -->

    <xsl:if test="@supertype">
        <span class="keyword {$css_class_declaration}">specializes </span>
        <span class="class_name {$css_class_declaration}">
            <a href="#{@supertype}" class="rem_ref">
                <xsl:value-of select="id(@supertype)/rem:name"/>
            </a>
        </span>
    </xsl:if>

    <!-- generalizes -->

    <xsl:variable name="overlapping" select="not(rem:disjointSubtypes)"/>

    <xsl:if test="//rem:objectType[@supertype=current()/@oid]">
        <span class="keyword {$css_class_declaration}">generalizes
            <xsl:choose>
                <xsl:when test="$overlapping">overlapping </xsl:when>
                <xsl:otherwise>disjoint </xsl:otherwise>
            </xsl:choose>
        </span>
        <xsl:for-each select="//rem:objectType[@supertype=current()/@oid]">
            <xsl:sort select="rem:name"/>
            <span class="class_name {$css_class_declaration}"><a href="#{@oid}" class="rem_ref"><xsl:value-of select="rem:name"/></a></span><xsl:if test="position() != last()">, </xsl:if>
        </xsl:for-each>
    </xsl:if>

    <br/>

    {<br/>

    <!-- attributes -->

    <xsl:if test="rem:attribute">
        <div class="code_comment code_header"><xsl:value-of select="$rem:lang_code_attributes"/></div>
        <ul class="properties">
            <xsl:apply-templates select="rem:attribute" mode="code"/>
        </ul>
    </xsl:if>

    <!-- components -->

    <xsl:if test="rem:component">
        <br/>
        <div class="code_comment code_header"><xsl:value-of select="$rem:lang_code_components"/></div>
        <ul class="properties">
            <xsl:apply-templates select="rem:component" mode="code"/>
        </ul>
    </xsl:if>

    <!-- invariants -->

    <xsl:if test="rem:invariantExpression">
        <br/>
        <div class="code_comment code_header"><xsl:value-of select="$rem:lang_code_invariants"/></div>
        <ul class="properties">
            <xsl:apply-templates select="rem:invariantExpression" mode="code"/>
        </ul>
    </xsl:if>
    }
</xsl:template>

<!-- ==================================================== -->
<!-- rem:attribute and rem:component template (mode code) -->
<!-- ==================================================== -->

<xsl:template match="rem:attribute|rem:component|rem:role" mode="code">
    <li id="{@oid}" class="property">
    <!-- TODO: the code for rem:description is common to other templates -->
    <xsl:choose>
        <xsl:when test="string-length(rem:description)">
            <xsl:call-template name="generate_markdown">
                <xsl:with-param name="prefix">/**</xsl:with-param>
                <xsl:with-param name="postfix"> */</xsl:with-param>
                <xsl:with-param name="node" select="rem:description"/>
                <xsl:with-param name="node_class" select="'code_comment'"/>
                <xsl:with-param name="mode" select="'paragraph'"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise><br/></xsl:otherwise>
    </xsl:choose>
    <span class="keyword">
        <xsl:choose>
            <xsl:when test="rem:isConstant">const </xsl:when>
            <xsl:when test="rem:isVariable">var </xsl:when>
            <xsl:when test="rem:isDerived">derived </xsl:when>
        </xsl:choose>
    </span>
    <xsl:value-of select="rem:name"/> : <xsl:choose>
            <xsl:when test="rem:isSet">Set(</xsl:when>
            <xsl:when test="rem:isSequence">Sequence(</xsl:when>
            <xsl:when test="rem:isBag">Bag(</xsl:when>
        </xsl:choose>
        <xsl:value-of select="id(@baseType)/rem:name"/>
        <xsl:if test="rem:isSet|rem:isSequence|rem:isBag">)</xsl:if>
        <xsl:if test="rem:multiplicity">
            [<xsl:apply-templates select="rem:multiplicity/rem:lowerBound"/>..<xsl:apply-templates select="rem:multiplicity/rem:upperBound"/>]</xsl:if>
    <xsl:if test="string-length(rem:expression/rem:ocl)">
        <xsl:call-template name="generate_markdown">
            <xsl:with-param name="prefix">= </xsl:with-param>
            <xsl:with-param name="node" select="rem:expression/rem:ocl"/>
            <xsl:with-param name="node_class" select="'code_ocl'"/>
        </xsl:call-template>
    </xsl:if>
    </li>
</xsl:template>

<!-- =================================== -->
<!-- rem:invariantExpression (mode code) -->
<!-- =================================== -->

<xsl:template match="rem:invariantExpression" mode="code">
    <li id="{@oid}" class="property">
        <xsl:choose>
            <xsl:when test="string-length(rem:expression/rem:natural)">
                <xsl:call-template name="generate_markdown">
                    <xsl:with-param name="prefix">/**</xsl:with-param>
                    <xsl:with-param name="postfix"> */</xsl:with-param>
                    <xsl:with-param name="node" select="rem:expression/rem:natural"/>
                    <xsl:with-param name="node_class" select="'code_comment'"/>
                    <xsl:with-param name="mode" select="'paragraph'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise><br/></xsl:otherwise>
        </xsl:choose>
        <span class="keyword">invariant </span>
        <xsl:value-of select="rem:name"/>:
        <xsl:if test="string-length(rem:expression/rem:ocl)">
            <xsl:call-template name="generate_markdown">
                <xsl:with-param name="node" select="rem:expression/rem:ocl"/>
                <xsl:with-param name="node_class" select="'code_ocl'"/>
                <xsl:with-param name="mode" select="'paragraph'"/>
            </xsl:call-template>
        </xsl:if>
    </li>
</xsl:template>

</xsl:stylesheet>
