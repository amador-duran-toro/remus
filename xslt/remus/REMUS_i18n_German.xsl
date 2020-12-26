<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- =========================================================== -->
<!-- File       : REMUS_i18n_German.xsl                          -->
<!-- Content    : REM XSLT for subjects at US - German i18n file -->
<!-- Author     : Amador Durán Toro                              -->
<!-- Translator : Gerhard Grossberger                            -->
<!-- Date       : 2020/07/26                                     -->
<!-- Version    : 3.0                                            -->
<!-- =========================================================== -->

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
<xsl:variable name="rem:lang_action">Aktion</xsl:variable>
<xsl:variable name="rem:lang_address">Adresse</xsl:variable>
<xsl:variable name="rem:lang_alternative">Alternative</xsl:variable>
<xsl:variable name="rem:lang_analysis">Analyse</xsl:variable>
<xsl:variable name="rem:lang_attenders">Betreuer</xsl:variable>
<xsl:variable name="rem:lang_attribute">Attribut</xsl:variable>
<xsl:variable name="rem:lang_authors">Autoren</xsl:variable>
<xsl:variable name="rem:lang_average">Durchschnitt</xsl:variable>
<xsl:variable name="rem:lang_comments">Kommentar</xsl:variable>
<xsl:variable name="rem:lang_components">Komponenten</xsl:variable>
<xsl:variable name="rem:lang_condition">Bedingung</xsl:variable>
<xsl:variable name="rem:lang_constant_attribute">Konstantes Attribut</xsl:variable>
<xsl:variable name="rem:lang_constant_role">Konstante Rolle</xsl:variable>
<xsl:variable name="rem:lang_date">Datum</xsl:variable>
<xsl:variable name="rem:lang_definition">Definition</xsl:variable>
<xsl:variable name="rem:lang_dependencies">Abhängigkeiten</xsl:variable>
<xsl:variable name="rem:lang_derived_attribute">Geerbtes Attribut</xsl:variable>
<xsl:variable name="rem:lang_derived_role">Geerbte Rolle</xsl:variable>
<xsl:variable name="rem:lang_description">Beschreibung</xsl:variable>
<xsl:variable name="rem:lang_directly_affected_objects">Beeinflusst direkt</xsl:variable>
<xsl:variable name="rem:lang_disjoint_subtypes">Untergruppe (aufgeteilt)</xsl:variable>
<xsl:variable name="rem:lang_exception">Ausnahme</xsl:variable>
<xsl:variable name="rem:lang_exceptions">Ausnahmen</xsl:variable>
<xsl:variable name="rem:lang_expected_frequency">Erwartete Frequenz</xsl:variable>
<xsl:variable name="rem:lang_expression">Ausdruck</xsl:variable>
<xsl:variable name="rem:lang_fax">Fax</xsl:variable>
<xsl:variable name="rem:lang_figure">Bild</xsl:variable>
<xsl:variable name="rem:lang_freelance">Unabhängig</xsl:variable>
<xsl:variable name="rem:lang_if">Wenn</xsl:variable>
<xsl:variable name="rem:lang_indirectly_affected_objects">Indirekt beeinflusst</xsl:variable>
<xsl:variable name="rem:lang_invariant">Unveränderbarer Ausdruck</xsl:variable>
<xsl:variable name="rem:lang_importance">Wichtigkeit</xsl:variable>
<xsl:variable name="rem:lang_initialValue">Startwert</xsl:variable>
<xsl:variable name="rem:lang_isCustomer">Kunde</xsl:variable>
<xsl:variable name="rem:lang_isDeveloper">Entwickler</xsl:variable>
<xsl:variable name="rem:lang_isUser">Anwender</xsl:variable>
<xsl:variable name="rem:lang_lifetime">Lebenszeit</xsl:variable>
<xsl:variable name="rem:lang_maximum">Maximum</xsl:variable>
<xsl:variable name="rem:lang_maximum_time">Maximum Zeit</xsl:variable>
<xsl:variable name="rem:lang_meeting">Meeting</xsl:variable>
<xsl:variable name="rem:lang_multiplicity">Vielfalt</xsl:variable>
<xsl:variable name="rem:lang_name">Name</xsl:variable>
<xsl:variable name="rem:lang_no">Nein</xsl:variable>
<xsl:variable name="rem:lang_none">Nichts</xsl:variable>
<xsl:variable name="rem:lang_OCL_condition">Bedingung (OCL)</xsl:variable>
<xsl:variable name="rem:lang_OCL_expression">OCL Ausdruck</xsl:variable>
<xsl:variable name="rem:lang_OCL_postconditions">Nachbedingung Ausdruck (OCL)</xsl:variable>
<xsl:variable name="rem:lang_OCL_preconditions">Vorbedingung Ausdruck (OCL)</xsl:variable>
<xsl:variable name="rem:lang_ordinary_sequence">Einfache Sequenz</xsl:variable>
<xsl:variable name="rem:lang_organization">Organisation</xsl:variable>
<xsl:variable name="rem:lang_overlapping_subtypes">Untertypen (überlappend)</xsl:variable>
<xsl:variable name="rem:lang_parameters">Parameter</xsl:variable>
<xsl:variable name="rem:lang_performance">Performance</xsl:variable>
<xsl:variable name="rem:lang_place">Ort</xsl:variable>
<xsl:variable name="rem:lang_possible_solution">Mögliche Lösung</xsl:variable>
<xsl:variable name="rem:lang_postcondition">Nachbedingung</xsl:variable>
<xsl:variable name="rem:lang_postconditions">Nachbedingung Ausdruck</xsl:variable>
<xsl:variable name="rem:lang_precondition">Vorbedingung</xsl:variable>
<xsl:variable name="rem:lang_preconditions">Vorbedingung Ausdruck</xsl:variable>
<xsl:variable name="rem:lang_prepared_by">Hergestellt von:</xsl:variable>
<xsl:variable name="rem:lang_prepared_for">Hergestellt für:</xsl:variable>
<xsl:variable name="rem:lang_project">Projekt</xsl:variable>
<xsl:variable name="rem:lang_related_objectives">Verwandte/Bezug nehmende Ziele</xsl:variable>
<xsl:variable name="rem:lang_related_requirements">Verwandte Anforderungen</xsl:variable>
<xsl:variable name="rem:lang_result_type">Ergebnis-Typ</xsl:variable>
<xsl:variable name="rem:lang_results">Ergebnisse</xsl:variable>
<xsl:variable name="rem:lang_role">Rolle</xsl:variable>
<xsl:variable name="rem:lang_simultaneous_ocurrences">Gleichzeitige Ereignisse</xsl:variable>
<xsl:variable name="rem:lang_sources">Quellen</xsl:variable>
<xsl:variable name="rem:lang_specific_data">Spezifische Daten</xsl:variable>
<xsl:variable name="rem:lang_stability">Stabilität</xsl:variable>
<xsl:variable name="rem:lang_stakeholder">Stakeholder</xsl:variable>
<xsl:variable name="rem:lang_status">Status</xsl:variable>
<xsl:variable name="rem:lang_step">Schritt</xsl:variable>
<xsl:variable name="rem:lang_subobjectives">Teilziele</xsl:variable>
<xsl:variable name="rem:lang_subtypes">Teiltypen</xsl:variable>
<xsl:variable name="rem:lang_supertype">Supertyp</xsl:variable>
<xsl:variable name="rem:lang_system">System</xsl:variable>
<xsl:variable name="rem:lang_TBD">T.B.D.</xsl:variable>
<xsl:variable name="rem:lang_telephone">Telefon</xsl:variable>
<xsl:variable name="rem:lang_The">Das</xsl:variable>
<xsl:variable name="rem:lang_the">das</xsl:variable>
<xsl:variable name="rem:lang_The_actor">Aktor</xsl:variable>
<xsl:variable name="rem:lang_the_actor">Aktor</xsl:variable>
<xsl:variable name="rem:lang_then_this_use_case">dann dieser Use Case</xsl:variable>
<xsl:variable name="rem:lang_time">Zeit</xsl:variable>
<xsl:variable name="rem:lang_times_per">Zeiten pro</xsl:variable>
<xsl:variable name="rem:lang_TOC">Inhaltsverzeichnis</xsl:variable>
<xsl:variable name="rem:lang_traceability_matrix">Nachverfolgungs-Matrix</xsl:variable>
<xsl:variable name="rem:lang_type">Typ</xsl:variable>
<xsl:variable name="rem:lang_urgency">Dringlichkeit</xsl:variable>
<xsl:variable name="rem:lang_variable_attribute">Variables Attribut</xsl:variable>
<xsl:variable name="rem:lang_variable_role">Variable RolLe</xsl:variable>
<xsl:variable name="rem:lang_version">Version</xsl:variable>
<xsl:variable name="rem:lang_yes">Ja</xsl:variable>

