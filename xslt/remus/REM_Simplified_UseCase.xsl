<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_Simplified_UseCase.xsl        -->
<!-- Author  : Amador Duran Toro                 -->
<!-- Date    : 2002/10/20                        -->
<!-- Version : 1.0                               -->
<!-- =========================================== -->

<!-- Simplified stylesheet for UseCases        -->
<!-- Last update : 2002/05/29                  -->
<!-- Namespace URI has changed                 -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================================== -->
<!-- rem:useCase template                           -->
<!-- ============================================== -->

<!-- Note the use of colspan=2 -->

<xsl:template match="rem:useCase">
    <xsl:call-template name="GenerateAnchor"/>

    <table border="1" width="100%">
        <xsl:call-template name="C_Requirement_Top">
            <xsl:with-param name="span">2</xsl:with-param>
        </xsl:call-template>

        <!-- description -->

        <tr>
            <th align="left" valign="top">
                <xsl:value-of select="$rem:lang_description"/>
            </th>
            <td colspan="2">
                <xsl:value-of select="$rem:lang_uc_lp_01"/>

                <xsl:choose>

                    <!-- abstract use case -->
                    <xsl:when test="rem:isAbstract">
                        <xsl:value-of select="$rem:lang_uc_lp_02"/>
                        <xsl:choose>
                            <xsl:when test="//rem:useCaseAction[@useCase=current()/@oid]">
                                <xsl:call-template name="GenerateUsedBy"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <font color="red">?</font>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                    <!-- concrete use case -->
                    <xsl:otherwise>
                        <xsl:value-of select="$rem:lang_uc_lp_03"/>
                        <em>
                            <xsl:apply-templates select="rem:triggeringEvent"/>
                        </em>
                        <xsl:if test="//rem:useCaseAction[@useCase=current()/@oid]">
                            <xsl:value-of select="$rem:lang_uc_lp_04"/>
                            <xsl:call-template name="GenerateUsedBy"/>
                        </xsl:if>
                    </xsl:otherwise>

                </xsl:choose>
            </td>
        </tr>

        <!-- precondition -->

        <xsl:call-template name="GenerateRow">
            <xsl:with-param name="title">
                <xsl:value-of select="$rem:lang_precondition"/>
            </xsl:with-param>
            <xsl:with-param name="node" select="rem:precondition"/>
            <xsl:with-param name="span">2</xsl:with-param>
        </xsl:call-template>

        <!-- steps -->

        <tr>
            <th align="left" valign="top">

                <xsl:choose>
                    <xsl:when test="not(rem:step)">
                        <xsl:attribute name="rowspan">2</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="count(rem:step) + 1"/>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:value-of select="$rem:lang_ordinary_sequence"/>
            </th>

            <th align="center" valign="top">
                <xsl:value-of select="$rem:lang_step"/>
            </th>

            <th align="left" valign="top" width="100%">
                <xsl:value-of select="$rem:lang_action"/>
            </th>
        </tr>

        <xsl:choose>
            <xsl:when test="not(rem:step)">
                <tr>
                    <td align="center" valign="top">
                        -
                    </td>
                    <td>
                        -
                    </td>
                </tr>
            </xsl:when>

            <xsl:otherwise>
                <xsl:for-each select="rem:step">
                    <xsl:sort select="rem:number" data-type="number"/>
                    <tr>
                        <xsl:call-template name="GenerateAnchor"/>
                        <td align="center" valign="top">
                            <xsl:value-of select="rem:number"/>
                        </td>
                        <td>
                            <xsl:if test="rem:condition">
                                <xsl:value-of select="$rem:lang_if"/>
                                <em>
                                    <xsl:apply-templates select="rem:condition"/>,
                                </em>
                            </xsl:if>
                            <xsl:apply-templates select="rem:systemAction|rem:actorAction|rem:useCaseAction"/>
                            <xsl:if test="(normalize-space(rem:comments) != $rem:lang_none) and string-length(normalize-space(rem:comments)) > 0">
                                (<em><xsl:apply-templates select="rem:comments"/></em>)
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
            </xsl:otherwise>

        </xsl:choose>

        <!-- postcondition -->

        <xsl:call-template name="GenerateRow">
            <xsl:with-param name="title">
                <xsl:value-of select="$rem:lang_postcondition"/>
            </xsl:with-param>
            <xsl:with-param name="node" select="rem:postcondition"/>
            <xsl:with-param name="span">2</xsl:with-param>
        </xsl:call-template>

        <!-- exceptions -->

        <tr>
            <th align="left" valign="top">
                <xsl:choose>
                    <xsl:when test="not(rem:step/rem:stepException)">
                        <xsl:attribute name="rowspan">
                            2
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="count(rem:step/rem:stepException) + 1"/>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="$rem:lang_exceptions"/>
            </th>

            <th align="center" valign="top">
                <xsl:value-of select="$rem:lang_step"/>
            </th>

            <th align="left" valign="top" width="100%">
                <xsl:value-of select="$rem:lang_action"/>
            </th>
        </tr>

        <xsl:choose>

            <xsl:when test="not(rem:step/rem:stepException)">
                <tr>
                    <td align="center" valign="top">
                        -
                    </td>
                    <td>
                        -
                    </td>
                </tr>
            </xsl:when>

            <xsl:otherwise>
                <xsl:for-each select="rem:step/rem:stepException">
                    <xsl:sort select="../rem:number" data-type="number"/>
                    <tr>
                        <xsl:call-template name="GenerateAnchor"/>
                        <td align="center" valign="top">
                            <xsl:value-of select="../rem:number"/>
                        </td>
                        <td>
                            <xsl:value-of select="$rem:lang_if"/>
                            <em>
                                <xsl:apply-templates select="rem:condition"/>,
                            </em>
                            <xsl:apply-templates select="rem:systemAction|rem:actorAction|rem:useCaseAction"/>,
                            <xsl:value-of select="$rem:lang_then_this_use_case"/>
                            &#32;
                            <em>
                                <xsl:choose>
                                    <xsl:when test="rem:termination/@value">
                                        <xsl:apply-templates select="id(rem:termination/@value)/rem:name"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="rem:termination/rem:tbd"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </em>
                        </td>
                    </tr>
                </xsl:for-each>
            </xsl:otherwise>

        </xsl:choose>

        <!-- performance -->

        <tr>
            <th align="left" valign="top">
                <xsl:choose>
                    <xsl:when test="not(rem:step/rem:systemAction/rem:performance)">
                        <xsl:attribute name="rowspan">
                            2
                        </xsl:attribute>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="count(rem:step/rem:systemAction/rem:performance) + 1"/>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="$rem:lang_performance"/>
            </th>

            <th align="center" valign="top">
                <xsl:value-of select="$rem:lang_step"/>
            </th>

            <th align="left" valign="top" width="100%">
                <xsl:value-of select="$rem:lang_maximum_time"/>
            </th>
        </tr>

        <xsl:choose>
            <xsl:when test="not(rem:step/rem:systemAction/rem:performance)">
                <tr>
                    <td align="center" valign="top">
                        -
                    </td>
                    <td>
                        -
                    </td>
                </tr>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="rem:step/rem:systemAction/rem:performance">
                <xsl:sort select="../../rem:number" data-type="number"/>
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>

        <!-- expected frequency -->

        <tr>
            <th align="left" valign="top">
                <xsl:value-of select="$rem:lang_expected_frequency"/>
            </th>

            <td colspan="2">
                <xsl:choose>
                    <xsl:when test="rem:frequency/rem:tbd">
                        <xsl:apply-templates select="rem:frequency/rem:tbd"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="rem:frequency/rem:value"/>
                        <xsl:value-of select="$rem:lang_times_per"/>
                        &#32;
                        <xsl:value-of select="id(rem:frequency/rem:timeUnit/@value)/rem:name"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>

        <xsl:call-template name="C_Requirement_Bottom">
            <xsl:with-param name="span">2</xsl:with-param>
        </xsl:call-template>

    </table>
    <p/>
