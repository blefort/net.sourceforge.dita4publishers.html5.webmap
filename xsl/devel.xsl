<xsl:stylesheet version="2.0"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:saxon="http://www.saxonica.com/"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                
<xsl:template name="debug-template">
	<xsl:param name="name" as="xs:string" select="''" />
	<xsl:message> -- <xsl:value-of select="$name"/></xsl:message>
</xsl:template>

</xsl:stylesheet>