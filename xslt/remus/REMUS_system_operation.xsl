<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================================== -->
<!-- File    : REMUS_system_operation.xsl                        -->
<!-- Content : REM XSLT for subjects at US - system operation    -->
<!-- Author  : Amador Durán Toro                                 -->
<!-- Date    : 2020/12/25                                        -->
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
<!-- rem:systemOperation template                   -->
<!-- ============================================== -->

<xsl:template match="rem:systemOperation">
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
<!-- rem:systemOperation template (mode code)       -->
<!-- ============================================== -->

<xsl:template match="rem:systemOperation" mode="code">
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

    <xsl:variable name="operation_declaration">system operation</xsl:variable>

    <span class="keyword">
        <xsl:value-of select="$operation_declaration"/>
        <xsl:text> </xsl:text>
    </span>
    <span class="class_name">
        <xsl:apply-templates select="rem:name" mode="code"/>
    </span>

    <br/>
    {<br/>

    <!-- preconditions -->

    <xsl:if test="rem:preconditionExpression">
        <div class="code_comment code_header">// preconditions</div>
        <ul class="properties">
            <xsl:apply-templates select="rem:preconditionExpression" mode="code"/>
        </ul>
        <br/>
    </xsl:if>

    <!-- postconditions -->

    <xsl:if test="rem:postconditionExpression">
        <div class="code_comment code_header">// postconditions</div>
        <ul class="properties">
            <xsl:apply-templates select="rem:postconditionExpression" mode="code"/>
        </ul>
    </xsl:if>

    <!-- invariants -->

    <xsl:if test="rem:invariantExpression">
        <br/>
        <div class="code_comment code_header">// invariants</div>
        <ul class="properties">
            <xsl:for-each select="rem:invariantExpression">
                <li id="{@oid}" class="property">
                    <xsl:apply-templates select="." mode="code"/>
                </li>
                <xsl:if test="position() != last()">
                    <!-- <br/> -->
                </xsl:if>
            </xsl:for-each>
        </ul>
    </xsl:if>
    }
</xsl:template>

<!-- ==================================================== -->
<!-- rem:systemOperation/rem:name template                -->
<!-- ==================================================== -->

<xsl:template match="rem:systemOperation/rem:name">
   <xsl:value-of select="."/>
    <xsl:choose>
        <xsl:when test="not(../rem:parameter)">()</xsl:when>
        <xsl:otherwise>(
            <xsl:for-each select="../rem:parameter">
                <xsl:value-of select="rem:name"/>
                <xsl:if test="not(position()=last())">, </xsl:if>
            </xsl:for-each>
        )
        </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="../rem:resultType"> : <xsl:value-of select="../rem:resultType"/></xsl:if>
</xsl:template>

<xsl:template match="rem:systemOperation/rem:name" mode="code">
    <xsl:value-of select="."/>
    <!-- attributes -->
    <xsl:choose>
        <xsl:when test="not(../rem:parameter)">()</xsl:when>
        <xsl:otherwise>(<br/>
            <xsl:for-each select="../rem:parameter">
                <ul class="properties">
                    <xsl:apply-templates select="." mode="code"/>
                    <xsl:if test="not(position()=last())">, <br/></xsl:if>
                </ul>
            </xsl:for-each>
        )
        </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="../rem:resultType"> : <xsl:value-of select="../rem:resultType"/></xsl:if>
</xsl:template>


<!-- ==================================================== -->
<!-- rem:parameter template (mode code)                   -->
<!-- ==================================================== -->

<xsl:template match="rem:parameter" mode="code">
    <li id="{@oid}" class="property">
        <!-- name : type -->
        <xsl:value-of select="rem:name"/> : <xsl:choose>
            <xsl:when test="rem:isSet">Set(</xsl:when>
            <xsl:when test="rem:isSequence">Sequence(</xsl:when>
            <xsl:when test="rem:isBag">Bag(</xsl:when>
            </xsl:choose>
            <xsl:value-of select="id(@baseType)/rem:name"/>
            <xsl:if test="rem:isSet|rem:isSequence|rem:isBag">)</xsl:if>

        <!-- description -->
        <xsl:if test="string-length(rem:description)">
            <xsl:call-template name="generate_markdown">
                <xsl:with-param name="prefix">/**</xsl:with-param>
                <xsl:with-param name="postfix"> */</xsl:with-param>
                <xsl:with-param name="node" select="rem:description"/>
                <xsl:with-param name="node_class" select="'code_comment'"/>
                <xsl:with-param name="mode" select="'inline'"/>
            </xsl:call-template>
        </xsl:if>
    </li>
</xsl:template>

<!-- =========================================================================== -->
<!-- rem:preconditionExpression|rem:postconditionExpression template (mode code) -->
<!-- =========================================================================== -->

<xsl:template match="rem:preconditionExpression|rem:postconditionExpression" mode="code">
    <xsl:if test="string-length(rem:natural)">
        <xsl:call-template name="generate_markdown">
            <xsl:with-param name="prefix">/**</xsl:with-param>
            <xsl:with-param name="postfix"> */</xsl:with-param>
            <xsl:with-param name="node" select="rem:natural"/>
            <xsl:with-param name="node_class" select="'code_comment'"/>
            <xsl:with-param name="mode" select="'paragraph'"/>
        </xsl:call-template>
    </xsl:if>
    <span class="keyword"><xsl:value-of select="substring-before(local-name(),'Expression')"/> <xsl:text> </xsl:text></span>
    <xsl:value-of select="rem:name"/>:
    <xsl:if test="string-length(rem:ocl)">
        <xsl:call-template name="generate_markdown">
            <xsl:with-param name="node" select="rem:ocl"/>
            <xsl:with-param name="node_class" select="'code_ocl'"/>
            <xsl:with-param name="mode" select="'paragraph'"/>
        </xsl:call-template>
    </xsl:if>
</xsl:template>



</xsl:stylesheet>
