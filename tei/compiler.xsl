<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
     version="3.0">
    
    <xsl:output method="xml"/>
       
    <xsl:variable name="tei" select="resolve-uri('tei',base-uri())"/>
        
        <xsl:template match="/">
            
                <xsl:for-each select="collection(concat($tei, '?select=*.xml;recurse=yes'))//text">
                    <xsl:copy-of select="."/>
                </xsl:for-each>
        </xsl:template>
        
    </xsl:stylesheet>