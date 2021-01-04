<?xml version="1.0" encoding="iso-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_utilities.xsl                            -->
<!-- Content : REM XSLT for subjects at US - utilities        -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2020/04/12                                     -->
<!-- Version : 3.0                                            -->
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
<!-- toUpperCase and toLowerCase functions                    -->
<!-- bool2space function                                      -->
<!--                                                          -->
<!-- implemented using the msxml:script tag, that allows the  -->
<!-- use of Javascript functions in XSLT transformations.     -->
<!-- For a pure XSLT implementation, see:
        https://stackoverflow.com/questions/586231/how-can-i-convert-a-string-to-upper-or-lower-case-with-xslt
-->
<!-- ======================================================== -->

<msxsl:script implements-prefix="rem">
<![CDATA[
function toUpperCase(s) {
    return s.toUpperCase();
}
function toLowerCase(s) {
    return s.toLowerCase();
}
function bool2space(b) {
    return b ? ' ' : '';
}
]]>
</msxsl:script>

<!-- ============================================= -->
<!-- Global variables                              -->
<!-- ============================================= -->

<!-- ======================================================== -->
<!-- trace.gif can be codified in base64 using any converter  -->
<!-- such as https://www.base64-image.de/                     -->
<!-- ======================================================== -->

<xsl:variable name="rem:traceImage">data:image/gif;base64,R0lGODlhEAAQAPcAAAAAAIAAAACAAICAAAAAgIAAgACAgMDAwMDcwKTI8AQEBAgICAwMDBERERYWFhwcHCIiIikpKVVVVU1NTUJCQjk5OYGBgYEAAACBAIGBAAAAgYEAgQCBgTMAAGYAAJkAAMwAAAAzADMzAGYzAJkzAMwzAP8zAABmADNmAGZmAJlmAMxmAP9mAACZADOZAGaZAJmZAMyZAP+ZAADMADPMAGbMAJnMAMzMAP/MAGb/AJn/AMz/AAAAMzMAM2YAM5kAM8wAM/8AMwAzMzMzM2YzM5kzM8wzM/8zMwBmMzNmM2ZmM5lmM8xmM/9mMwCZMzOZM2aZM5mZM8yZM/+ZMwDMMzPMM2bMM5nMM8zMM//MMzP/M2b/M5n/M8z/M///MwAAZjMAZmYAZpkAZswAZv8AZgAzZjMzZmYzZpkzZswzZv8zZgBmZjNmZmZmZplmZsxmZgCZZjOZZmaZZpmZZsyZZv+ZZgDMZjPMZpnMZszMZv/MZgD/ZjP/Zpn/Zsz/Zv8AzMwA/wCZmZkzmZkAmcwAmQAAmTMzmWYAmcwzmf8AmQBmmTNmmWYzmZlmmcxmmf8zmTOZmWaZmZmZmcyZmf+ZmQDMmTPMmWbMZpnMmczMmf/MmQD/mTP/mWbMmZn/mcz/mf//mQAAzDMAmWYAzJkAzMwAzAAzmTMzzGYzzJkzzMwzzP8zzABmzDNmzGZmmZlmzMxmzP9mmQCZzDOZzGaZzJmZzMyZzP+ZzADMzDPMzGbMzJnMzMzMzP/MzAD/zDP/zGb/mZn/zMz/zP//zDMAzGYA/5kA/wAzzDMz/2Yz/5kz/8wz//8z/wBm/zNm/2ZmzJlm/8xm//9mzACZ/zOZ/2aZ/5mZ/8yZ//+Z/wDM/zPM/2bM/5nM/8zM///M/zP//2b/zJn//8z///9mZmb/Zv//ZmZm//9m/2b//8HBwV9fX3d3d4aGhpaWlsvLy7KystfX193d3ePj4+rq6vHx8fj4+P/78KCgpICAgP8AAAD/AP//AAAA//8A/wD//////yH5BAEAAAAALAAAAAAQABAABwhDAP8JHEiwoMGBhg4eNGcuoUKCDB0+/Mcw4sSKFSUWxIhRo0BrIEOKtPbQ4kSBJk+mvNhQoaGXL1dC5Njy4EiQJ3MGBAA7</xsl:variable>

<xsl:variable name="rem:infoImage">info_icon_blue_small.png</xsl:variable>

<!-- Base URL for icons -->
<xsl:variable name="rem:base_url_icons">https://cdn.jsdelivr.net/gh/amador-duran-toro/remus/assets/images/icons/</xsl:variable>

<!-- ============================================= -->
<!-- rem:pagebreak template                        -->
<!-- ============================================= -->

<!-- This is to generate a page break when printed -->
<!-- See the CSS file for the "pagebreak" class.   -->

<xsl:template name="rem:pagebreak">
    <div class="pagebreak"></div>
</xsl:template>

<!-- ============================================= -->
<!-- generate_header template                      -->
<!-- ============================================= -->

