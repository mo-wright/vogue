<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>
    
    <xsl:variable name="corpus" as="document-node()+" select="collection('tei/?select=*xml')"/>
    
    <!--  -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Reading View</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <div class="title-container">
                <h1 id="vogue-title">Vogue</h1>
                </div>
                <h2>DIGIT 110 Semester Project</h2>
                <div id="navBar">
                    <a href="index.html">Home</a>
                    <a href="original.html">Original Texts</a> 
                    <a href="swatches.html">Swatch Gallery</a>
                </div>
                <div id="reader">
                    <xsl:apply-templates select="$corpus//body"/>
                </div>
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="body">
        <div class="entry" id="article{position()}"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="rs[@type='material'] | rs[@type='garment'] | rs[@type='color']">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
    
    <xsl:template match="note[@type='image']">
        <span class="articleImg"><xsl:apply-templates/></span>
    </xsl:template>
    
    
</xsl:stylesheet>