<!-- new in REMUS (to be translated into German) -->
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

<xsl:variable name="rem:lang_the_system_shall">Das System muss</xsl:variable>
<xsl:variable name="rem:lang_TBD_expanded">To be determined</xsl:variable>

<!-- ===================== -->
<!-- L-patterns for actors -->
<!-- ===================== -->

<xsl:variable name="rem:lang_this_actor_represents">Dieser Aktor repräsentiert</xsl:variable>

<!-- ======================================= -->
<!-- L-patterns for information requirements -->
<!-- ======================================= -->

<xsl:variable name="rem:lang_irq_lp_01">Das System soll die Informationen speichern, in Zusammenhang mit</xsl:variable>

<xsl:variable name="rem:lang_irq_lp_02">Noch genauer:</xsl:variable>

<!-- ======================================= -->
<!-- L-patterns for constraint requirements  -->
<!-- ======================================= -->

<!--
Automatically (probably wrong) transalted from:
	The system shall be compliant with the following business rule or constraint:
-->
<xsl:variable name="rem:lang_crq_lp_01">Das System muss mit der folgenden Geschäftsregel oder -einschränkung konform sein:</xsl:variable>

<!-- ======================== -->
<!-- L-patterns for use cases -->
<!-- ======================== -->

<xsl:variable name="rem:lang_uc_lp_01">Das System soll sich so verhalten wie in den folgenden</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_02">abstrakter Use Case während der Ausführung des folgenden Use Case:</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_03">Use Case wenn</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_04">oder während der Ausführung des folgenden Use Case:</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_05">Use Sase</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_06">Use Case</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_07">wird ausgeführt</xsl:variable>

<!-- =========================== -->
<!-- L-patterns for object types -->
<!-- =========================== -->

<xsl:variable name="rem:lang_ot_lp_01">Dieser Objekt-Typ repräsentiert</xsl:variable>

<xsl:variable name="rem:lang_ot_lp_02">Dieser abstrakte Objekt-Typ repräsentiert</xsl:variable>

<!-- ================================ -->
<!-- L-patterns for association types -->
<!-- ================================ -->

<xsl:variable name="rem:lang_at_lp_01">Dieser Assoziationstyp repräsentiert die Tatsache, dass</xsl:variable>

<!-- =========================== -->
<!-- L-patterns for value types  -->
<!-- =========================== -->

<xsl:variable name="rem:lang_vt_lp_01">Dieser Wertetyp repräsentiert</xsl:variable>

<!-- ========================= -->
<!-- L-patterns for attributes -->
<!-- ========================= -->

<xsl:variable name="rem:lang_att_lp_01">Dieses Attribut repräsentiert</xsl:variable>

<!-- ==================== -->
<!-- L-patterns for roles -->
<!-- ==================== -->

<xsl:variable name="rem:lang_role_lp_01">Diese Rolle repräsentiert</xsl:variable>

</xsl:stylesheet>
