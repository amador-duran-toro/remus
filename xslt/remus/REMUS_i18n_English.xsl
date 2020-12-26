<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ========================================================= -->
<!-- File    : REMUS_i18n_English.xsl                          -->
<!-- Content : REM XSLT for subjects at US - English i18n file -->
<!-- Author  : Amador Durán Toro                               -->
<!-- Date    : 2020/07/26                                      -->
<!-- Version : 3.0                                             -->
<!-- ========================================================= -->

<!-- ======================================================== -->
<!-- exclude-result-prefixes="rem" must be set in all files   -->
<!-- to avoid xmlsn:rem="..." to appear in HTML tags.         -->
<!-- ======================================================== -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rem="http://rem.lsi.us.es"
    exclude-result-prefixes="rem"
>

<!-- Same as default in REM 1.2.2 -->
<xsl:variable name="rem:lang_action">Action</xsl:variable>
<xsl:variable name="rem:lang_address">Address</xsl:variable>
<xsl:variable name="rem:lang_alternative">Alternative</xsl:variable>
<xsl:variable name="rem:lang_analysis">Analysis</xsl:variable>
<xsl:variable name="rem:lang_attenders">Attenders</xsl:variable>
<xsl:variable name="rem:lang_attribute">Attribute</xsl:variable>
<xsl:variable name="rem:lang_authors">Authors</xsl:variable>
<xsl:variable name="rem:lang_average">Average</xsl:variable>
<xsl:variable name="rem:lang_comments">Comments</xsl:variable>
<xsl:variable name="rem:lang_components">Components</xsl:variable>
<xsl:variable name="rem:lang_condition">Condition</xsl:variable>
<xsl:variable name="rem:lang_constant_attribute">Constant attribute</xsl:variable>
<xsl:variable name="rem:lang_constant_role">Constant rol</xsl:variable>
<xsl:variable name="rem:lang_date">Date</xsl:variable>
<xsl:variable name="rem:lang_definition">Definition</xsl:variable>
<xsl:variable name="rem:lang_dependencies">Dependencies</xsl:variable>
<xsl:variable name="rem:lang_derived_attribute">Derived attribute</xsl:variable>
<xsl:variable name="rem:lang_derived_role">Derived role</xsl:variable>
<xsl:variable name="rem:lang_description">Description</xsl:variable>
<xsl:variable name="rem:lang_directly_affected_objects">Directly affects</xsl:variable>
<xsl:variable name="rem:lang_disjoint_subtypes">Subtypes (disjoint)</xsl:variable>
<xsl:variable name="rem:lang_exception">Exception</xsl:variable>
<xsl:variable name="rem:lang_exceptions">Exceptions</xsl:variable>
<xsl:variable name="rem:lang_expected_frequency">Expected frequency</xsl:variable>
<xsl:variable name="rem:lang_expression">Expression</xsl:variable>
<xsl:variable name="rem:lang_fax">Fax</xsl:variable>
<xsl:variable name="rem:lang_figure">Figure</xsl:variable>
<xsl:variable name="rem:lang_freelance">Freelance</xsl:variable>
<xsl:variable name="rem:lang_if">If</xsl:variable>
<xsl:variable name="rem:lang_indirectly_affected_objects">Indirectly affects</xsl:variable>
<xsl:variable name="rem:lang_invariant">Invariant expression</xsl:variable>
<xsl:variable name="rem:lang_importance">Importance</xsl:variable>
<xsl:variable name="rem:lang_initialValue">Initial value</xsl:variable>
<xsl:variable name="rem:lang_isCustomer">Is customer</xsl:variable>
<xsl:variable name="rem:lang_isDeveloper">Is developer</xsl:variable>
<xsl:variable name="rem:lang_isUser">Is user</xsl:variable>
<xsl:variable name="rem:lang_lifetime">Lifetime</xsl:variable>
<xsl:variable name="rem:lang_maximum">Maximum</xsl:variable>
<xsl:variable name="rem:lang_maximum_time">Maximum time</xsl:variable>
<xsl:variable name="rem:lang_meeting">Meeting</xsl:variable>
<xsl:variable name="rem:lang_multiplicity">Multiplicity</xsl:variable>
<xsl:variable name="rem:lang_name">Name</xsl:variable>
<xsl:variable name="rem:lang_no">No</xsl:variable>
<xsl:variable name="rem:lang_none">None</xsl:variable>
<xsl:variable name="rem:lang_OCL_condition">Condition (OCL)</xsl:variable>
<xsl:variable name="rem:lang_OCL_expression">OCL expression</xsl:variable>
<xsl:variable name="rem:lang_OCL_postconditions">Postcondition expressions (OCL)</xsl:variable>
<xsl:variable name="rem:lang_OCL_preconditions">Precondition expressions (OCL)</xsl:variable>
<xsl:variable name="rem:lang_ordinary_sequence">Ordinary sequence</xsl:variable>
<xsl:variable name="rem:lang_organization">Organization</xsl:variable>
<xsl:variable name="rem:lang_overlapping_subtypes">Subtypes (overlapping)</xsl:variable>
<xsl:variable name="rem:lang_parameters">Parameters</xsl:variable>
<xsl:variable name="rem:lang_performance">Performance</xsl:variable>
<xsl:variable name="rem:lang_place">Place</xsl:variable>
<xsl:variable name="rem:lang_possible_solution">Possible solution</xsl:variable>
<xsl:variable name="rem:lang_postcondition">Postcondition</xsl:variable>
<xsl:variable name="rem:lang_postconditions">Postcondition expressions</xsl:variable>
<xsl:variable name="rem:lang_precondition">Precondition</xsl:variable>
<xsl:variable name="rem:lang_preconditions">Precondition expressions</xsl:variable>
<xsl:variable name="rem:lang_prepared_by">Prepared by:</xsl:variable>
<xsl:variable name="rem:lang_prepared_for">Prepared for:</xsl:variable>
<xsl:variable name="rem:lang_project">Project</xsl:variable>
<xsl:variable name="rem:lang_related_objectives">Traced-to objectives</xsl:variable>
<xsl:variable name="rem:lang_related_requirements">Traced-to requirements</xsl:variable>
<xsl:variable name="rem:lang_result_type">Result type</xsl:variable>
<xsl:variable name="rem:lang_results">Results</xsl:variable>
<xsl:variable name="rem:lang_role">Role</xsl:variable>
<xsl:variable name="rem:lang_simultaneous_ocurrences">Simultaneous ocurrences</xsl:variable>
<xsl:variable name="rem:lang_sources">Sources</xsl:variable>
<xsl:variable name="rem:lang_specific_data">Specific data</xsl:variable>
<xsl:variable name="rem:lang_stability">Stability</xsl:variable>
<xsl:variable name="rem:lang_stakeholder">Stakeholder</xsl:variable>
<xsl:variable name="rem:lang_status">Status</xsl:variable>
<xsl:variable name="rem:lang_step">Step</xsl:variable>
<xsl:variable name="rem:lang_subobjectives">Subobjectives</xsl:variable>
<xsl:variable name="rem:lang_subtypes">Subtypes</xsl:variable>
<xsl:variable name="rem:lang_supertype">Supertype</xsl:variable>
<xsl:variable name="rem:lang_system">system</xsl:variable>
<xsl:variable name="rem:lang_TBD">TBD</xsl:variable>
<xsl:variable name="rem:lang_telephone">Telephone</xsl:variable>
<xsl:variable name="rem:lang_The">The</xsl:variable>
<xsl:variable name="rem:lang_the">the</xsl:variable>
<xsl:variable name="rem:lang_The_actor">Actor</xsl:variable>
<xsl:variable name="rem:lang_the_actor">actor</xsl:variable>
<xsl:variable name="rem:lang_then_this_use_case">then this use case</xsl:variable>
<xsl:variable name="rem:lang_time">Time</xsl:variable>
<xsl:variable name="rem:lang_times_per">times per</xsl:variable>
<xsl:variable name="rem:lang_TOC">Table of contents</xsl:variable>
<xsl:variable name="rem:lang_traceability_matrix">Traceability matrix</xsl:variable>
<xsl:variable name="rem:lang_type">Type</xsl:variable>
<xsl:variable name="rem:lang_urgency">Urgency</xsl:variable>
<xsl:variable name="rem:lang_variable_attribute">Variable attribute</xsl:variable>
<xsl:variable name="rem:lang_variable_role">Variable role</xsl:variable>
<xsl:variable name="rem:lang_version">Version</xsl:variable>
<xsl:variable name="rem:lang_yes">Yes</xsl:variable>

