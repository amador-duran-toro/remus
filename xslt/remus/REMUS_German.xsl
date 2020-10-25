<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ========================================================= -->
<!-- File    : REMUS_German.xsl                                -->
<!-- Content : REM XSLT for subjects at US - German main file  -->
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

<!-- ======================================================== -->
<!-- Import default localized strings                         -->
<!-- ======================================================== -->

<xsl:import href="REMUS_i18n_German.xsl"/>

<!-- ======================================================== -->
<!-- Include REMUS comment tags                               -->
<!-- ======================================================== -->

<xsl:include href="REMUS_tags.xsl"/>

<!-- ======================================================== -->
<!-- Localized REMUS-specific strings                         -->
<!-- ======================================================== -->

<!-- These words have to be checked by a German speaker.      -->

<xsl:variable name="rem:lang">de</xsl:variable>
<xsl:variable name="rem:lang_part">Part</xsl:variable>
<xsl:variable name="rem:lang_warnings">Warnungen</xsl:variable>
<xsl:variable name="rem:lang_abstract">abstrakte</xsl:variable>
<xsl:variable name="rem:lang_TBD_expanded">Es steht noch aus</xsl:variable>

<!-- ======================================================== -->
<!-- Include main XSLT file                                   -->
<!-- ======================================================== -->

<xsl:include href="REMUS_main.xsl"/>

</xsl:stylesheet>