</xsl:template>

<!-- ============================================== -->
<!-- rem:action templates                           -->
<!-- ============================================== -->

<xsl:template match="rem:step/rem:systemAction">
    <xsl:choose>
        <xsl:when test="not(../rem:condition)">
            <xsl:value-of select="$rem:lang_The"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$rem:lang_the"/>
        </xsl:otherwise>
    </xsl:choose>
    &#32;
    <xsl:value-of select="$rem:lang_system"/>
    <em>
        <xsl:apply-templates select="rem:description"/>
    </em>
</xsl:template>

<xsl:template match="rem:stepException/rem:systemAction">
    <xsl:value-of select="$rem:lang_the"/>
    &#32;
    <xsl:value-of select="$rem:lang_system"/>
    <em>
        <xsl:apply-templates select="rem:description"/>
    </em>
</xsl:template>

<xsl:template match="rem:actorAction">
    <xsl:choose>
        <xsl:when test="not(../rem:condition)">
            <xsl:value-of select="$rem:lang_The_actor"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$rem:lang_the_actor"/>
        </xsl:otherwise>
    </xsl:choose>

    <a>
        <xsl:attribute name="href">
            #<xsl:value-of select="@actor"/>
        </xsl:attribute>
        <xsl:value-of select="id(@actor)/rem:name"/>
        (<xsl:value-of select="@actor"/>)
    </a>

    <em>
        <xsl:apply-templates select="rem:description"/>
    </em>
