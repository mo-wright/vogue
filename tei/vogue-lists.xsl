<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:output method="xhtml" indent="yes" html-version="5"/>

    <xsl:variable name="vogueColl" select="collection('?select=*.xml')"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Vogue Markup Summary</title>
                <link rel="stylesheet" href="style.css"/>
            </head>

            <body>
                <div class="sectionBox">
                    <h1>Vogue Markup Summary</h1>
                </div>
                <div class="sectionBox">
                    <h2>Garments</h2>
                    <table>
                        <tr>
                            <th>Garment</th>
                            <th>Count</th>
                        </tr>
                        <xsl:for-each select="
                                $vogueColl//rs[@type = 'garment']
                                ! normalize-space()
                                => distinct-values()
                                => sort()">

                            <tr>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count($vogueColl//rs[@type = 'garment'][normalize-space() = current()])"
                                    />
                                </td>
                            </tr>

                        </xsl:for-each>
                    </table>
                </div>

                <div class="sectionBox">
                    <h2>Materials</h2>
                    <table>
                        <tr>
                            <th>Material</th>
                            <th>Count</th>
                        </tr>

                        <xsl:for-each select="
                                $vogueColl//rs[@type = 'material']
                                ! normalize-space()
                                => distinct-values()
                                => sort()">

                            <tr>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="count($vogueColl//rs[@type = 'material'][normalize-space() = current()])"
                                    />
                                </td>
                            </tr>

                        </xsl:for-each>
                    </table>
                </div>
                <div class="sectionBox">
                    <h2>Colors</h2>
                    <table>
                        <tr>
                            <th>Color</th>
                            <th>Count</th>
                        </tr>

                        <xsl:for-each select="
                                ($vogueColl//rs[@type = 'color'] |
                                $vogueColl//note[@type = 'color'])
                                ! normalize-space()
                                => distinct-values()
                                => sort()">

                            <tr>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                                <td>
                                    <xsl:value-of select="
                                            count(
                                            ($vogueColl//rs[@type = 'color'] |
                                            $vogueColl//note[@type = 'color'])
                                            [normalize-space() = current()]
                                            )"/>
                                </td>
                            </tr>

                        </xsl:for-each>
                    </table>
                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
