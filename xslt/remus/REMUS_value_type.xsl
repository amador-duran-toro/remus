<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================================== -->
<!-- File    : REMUS_value_type.xsl                              -->
<!-- Content : REM XSLT for subjects at US - value type          -->
<!-- Author  : Amador Durán Toro                                 -->
<!-- Date    : 2020/10/05                                        -->
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
<!-- rem:userDefinedvalueType template              -->
<!-- ============================================== -->

<xsl:template match="rem:userDefinedValueType">
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
<!-- rem:userDefinedvalueType template (mode code)  -->
<!-- ============================================== -->

<xsl:template match="rem:userDefinedValueType" mode="code">
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

    <xsl:choose>
        <!-- [enum] tag as the first word in value type's name -->
        <xsl:when test="starts-with(normalize-space(rem:name), $rem:enum_tag)">
            <span class="keyword">enumerated type </span>
            <span class="class_name"><xsl:apply-templates select="rem:name" mode="enum"/></span>
            <br/>
            {

            <!--definition -->
            <xsl:if test="string-length(normalize-space(rem:definition))">
                <!-- <xsl:apply-templates select="rem:definition"/> -->
                <xsl:call-template name="generate_markdown">
                    <xsl:with-param name="node_class" select="'code_ocl'"/>
                    <xsl:with-param name="node" select="rem:definition"/>
                    <xsl:with-param name="mode" select="'paragraph'"/>
                </xsl:call-template>
            </xsl:if>

            <!-- attributes -->
            <xsl:if test="rem:attribute">
                <!-- <div class="code_comment code_header">// attributes</div> -->
                <ul class="properties">
                    <xsl:apply-templates select="rem:attribute" mode="enum"/>
                </ul>
            </xsl:if>

            <!-- invariants -->
            <xsl:if test="rem:invariantExpression">
                <!-- <br/> -->
                <!-- <div class="code_comment code_header">// invariants</div> -->
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
        </xsl:when>

        <xsl:otherwise> <!-- not an enum -->
            <span class="keyword">value type </span>
            <span class="class_name"><xsl:value-of select="rem:name"/></span>
            <br/>
            {<br/>

            <!--definition -->
            <xsl:if test="string-length(normalize-space(rem:definition))">
                <!-- <xsl:apply-templates select="rem:definition"/> -->
                <xsl:call-template name="generate_markdown">
                    <xsl:with-param name="node_class" select="'code_ocl'"/>
                    <xsl:with-param name="node" select="rem:definition"/>
                    <xsl:with-param name="mode" select="'paragraph'"/>
                </xsl:call-template>
            </xsl:if>

            <!-- attributes -->
            <xsl:if test="rem:attribute">
                <div class="code_comment code_header">// attributes</div>
                <ul class="properties">
                    <xsl:apply-templates select="rem:attribute" mode="code"/>
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
        </xsl:otherwise>
    </xsl:choose>

</xsl:template>

<!-- =========================================================== -->
<!-- rem:userDefinedvalueType/rem:attribute template (mode enum) -->
<!-- =========================================================== -->

<xsl:template match="rem:userDefinedValueType/rem:attribute" mode="enum">

    <xsl:if test="@baseType != 'PVT-0001'">
        <script>
        warnings.push({
            oid: "<xsl:value-of select="@oid"/>",
            message:'Attribute \"<xsl:apply-templates select="rem:name"/>\" of enumerated type \"<xsl:apply-templates select="../rem:name" mode="enum"/>\": attributes of enumerated types must be of type \"Enum Literal\"'
        });
        </script>
    </xsl:if>

    <li id="{@oid}" class="property">
    <xsl:if test="string-length(rem:description)">
        <xsl:call-template name="generate_markdown">
            <xsl:with-param name="prefix">/**</xsl:with-param>
            <xsl:with-param name="postfix"> */</xsl:with-param>
            <xsl:with-param name="node" select="rem:description"/>
            <xsl:with-param name="node_class" select="'code_comment'"/>
            <xsl:with-param name="mode" select="'paragraph'"/>
        </xsl:call-template>
    </xsl:if>
    <xsl:value-of select="rem:name"/>
    </li>
</xsl:template>

<!-- ====================================================== -->
<!-- rem:userDefinedvalueType/rem:name template (mode enum) -->
<!-- ====================================================== -->

<!-- to be called from generate_header template -->

<xsl:template match="rem:userDefinedValueType/rem:name">
    <xsl:choose>
        <xsl:when test="starts-with(normalize-space(.), $rem:enum_tag)">
            <xsl:apply-templates select="." mode="enum"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="."/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="rem:userDefinedValueType/rem:name" mode="enum">
    <xsl:value-of select="normalize-space(substring-after(., $rem:enum_tag))"/>
</xsl:template>

<!-- ================================================ -->
<!-- rem:userDefinedvalueType/rem:definition template -->
<!-- ================================================ -->

<!-- It does not work. Generate markdown must be called -->
<!-- with the parent node as the current node           -->

<!--
<xsl:template match="rem:userDefinedValueType/rem:definition">
    <xsl:call-template name="generate_markdown">
        <xsl:with-param name="node" select="."/>
        <xsl:with-param name="mode" select="'paragraph'"/>
    </xsl:call-template>
</xsl:template>
-->

</xsl:stylesheet>