</xsl:template>

<xsl:template match="rem:stepException/rem:actorAction">
    <xsl:value-of select="$rem:lang_the_actor"/>
    <a>
        <xsl:attribute name="href">
            #<xsl:value-of select="@actor"/>
        </xsl:attribute>
        <xsl:value-of select="id(@actor)/rem:name"/>
        (<xsl:value-of select="@actor"/>)
    </a>
    <em>
        <xsl:apply-templates select="rem:description"/>
    </em>
</xsl:template>

<xsl:template match="rem:useCaseAction">
    <xsl:choose>
        <xsl:when test="not(../rem:condition)">
            <xsl:value-of select="$rem:lang_uc_lp_05"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$rem:lang_uc_lp_06"/>
        </xsl:otherwise>
    </xsl:choose>
    <a>
        <xsl:attribute name="href">
            #<xsl:value-of select="@useCase"/>
        </xsl:attribute>
        <xsl:value-of select="id(@useCase)/rem:name"/>
        (<xsl:value-of select="@useCase"/>)
    </a>
    <xsl:value-of select="$rem:lang_uc_lp_07"/>
</xsl:template>

<xsl:template match="rem:stepException/rem:useCaseAction">
    <xsl:value-of select="$rem:lang_uc_lp_06"/>
    <a>
        <xsl:attribute name="href">
            #<xsl:value-of select="@useCase"/>
        </xsl:attribute>
        <xsl:value-of select="id(@useCase)/rem:name"/>
        (<xsl:value-of select="@useCase"/>)
    </a>
    <xsl:value-of select="$rem:lang_uc_lp_07"/>
</xsl:template>

<!-- ============================================== -->
<!-- rem:performance template                       -->
<!-- ============================================== -->

<xsl:template match="rem:step/rem:systemAction/rem:performance">
    <tr>
        <td align="center" valign="top">
            <xsl:value-of select="../../rem:number"/>
        </td>
        <td>
            <xsl:value-of select="rem:value"/>
            &#32;
            <xsl:value-of select="id(rem:timeunit/@value)/rem:name"/>
        </td>
    </tr>
</xsl:template>

<!-- ============================================== -->
<!-- rem:useCase/rem:name templates                 -->
<!-- ============================================== -->

<xsl:template match="rem:useCase/rem:name">
    <tr bgcolor="#c0c0c0">
        <th align="left" valign="top">
            <xsl:value-of select="../@oid"/>
        </th>
        <th align="left" valign="top" width="100%" colspan="2">
            <xsl:apply-templates/>
        </th>
    </tr>
</xsl:template>

<!-- ============================================== -->
<!-- rem:useCase/rem:version templates              -->
<!-- ============================================== -->

<xsl:template match="rem:useCase/rem:version">
    <tr>
        <th align="left" valign="top">
            <xsl:value-of select="$rem:lang_version"/>
        </th>
        <td align="left" valign="top" colspan="2">
            <xsl:value-of select="rem:major"/>.<xsl:value-of select="rem:minor"/>
            ( <xsl:apply-templates select="rem:date"/> )
        </td>
    </tr>
</xsl:template>

<!-- ============================================== -->
<!-- GenerateUsedBy template                        -->
<!-- ============================================== -->

<xsl:template name="GenerateUsedBy">
    <xsl:for-each select="//rem:useCase[.//rem:useCaseAction[@useCase=current()/@oid]]">
        <xsl:sort select="@oid"/>
        <a>
            <xsl:attribute name="href">
                #<xsl:value-of select="@oid"/>
            </xsl:attribute>
           [<xsl:value-of select="@oid"/>]
           <xsl:value-of select="rem:name"/>
        </a><xsl:if test="not(position()=last())">, </xsl:if>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
