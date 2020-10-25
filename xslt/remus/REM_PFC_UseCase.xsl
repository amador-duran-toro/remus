<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =================================================== -->
<!-- File    : REM_PFC_UseCase.xsl                       -->
<!-- Content : Hoja de estilo para documentación de PFCs -->
<!-- Author  : Amador Durán Toro                         -->
<!-- Date    : 2005/07/19                                -->
<!-- Version : 1.1                                       -->
<!-- =================================================== -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    version="1.0">

<!-- ============================================== -->
<!-- rem:useCase template                           -->
<!-- ============================================== -->

<!-- Note the use of colspan=2 -->

<xsl:template match="rem:useCase">

    <table id="{@oid}" border="1" width="100%">    
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
    
        <xsl:if test="rem:step">
          <tr>
      			<th align="left" valign="top">
				      <xsl:attribute name="rowspan">
							  <xsl:value-of select="count(rem:step) + 1"/>
						  </xsl:attribute>
    				  <xsl:value-of select="$rem:lang_ordinary_sequence"/>
            </th>
            
            <th align="center" valign="top">
                <xsl:value-of select="$rem:lang_step"/>
            </th>
            
            <th align="left" valign="top" width="100%">
                <xsl:value-of select="$rem:lang_action"/>
            </th>
          </tr>

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
						  </td>
					  </tr>
				  </xsl:for-each>
        </xsl:if>    

        <!-- postcondition -->

        <xsl:call-template name="GenerateRow"> 
          <xsl:with-param name="title">
				    <xsl:value-of select="$rem:lang_postcondition"/>
			    </xsl:with-param> 
          <xsl:with-param name="node" select="rem:postcondition"/> 
          <xsl:with-param name="span">2</xsl:with-param>                        
        </xsl:call-template> 

        <!-- exceptions -->
     
        <xsl:if test="rem:step/rem:stepException">

          <tr>
	      		<th align="left" valign="top">
  						<xsl:attribute name="rowspan">
							  <xsl:value-of select="count(rem:step/rem:stepException) + 1"/>
						  </xsl:attribute>
      				<xsl:value-of select="$rem:lang_exceptions"/>
            </th>
            
      			<th align="center" valign="top">
			      	<xsl:value-of select="$rem:lang_step"/>
      			</th>
            
			      <th align="left" valign="top" width="100%">
      				<xsl:value-of select="$rem:lang_action"/>
      			</th>
          </tr>

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
                <xsl:text> </xsl:text>
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

          </xsl:if>

        <!-- performance -->

        <xsl:if test="rem:step/rem:systemAction/rem:performance">
        
        <tr>
			    <th align="left" valign="top">
            <xsl:attribute name="rowspan">
						  <xsl:value-of select="count(rem:step/rem:systemAction/rem:performance) + 1"/>
						</xsl:attribute>
			      <xsl:value-of select="$rem:lang_performance"/>
          </th>

          <th align="center" valign="top">
    				<xsl:value-of select="$rem:lang_step"/>
		    	</th>

          <th align="left" valign="top" width="100%">
				    <xsl:value-of select="$rem:lang_maximum_time"/>
    			</th>
       </tr>

       <xsl:for-each select="rem:step/rem:systemAction/rem:performance">
          <xsl:sort select="../../rem:number" data-type="number"/>
          <xsl:apply-templates select="."/>
       </xsl:for-each>

       </xsl:if>
       
        <!-- expected frequency -->

       <xsl:if test="not(rem:frequency/rem:tbd)">

          <tr>
			      <th align="left" valign="top">
    				  <xsl:value-of select="$rem:lang_expected_frequency"/>
		      	</th>

		  			<td colspan="2">
  						<xsl:value-of select="rem:frequency/rem:value"/> 
	  					<xsl:value-of select="$rem:lang_times_per"/><xsl:text> </xsl:text>
  						<xsl:value-of select="id(rem:frequency/rem:timeUnit/@value)/rem:name"/>                 
      			</td>
      		</tr>
        </xsl:if>

        <xsl:call-template name="C_Requirement_Bottom">
            <xsl:with-param name="span">2</xsl:with-param>                        
        </xsl:call-template>

    </table>
    <p><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</p>
	
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
			<xsl:value-of select="id(rem:timeUnit/@value)/rem:name"/>
        </td>
    </tr>
</xsl:template>

<!-- ============================================== -->
<!-- rem:useCase/rem:name templates                 -->
<!-- ============================================== -->

<xsl:template match="rem:useCase/rem:name">
    <tr class="useCase">
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