<xsl:template name="generate_header">
    <xsl:param name="label" select="local-name()"/>
    <xsl:param name="icon"  select="concat(local-name(),'.png')"/>
    <xsl:param name="postfix"/>
    <xsl:param name="span"  select="1"/>

    <thead>
        <tr>
            <th>
                <img src="{concat($rem:base_url_icons,$icon)}"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$label"/>
            </th>
            <th class="name_column" colspan="{$span}">
                <xsl:apply-templates select="rem:name"/>
                <xsl:if test="$postfix"><xsl:text> </xsl:text><xsl:value-of select="$postfix"/></xsl:if>
            </th>
        </tr>
    </thead>
</xsl:template>

<!-- ============================================= -->
<!-- generate_markdown_row template                -->
<!-- ============================================= -->

<xsl:template name="generate_markdown_row">
    <xsl:param name="oid" />
    <xsl:param name="label_class" />
    <xsl:param name="label" select="local-name()"/>
    <xsl:param name="prefix" />
    <xsl:param name="space_after_prefix" select="true()"/>
    <xsl:param name="content_class" />
    <xsl:param name="content" select="."/>
    <xsl:param name="postfix" />
    <xsl:param name="space_before_postfix" select="false()"/>
    <xsl:param name="span" select="1"/>
    <xsl:param name="mode" select="'inline'"/>

    <tr>
        <xsl:if test="$oid">
            <xsl:attribute name="id"><xsl:value-of select="$oid"/></xsl:attribute>
        </xsl:if>
        <th>
            <xsl:if test="$label_class">
                <xsl:attribute name="class">
                    <xsl:value-of select="$label_class"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="$label"/>
        </th>
        <td colspan="{$span}">
            <xsl:call-template name="generate_markdown">
                <xsl:with-param name="prefix"  select="$prefix"/>
                <xsl:with-param name="space_after_prefix" select="$space_after_prefix"/>
                <xsl:with-param name="node_class" select="$content_class"/>
                <xsl:with-param name="node"    select="$content"/>
                <xsl:with-param name="postfix" select="$postfix"/>
                <xsl:with-param name="space_before_postfix" select="$space_before_postfix"/>
                <xsl:with-param name="mode"    select="$mode"/>
            </xsl:call-template>
        </td>
    </tr>
</xsl:template>

<!-- ============================================= -->
<!-- generate_simple_row template (no markdown)    -->
<!-- ============================================= -->

<xsl:template name="generate_simple_row">
    <xsl:param name="label"     select="local-name()"/>
    <xsl:param name="content"   select="."/>
    <xsl:param name="mandatory" select="false()"/>
    <xsl:param name="span"      select="1"/>

    <xsl:variable name="nonempty_content" select="string-length(normalize-space($content)) > 0"/>

    <xsl:if test="$nonempty_content or $mandatory">
        <tr>
            <th><xsl:value-of select="$label"/></th>
            <td colspan="{$span}"><xsl:apply-templates select="$content"/></td>
        </tr>
    </xsl:if>
</xsl:template>

<!-- ============================================= -->
<!-- generate_stakeholders template                -->
<!-- ============================================= -->

<xsl:template name="generate_stakeholders">
    <xsl:param name="label"     select="local-name()"/>
    <xsl:param name="content"   select="."/>
    <xsl:param name="mandatory" select="false()"/>
    <xsl:param name="span">1</xsl:param>

    <xsl:if test="$content or $mandatory">
        <tr>
            <th><xsl:value-of select="$label"/></th>
            <td colspan="{$span}">
                <xsl:choose>
                    <xsl:when test="not($content)">
                        <span class="tbd"><xsl:value-of select="$rem:lang_TBD"/></span>
                    </xsl:when>
                    <xsl:otherwise>
                        <ul class="stakeholders">
                            <xsl:for-each select="id($content/@stakeholders)">
                                <xsl:sort select="rem:name"/>
                                <li>
                                    <a href="#{@oid}"><xsl:value-of select="rem:name"/></a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
       </tr>
    </xsl:if>
</xsl:template>

<!-- ============================================= -->
<!-- generate_directly_affected_objects template   -->
<!-- ============================================= -->

<xsl:template name="generate_directly_affected_objects">
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
</xsl:template>

<!-- ============================================= -->
<!-- generate_indirectly_affected_objects template -->
<!-- ============================================= -->

<xsl:template name="generate_indirectly_affected_objects">
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
</xsl:template>

<!-- ============================== -->
<!-- generate_alternatives template -->
<!-- ============================== -->

<xsl:template name="generate_alternatives">
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
</xsl:template>

<!-- ============================================= -->
<!-- generate_comments_row template                    -->
<!-- ============================================= -->

<!-- TODO: ¿Mostrar sólo si es distinto de "Ningno" y no vacío? -->

<xsl:template name="generate_comments_row">
    <xsl:param name="span" select="1"/>

    <xsl:call-template name="generate_markdown_row">
        <xsl:with-param name="label"   select="$rem:lang_comments"/>
        <xsl:with-param name="content" select="rem:comments"/>
        <xsl:with-param name="content_class" select="'remus_comments'"/>
        <xsl:with-param name="mode"    select="'paragraph'"/>
        <xsl:with-param name="span"    select="$span"/>
    </xsl:call-template>
