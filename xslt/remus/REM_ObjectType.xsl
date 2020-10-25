<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================== -->
<!-- File    : REM_ObjectType.xsl                -->
<!-- Content : Stylesheet for Object Types       -->
<!-- Author  : Amador Duran Toro                 -->
<!-- Date    : 2001/01/30                        -->
<!-- Version : 1.2                               -->
<!-- =========================================== -->
<!-- Last update : 2002/07/14                    -->
<!-- header_background variable used             -->
<!-- =========================================== -->
<!-- Last update : 2002/05/29                    -->
<!-- Namespace URI has changed                   -->
<!-- =========================================== -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================================== -->
<!-- rem:objectType template                        -->
<!-- ============================================== -->

<xsl:template match="rem:objectType">
    <xsl:call-template name="GenerateAnchor"/>

    <table border="1" width="100%">    

        <xsl:call-template name="D_Requirement_Top">
            <xsl:with-param name="span">3</xsl:with-param>
        </xsl:call-template>

        <!-- description -->

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_description"/>
			</th>

            <td colspan="3" align="left" valign="top">
                <xsl:choose>
                    <xsl:when test="rem:isAbstract">
                        <xsl:value-of select="$rem:lang_ot_lp_02"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$rem:lang_ot_lp_01"/>
                    </xsl:otherwise>
                </xsl:choose>
				<em>
					<xsl:apply-templates select="rem:description"/>
				</em>
            </td>
        </tr>

        <!-- supertype -->

        <tr>
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_supertype"/>
			</th>

            <td colspan="3" align="left" valign="top">
				<xsl:choose>
					<xsl:when test="@supertype">
						<a>
							<xsl:attribute name="href">
								#<xsl:value-of select="@supertype"/>
							</xsl:attribute>
							[<xsl:value-of select="@supertype"/>] 
							<xsl:value-of select="id(@supertype)/rem:name"/>
						</a>                    
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$rem:lang_none"/>
					</xsl:otherwise>
				</xsl:choose>
            </td>
        </tr>

        <!-- subtypes -->

        <tr>
			<th align="left" valign="top">
				<xsl:choose>
					<xsl:when test="not(//rem:objectType[@supertype=current()/@oid])">
						<xsl:value-of select="$rem:lang_subtypes"/>
					</xsl:when>
					<xsl:when test="rem:disjointSubtypes">
						<xsl:value-of select="$rem:lang_disjoint_subtypes"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$rem:lang_overlapping_subtypes"/>
					</xsl:otherwise>
				</xsl:choose>
			</th>

            <td colspan="3" align="left" valign="top">
				<xsl:choose>
					<xsl:when test="//rem:objectType[@supertype=current()/@oid]">
						<xsl:for-each select="//rem:objectType[@supertype=current()/@oid]">
							<xsl:sort select="@oid"/>
							<li>
								<a>
									<xsl:attribute name="href">
										#<xsl:value-of select="@oid"/>
									</xsl:attribute>
									[<xsl:value-of select="@oid"/>] 
									<xsl:value-of select="rem:name"/>
								</a>
							</li>
						</xsl:for-each>
					</xsl:when>

					<xsl:otherwise>
						<xsl:value-of select="$rem:lang_none"/>
					</xsl:otherwise>
				</xsl:choose>
            </td>
        </tr>

        <!-- components -->

        <tr>
			<th align="left" valign="top">
				<xsl:choose>
					<xsl:when test="not(rem:component)">
						<xsl:attribute name="rowspan">2</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rowspan">
							<xsl:value-of select="count(rem:component) + 1"/>
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="$rem:lang_components"/>
            </th>

            <th align="left" valign="top">
				<xsl:value-of select="$rem:lang_name"/>
			</th>
            
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_type"/>
			</th>
            
			<th align="left" valign="top">
				<xsl:value-of select="$rem:lang_multiplicity"/>
			</th>
        </tr>

        <xsl:choose>
            <xsl:when test="not(rem:component)">
                <tr>
					<td align="left" valign="top">-</td>
                    <td align="left" valign="top">-</td>
                    <td align="left" valign="top">-</td>
                </tr>
            </xsl:when>
            
			<xsl:otherwise>
                <xsl:for-each select="rem:component">
                <tr>
                    <xsl:call-template name="GenerateAnchor"/>
                    <td align="left" valign="top">
                        <xsl:value-of select="rem:name"/>
                    </td>
                    <td align="left" valign="top">
                        <xsl:call-template name="GenerateType"/>
                    </td>
                    <td align="left" valign="top">
                        <xsl:choose>
                            <xsl:when test="rem:multiplicity">
                                <xsl:apply-templates select="rem:multiplicity/rem:lowerBound"/>..
                                <xsl:apply-templates select="rem:multiplicity/rem:upperBound"/>     
                            </xsl:when>
                            <xsl:otherwise>
                                1
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                </xsl:for-each>    
            </xsl:otherwise>
        </xsl:choose>

        <xsl:call-template name="D_Requirement_Bottom">
            <xsl:with-param name="span">3</xsl:with-param>
        </xsl:call-template>

    </table>

    <p/>
    
    <xsl:apply-templates select="rem:attribute"/>
    <xsl:apply-templates select="rem:invariantExpression"/>
</xsl:template>

<!-- ============================================== -->
<!-- rem:objectType/rem:name template               -->
<!-- ============================================== -->

<xsl:template match="rem:objectType/rem:name">
    <tr>
		<xsl:attribute name="bgcolor">
			<xsl:value-of select="$rem:header_background"/>
		</xsl:attribute>
        <th align="left" valign="top">
			<xsl:value-of select="../@oid"/>
		</th>
        <th align="left" valign="top" width="100%" colspan="3">
			<xsl:value-of select="."/>
		</th>
    </tr>
</xsl:template>

<!-- ============================================== -->
<!-- rem:objectType/rem:version template            -->
<!-- ============================================== -->

<xsl:template match="rem:objectType/rem:version">
    <tr>
		<th align="left" valign="top">
			<xsl:value-of select="$rem:lang_version"/>
		</th>
        <td align="left" valign="top" colspan="3">
            <xsl:value-of select="rem:major"/>.<xsl:value-of select="rem:minor"/> 
			( <xsl:apply-templates select="rem:date"/> )
        </td>
    </tr>
</xsl:template>

</xsl:stylesheet>
