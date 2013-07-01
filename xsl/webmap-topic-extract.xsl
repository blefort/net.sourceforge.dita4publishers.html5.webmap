<xsl:stylesheet 
  xmlns:df="http://dita2indesign.org/dita/functions"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:htmlutil="http://dita4publishers.org/functions/htmlutil"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  exclude-result-prefixes="df xs relpath htmlutil xd dc" 
  version="2.0">

  <xsl:template match="*[contains(@class, 'webmap-d/extractor')][contains(@class, 'extractor/block')]" mode="generate-webmap-content">
    <xsl:param name="level" as="xs:integer" select="2" tunnel="yes" />
    <xsl:message> + [INFO] - extracting topic <xsl:value-of select="@href" /></xsl:message>
    <xsl:variable name="topic" select="document(@href)"/>
    
    <div class="{concat('block ', @outputclass)}">
    
    	<xsl:element name="{concat('h', $level)}">
    		<xsl:apply-templates select="*" mode="topic-navtitle" />
    	</xsl:element>
    	
    	<div>
    		<xsl:apply-templates select="*" mode="topic-content" />
    	</div>
    
    </div>
    
    
  </xsl:template>
  
</xsl:stylesheet>
