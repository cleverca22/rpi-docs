<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/device">
        <html>
            <head>
                <title><xsl:value-of select="vendor"/> - <xsl:value-of select="name"/> v<xsl:value-of select="version"/></title>
                <link rel="stylesheet" type="text/css" href="style.css" />
            </head>
            <body>
                <h2><xsl:value-of select="vendor"/></h2>
                <h3><xsl:value-of select="name"/> v<xsl:value-of select="version"/></h3>
                <table class="peripheral">
                <xsl:for-each select="peripherals/peripheral">
                    <tr>
                        <th class="addr"><xsl:value-of select="baseAddress"/></th>
                        <th class="name"><xsl:value-of select="name"/></th>
                        <th class="desc"><xsl:value-of select="description"/></th>
                    </tr>
                    <xsl:for-each select="registers/register">
                    <tr>
                        <td class="addr"><xsl:value-of select="addressOffset"/></td>
                        <td class="name"><xsl:value-of select="name"/></td>
                        <td class="desc"><xsl:value-of select="description"/></td>
                    </tr>
                    </xsl:for-each>
                </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
