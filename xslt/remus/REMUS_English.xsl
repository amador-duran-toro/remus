<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ========================================================= -->
<!-- File    : REMUS_English.xsl                               -->
<!-- Content : REM XSLT for subjects at US - English main file -->
<!-- Author  : Amador Durán Toro                               -->
<!-- Date    : 2020/04/12                                      -->
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

<xsl:import href="REMUS_i18n_English.xsl"/>

<!-- ======================================================== -->
<!-- Include REMUS comment tags                               -->
<!-- ======================================================== -->

<xsl:include href="REMUS_tags.xsl"/>

<!-- ======================================================== -->
<!-- Localized REMUS-specific strings                         -->
<!-- ======================================================== -->

<xsl:variable name="rem:lang">en</xsl:variable>
<xsl:variable name="rem:lang_part">Part</xsl:variable>
<xsl:variable name="rem:lang_warnings">Warnings</xsl:variable>
<xsl:variable name="rem:lang_abstract">abstract</xsl:variable>
<xsl:variable name="rem:lang_TBD_expanded">To Be Determined</xsl:variable>

<!-- ======================================================== -->
<!-- Include main XSLT file                                   -->
<!-- ======================================================== -->

<xsl:include href="REMUS_main.xsl"/>

</xsl:stylesheet>
