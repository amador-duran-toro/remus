<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_tags.xsl                                 -->
<!-- Content : REM XSLT for subjects at US - paragraph        -->
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
    exclude-result-prefixes="rem"
>

<!-- ======================================================== -->
<!-- REMUS specific tags                                      -->
<!-- ======================================================== -->

<!-- [PART] as the beginning of paragraph names -->
<xsl:variable name="rem:part_tag">[PART]</xsl:variable>

<!-- [LINK] as the beginning of paragraph names -->
<xsl:variable name="rem:link_tag">[LINK]</xsl:variable>

<!-- [info] as part of the name of paragraphs -->
<xsl:variable name="rem:info_tag">[info]</xsl:variable>

<!-- [bib] as the beginning of glossary item comments -->
<xsl:variable name="rem:bib_tag">[bib]</xsl:variable>

<!-- [enum] as the beginning of enum value type names -->
<xsl:variable name="rem:enum_tag">[enum]</xsl:variable>

<!-- [width=999%] as the beggining of graphic file comments -->
<xsl:variable name="rem:width_tag">[width=</xsl:variable>

<!-- [base64] as part of graphic file comments -->
<xsl:variable name="rem:base64_tag">[base64]</xsl:variable>

<!-- ¬ as tag for newlines in rem:text/text() -->
<xsl:variable name='rem:CRLF_tag'>¬</xsl:variable>

</xsl:stylesheet>