<!-- new in REMUS -->
<xsl:variable name="rem:lang_code_attributes">// attributes</xsl:variable>
<xsl:variable name="rem:lang_code_components">// components</xsl:variable>
<xsl:variable name="rem:lang_code_invariants">// invariants</xsl:variable>
<xsl:variable name="rem:lang_code_roles">// roles</xsl:variable>
<xsl:variable name="rem:lang_code_preconditions">// preconditions</xsl:variable>
<xsl:variable name="rem:lang_code_postconditions">// postconditions</xsl:variable>
<xsl:variable name="rem:lang_code_exception">exception</xsl:variable>
<xsl:variable name="rem:lang_code_exceptions">// exceptions</xsl:variable>

<!-- ================== -->
<!-- General L-patterns -->
<!-- ================== -->

<xsl:variable name="rem:lang_the_system_shall">The system shall</xsl:variable>
<xsl:variable name="rem:lang_TBD_expanded">To be determined</xsl:variable>

<!-- ===================== -->
<!-- L-patterns for actors -->
<!-- ===================== -->

<xsl:variable name="rem:lang_this_actor_represents">This actor represents</xsl:variable>

<!-- ======================================= -->
<!-- L-patterns for information requirements -->
<!-- ======================================= -->

<xsl:variable name="rem:lang_irq_lp_01">The system shall store the information corresponding to</xsl:variable>

