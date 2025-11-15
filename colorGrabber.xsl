<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>



    <xsl:template match="/">
        <html>
            <head>
                <title>Swatch Gallery</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1>Vogue</h1>
                <h2>DIGIT 110 Semester Project</h2>
                <div id="navBar">
                    <a href="index.html">Home</a>
                    <a href="original.html">Original Texts</a>
                    <a href="nothing">Link</a>
                    <!-- add real links later -Molly !-->
                </div>


                <h2>Colors Used In Vogue Selections</h2>
                <p>Below are the unique colors used within the articles on this page.</p>

                <div class="colorGrid">
                    <xsl:for-each-group select="distinct-values(//rs[@type = 'color'])"
                        group-by="upper-case(.)">
                        <div class="swatch">
                            <p>
                                <xsl:value-of select="upper-case(.)"/>
                            </p>
                            <div class="sampleColor"/>
                        </div>
                    </xsl:for-each-group>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
