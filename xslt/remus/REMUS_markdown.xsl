<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- ======================================================== -->
<!-- File    : REMUS_markdown.xsl                             -->
<!-- Content : REM XSLT for subjects at US - markdown         -->
<!-- Author  : Amador Durán Toro                              -->
<!-- Date    : 2021/01/06                                     -->
<!-- Version : 3.1                                            -->
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
<!-- makeHtml function using showdown                         -->
<!-- ======================================================== -->

<msxsl:script implements-prefix="rem">
<![CDATA[
  var converter = new showdown.Converter();

  // some showdown options
  converter.setOption('simpleLineBreaks', true);
  converter.setOption('strikethrough', true);
  //converter.setOption('emoji', true);
  converter.setOption('tasklists', true);
  converter.setOption('simplifiedAutoLink', true);
  converter.setOption('parseImgDimensions', true);
  converter.setOption('tables', true);
  converter.setOption('disableForced4SpacesIndentedSublists', true);

  // function to be used in XSLT templates
  function makeHtml( md_text, inline ) {

    // optional parameter
    if ( inline === undefined ) {
        inline = false;
    }

    // Simple text replace can be performed using split and join faster
    // than using replace with a regular expression as described in:
    // https://dmitripavlutin.com/replace-all-string-occurrences-javascript/

    /* no internal <p>...</p> in inline mode */
    var newline = inline ? " " : "\n";
    var two_newlines = newline + newline;

    var crlf_tag             = "¬";
    var two_crlf_tags        = crlf_tag + crlf_tag;
    var three_spaces_newline = "   " + newline;
    var reg_exp = new RegExp(  "(" + crlf_tag + ")(?!(\\d\\.)|\\*|\\+|\\-|\\<)", 'g' );

    // if ( inline )
    //      replace all CRLF by spaces
    // else
    //      replace all CRLF+CRLF into \n\n
    //      replace all CRLF not followed by *,+,-,> or a digit+period into 3 spaces + \n
    //      replace all remaining CRLF into \n
    // endif
    //
    // try regular expressions at: https://regexr.com/

    if ( inline ) {
        md_text = md_text.split( crlf_tag ).join( newline );
    }
    else {
        md_text = md_text.split( two_crlf_tags ).join( two_newlines );
        md_text = md_text.replace( reg_exp, three_spaces_newline + "$2" );
        md_text = md_text.split( crlf_tag ).join( newline );
    }

    // Don't get rid of enclosing <p>...</p> in paragraph mode,
    // double \n inside markdown will close the first <p> generating an
    // unbalanced </p> later and wrong html that will raise an
    // error when assigned to innerHTML.

    var result = converter.makeHtml( md_text );

    if ( inline ) {
        // get rid of enclosing <p>...</p> (if any)
        // warning: generated item lists are not inside <p>...</p>
        // length("<p>") == 3, length("</p>") == 4
        if ( result.indexOf("<p>") == 0 &&
             result.lastIndexOf("</p>") == result.length - 4 )
        {
            result = result.slice( 3, -4 );
        }
    }

    return result;
  }
]]>
</msxsl:script>

</xsl:stylesheet>