</xsl:template>

<!-- ============================================= -->
<!-- generate_expanded_header template             -->
<!-- ============================================= -->

<xsl:template name="generate_expanded_header">
    <xsl:param name="postfix"/>
    <xsl:param name="span" select="1"/>

    <xsl:call-template name="generate_header">
        <xsl:with-param name="label"   select="@oid"/>
        <xsl:with-param name="postfix" select="$postfix"/>
        <xsl:with-param name="span"    select="$span"/>
    </xsl:call-template>

    <xsl:call-template name="generate_simple_row">
        <xsl:with-param name="label"   select="$rem:lang_version"/>
        <xsl:with-param name="content" select="rem:version"/>
        <xsl:with-param name="span"    select="$span"/>
    </xsl:call-template>

    <xsl:call-template name="generate_stakeholders">
        <xsl:with-param name="label"   select="$rem:lang_authors"/>
        <xsl:with-param name="content" select="rem:authors"/>
        <xsl:with-param name="span"    select="$span"/>
    </xsl:call-template>

    <xsl:call-template name="generate_stakeholders">
        <xsl:with-param name="label"   select="$rem:lang_sources"/>
        <xsl:with-param name="content" select="rem:sources"/>
        <xsl:with-param name="span"    select="$span"/>
    </xsl:call-template>

</xsl:template>

<!-- ============================================= -->
<!-- generate_priority_rows template               -->
<!-- ============================================= -->

<xsl:template name="generate_priority_rows">
    <xsl:param name="span" select="1"/>

    <xsl:call-template name="generate_simple_row">
        <xsl:with-param name="label"   select="$rem:lang_importance"/>
        <xsl:with-param name="content" select="id(rem:importance/@value)/rem:name"/>
        <xsl:with-param name="span"    select="$span"/>
    </xsl:call-template>

    <xsl:call-template name="generate_simple_row">
        <xsl:with-param name="label"   select="$rem:lang_urgency"/>
        <xsl:with-param name="content" select="id(rem:urgency/@value)/rem:name"/>
        <xsl:with-param name="span"    select="$span"/>
    </xsl:call-template>

    <xsl:call-template name="generate_simple_row">
        <xsl:with-param name="label"   select="$rem:lang_status"/>
        <xsl:with-param name="content" select="id(rem:status/@value)/rem:name"/>
        <xsl:with-param name="span"    select="$span"/>
    </xsl:call-template>

    <xsl:call-template name="generate_simple_row">
        <xsl:with-param name="label"   select="$rem:lang_stability"/>
        <xsl:with-param name="content" select="id(rem:stability/@value)/rem:name"/>
        <xsl:with-param name="span"    select="$span"/>
    </xsl:call-template>

</xsl:template>

<!-- ============================================= -->
<!-- rem:version                                   -->
<!-- ============================================= -->

<xsl:template match="rem:version">
    <xsl:value-of select="rem:major"/>.<xsl:value-of select="rem:minor"/> (<xsl:apply-templates select="rem:date"/>)
</xsl:template>

<!-- ============================================= -->
<!-- rem:date template                             -->
<!-- ============================================= -->

<xsl:template match="rem:date">
    <xsl:value-of select="format-number(rem:day,'00')"/>/<xsl:value-of select="format-number(rem:month,'00')"/>/<xsl:value-of select="format-number(rem:year,'0000')"/>
</xsl:template>

<!-- ============================================= -->
<!-- rem:time template                             -->
<!-- ============================================= -->

<xsl:template match="rem:time">
    <xsl:value-of select="format-number(rem:hour,'00')"/>:<xsl:value-of select="format-number(rem:minute,'00')"/>
</xsl:template>

<!-- Puede que esto ya no sea necesario porque no hay que meter HTML en un atributo -->

<!-- ============================================= -->
<!-- EscapeChar template                           -->
<!-- ============================================= -->

<!--  Adapted from https://stackoverflow.com/questions/9370633/xslt-replacing-double-quotes-with-escape-sequence and        -->
<!--  https://stackoverflow.com/questions/35855412/xslt-1-0-translate-string-change-character-to-new-line/35870363#35870363 -->

<xsl:template name="EscapeChar">
    <xsl:param name="inputString" select="."/>
    <xsl:param name="charToEscape" select="string('&quot;')"/>
    <xsl:choose>
        <xsl:when test="contains($inputString, $charToEscape)">
            <xsl:variable name="pre" select="substring-before($inputString, $charToEscape)"/>
            <xsl:variable name="post" select="substring-after($inputString, $charToEscape)"/>
            <xsl:value-of select="concat( $pre, '\', $charToEscape )"/>
            <xsl:call-template name="EscapeChar">
                <xsl:with-param name="inputString" select="$post"/>
                <xsl:with-param name="charToEscape" select="$charToEscape"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$inputString"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>