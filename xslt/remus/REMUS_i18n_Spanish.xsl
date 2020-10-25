<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ========================================================= -->
<!-- File    : REMUS_i18n_Spanish.xsl                          -->
<!-- Content : REM XSLT for subjects at US - Spanish i18n file -->
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
<xsl:variable name="rem:lang_action">Acción</xsl:variable>
<xsl:variable name="rem:lang_address">Dirección</xsl:variable>
<xsl:variable name="rem:lang_alternative">Alternativa</xsl:variable>
<xsl:variable name="rem:lang_analysis">Análisis</xsl:variable>
<xsl:variable name="rem:lang_attenders">Asistentes</xsl:variable>
<xsl:variable name="rem:lang_attribute">Atributo</xsl:variable>
<xsl:variable name="rem:lang_authors">Autores</xsl:variable>
<xsl:variable name="rem:lang_average">Medio</xsl:variable>
<xsl:variable name="rem:lang_comments">Comentarios</xsl:variable>
<xsl:variable name="rem:lang_components">Componentes</xsl:variable>
<xsl:variable name="rem:lang_condition">Condición</xsl:variable>
<xsl:variable name="rem:lang_constant_attribute">Atributo constante</xsl:variable>
<xsl:variable name="rem:lang_constant_role">Rol constante</xsl:variable>
<xsl:variable name="rem:lang_date">Fecha</xsl:variable>
<xsl:variable name="rem:lang_definition">Definición</xsl:variable>
<xsl:variable name="rem:lang_dependencies">Dependencias</xsl:variable>
<xsl:variable name="rem:lang_derived_attribute">Atributo derivado</xsl:variable>
<xsl:variable name="rem:lang_derived_role">Rol derivado</xsl:variable>
<xsl:variable name="rem:lang_description">Descripción</xsl:variable>
<xsl:variable name="rem:lang_directly_affected_objects">Afecta directamenta</xsl:variable>
<xsl:variable name="rem:lang_disjoint_subtypes">Subtipos (disjuntos)</xsl:variable>
<xsl:variable name="rem:lang_exception">Excepción</xsl:variable>
<xsl:variable name="rem:lang_exceptions">Excepciones</xsl:variable>
<xsl:variable name="rem:lang_expected_frequency">Frecuencia esperada</xsl:variable>
<xsl:variable name="rem:lang_expression">Expresión</xsl:variable>
<xsl:variable name="rem:lang_fax">Fax</xsl:variable>
<xsl:variable name="rem:lang_figure">Figura</xsl:variable>
<xsl:variable name="rem:lang_freelance">Freelance</xsl:variable>
<xsl:variable name="rem:lang_if">Si</xsl:variable>
<xsl:variable name="rem:lang_indirectly_affected_objects">Afecta indirectamente</xsl:variable>
<xsl:variable name="rem:lang_invariant">Expresión de invariante</xsl:variable>
<xsl:variable name="rem:lang_isCustomer">Es cliente</xsl:variable>
<xsl:variable name="rem:lang_isDeveloper">Es desarrollador</xsl:variable>
<xsl:variable name="rem:lang_isUser">Es usuario</xsl:variable>
<xsl:variable name="rem:lang_importance">Importancia</xsl:variable>
<xsl:variable name="rem:lang_initialValue">Valor inicial</xsl:variable>
<xsl:variable name="rem:lang_lifetime">Tiempo de vida</xsl:variable>
<xsl:variable name="rem:lang_maximum">Máximo</xsl:variable>
<xsl:variable name="rem:lang_maximum_time">Tiempo máximo</xsl:variable>
<xsl:variable name="rem:lang_meeting">Reunión</xsl:variable>
<xsl:variable name="rem:lang_multiplicity">Multiplicidad</xsl:variable>
<xsl:variable name="rem:lang_name">Nombre</xsl:variable>
<xsl:variable name="rem:lang_no">No</xsl:variable>
<xsl:variable name="rem:lang_none">Ninguno</xsl:variable>
<xsl:variable name="rem:lang_OCL_condition">Condición (OCL)</xsl:variable>
<xsl:variable name="rem:lang_OCL_expression">Expresión OCL</xsl:variable>
<xsl:variable name="rem:lang_OCL_postconditions">Expresiones de postcondición (OCL)</xsl:variable>
<xsl:variable name="rem:lang_OCL_preconditions">Expresiones de precondición (OCL)</xsl:variable>
<xsl:variable name="rem:lang_ordinary_sequence">Secuencia normal</xsl:variable>
<xsl:variable name="rem:lang_organization">Organización</xsl:variable>
<xsl:variable name="rem:lang_overlapping_subtypes">Subtipos (solapados)</xsl:variable>
<xsl:variable name="rem:lang_parameters">Parámetros</xsl:variable>
<xsl:variable name="rem:lang_performance">Rendimiento</xsl:variable>
<xsl:variable name="rem:lang_place">Lugar</xsl:variable>
<xsl:variable name="rem:lang_possible_solution">Posible solución</xsl:variable>
<xsl:variable name="rem:lang_postcondition">Postcondición</xsl:variable>
<xsl:variable name="rem:lang_postconditions">Expresiones de postcondición</xsl:variable>
<xsl:variable name="rem:lang_precondition">Precondición</xsl:variable>
<xsl:variable name="rem:lang_preconditions">Expresiones de precondición</xsl:variable>
<xsl:variable name="rem:lang_prepared_by">Preparado por:</xsl:variable>
<xsl:variable name="rem:lang_prepared_for">Preparado para:</xsl:variable>
<xsl:variable name="rem:lang_project">Proyecto</xsl:variable>
<xsl:variable name="rem:lang_related_objectives">Objetivos de los que depende</xsl:variable>
<xsl:variable name="rem:lang_related_requirements">Requisitos de los que depende</xsl:variable>
<xsl:variable name="rem:lang_result_type">Tipo del resultado</xsl:variable>
<xsl:variable name="rem:lang_results">Resultados</xsl:variable>
<xsl:variable name="rem:lang_role">Rol</xsl:variable>
<xsl:variable name="rem:lang_simultaneous_ocurrences">Ocurrencias simultáneas</xsl:variable>
<xsl:variable name="rem:lang_sources">Fuentes</xsl:variable>
<xsl:variable name="rem:lang_specific_data">Datos específicos</xsl:variable>
<xsl:variable name="rem:lang_stability">Estabilidad</xsl:variable>
<xsl:variable name="rem:lang_stakeholder">Participante</xsl:variable>
<xsl:variable name="rem:lang_status">Estado</xsl:variable>
<xsl:variable name="rem:lang_step">Paso</xsl:variable>
<xsl:variable name="rem:lang_subobjectives">Subobjetivos</xsl:variable>
<xsl:variable name="rem:lang_subtypes">Subtipos</xsl:variable>
<xsl:variable name="rem:lang_supertype">Supertipo</xsl:variable>
<xsl:variable name="rem:lang_system">sistema</xsl:variable>
<xsl:variable name="rem:lang_TBD">PD</xsl:variable>
<xsl:variable name="rem:lang_telephone">Teléfono</xsl:variable>
<xsl:variable name="rem:lang_then_this_use_case">a continuación este caso de uso</xsl:variable>
<xsl:variable name="rem:lang_the">el</xsl:variable>
<xsl:variable name="rem:lang_The">El</xsl:variable>
<xsl:variable name="rem:lang_The_actor">El actor</xsl:variable>
<xsl:variable name="rem:lang_the_actor">el actor</xsl:variable>
<xsl:variable name="rem:lang_time">Hora</xsl:variable>
<xsl:variable name="rem:lang_times_per">veces por</xsl:variable>
<xsl:variable name="rem:lang_TOC">Índice</xsl:variable>
<xsl:variable name="rem:lang_traceability_matrix">Matriz de rastreabilidad</xsl:variable>
<xsl:variable name="rem:lang_type">Tipo</xsl:variable>
<xsl:variable name="rem:lang_urgency">Urgencia</xsl:variable>
<xsl:variable name="rem:lang_variable_attribute">Atributo variable</xsl:variable>
<xsl:variable name="rem:lang_variable_role">Rol variable</xsl:variable>
<xsl:variable name="rem:lang_version">Versión</xsl:variable>
<xsl:variable name="rem:lang_yes">Sí</xsl:variable>

