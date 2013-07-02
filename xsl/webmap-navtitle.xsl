<xsl:stylesheet 
  xmlns:df="http://dita2indesign.org/dita/functions"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:htmlutil="http://dita4publishers.org/functions/htmlutil"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:dc="http://purl.org/dc/elements/1.1/"
  exclude-result-prefixes="df xs relpath htmlutil xd dc" version="2.0">
  
  <xsl:template match="*" mode="topic-navtitle">
  	<xsl:value-of select="descendant::*[contains(@class, 'topic/title')][1]"/> 
  </xsl:template>
 
 
</xsl:stylesheet>