<xsl:variable name="rem:lang_irq_lp_02">More specifically:</xsl:variable>

<!-- ======================================= -->
<!-- L-patterns for constraint requirements  -->
<!-- ======================================= -->

<xsl:variable name="rem:lang_crq_lp_01">The system shall be compliant with the following business rule or constraint:</xsl:variable>

<!-- ======================== -->
<!-- L-patterns for use cases -->
<!-- ======================== -->

<xsl:variable name="rem:lang_uc_lp_01">The system shall behave as described in the following</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_02">abstract use case during the performance of the following use cases:</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_03">use case when</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_04">or during the performance of the following use cases:</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_05">Use case</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_06">use case</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_07">is performed</xsl:variable>

<!-- =========================== -->
<!-- L-patterns for object types -->
<!-- =========================== -->

<xsl:variable name="rem:lang_ot_lp_01">This object type represents</xsl:variable>

<xsl:variable name="rem:lang_ot_lp_02">This abstract object type represents</xsl:variable>

<!-- ================================ -->
<!-- L-patterns for association types -->
<!-- ================================ -->

<xsl:variable name="rem:lang_at_lp_01">This association type represents the fact that</xsl:variable>

<!-- =========================== -->
<!-- L-patterns for value types  -->
<!-- =========================== -->

<xsl:variable name="rem:lang_vt_lp_01">This value type represents</xsl:variable>

<!-- ========================= -->
<!-- L-patterns for attributes -->
<!-- ========================= -->

<xsl:variable name="rem:lang_att_lp_01">This attribute represents</xsl:variable>

<!-- ==================== -->
<!-- L-patterns for roles -->
<!-- ==================== -->

<xsl:variable name="rem:lang_role_lp_01">This role represents</xsl:variable>

</xsl:stylesheet>