<!-- ==================== -->
<!-- Patrones-L generales -->
<!-- ==================== -->

<xsl:variable name="rem:lang_the_system_shall">El sistema deberá</xsl:variable>
<xsl:variable name="rem:lang_TBD_expanded">Por determinar</xsl:variable>

<!-- ======================= -->
<!-- Patrones-L para actores -->
<!-- ======================= -->

<xsl:variable name="rem:lang_this_actor_represents">Este actor representa</xsl:variable>

<!-- ========================================= -->
<!-- Patrones-L para requisitos de información -->
<!-- ========================================= -->

<xsl:variable name="rem:lang_irq_lp_01">El sistema deberá almacenar la información correspondiente a</xsl:variable>

<xsl:variable name="rem:lang_irq_lp_02">En concreto:</xsl:variable>

<!-- ========================================== -->
<!-- Patrones-L para requisitos de restricción  -->
<!-- ========================================== -->

<xsl:variable name="rem:lang_crq_lp_01">El sistema deberá respetar la siguiente regla de negocio o restricción:</xsl:variable>

<!-- ============================ -->
<!-- Patrones-L para casos de uso -->
<!-- ============================= -->

<xsl:variable name="rem:lang_uc_lp_01">El sistema deberá comportarse tal como se describe en el siguiente</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_02">caso de uso abstracto durante la realización de los siguientes casos de uso:</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_03">caso de uso cuando</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_04">o durante la realización de los siguientes casos de uso:</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_05">Se realiza el caso de uso</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_06">se realiza el caso de uso</xsl:variable>

<xsl:variable name="rem:lang_uc_lp_07"></xsl:variable>

<!-- ================================ -->
<!-- Patrones-L para tipos de objetos -->
<!-- ================================ -->

<xsl:variable name="rem:lang_ot_lp_01">Este tipo de objetos representa</xsl:variable>

<xsl:variable name="rem:lang_ot_lp_02">Este tipo abstracto de objetos representa</xsl:variable>

<!-- =================================== -->
<!-- Patrones-L para tipos de asociación -->
<!-- =================================== -->

<xsl:variable name="rem:lang_at_lp_01">Este tipo de asociación representa el hecho de que</xsl:variable>

<!-- ================================ -->
<!-- Patrones-L para tipos valor      -->
<!-- ================================ -->

<xsl:variable name="rem:lang_vt_lp_01">Este tipo valor representa</xsl:variable>

<!-- ========================= -->
<!-- Patrones-L para atributos -->
<!-- ========================= -->

<xsl:variable name="rem:lang_att_lp_01">Este atributo representa</xsl:variable>

<!-- ===================== -->
<!-- Patrones-L para roles -->
<!-- ===================== -->

<xsl:variable name="rem:lang_role_lp_01">Este rol representa</xsl:variable>

</xsl:stylesheet>
