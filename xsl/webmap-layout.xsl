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
  
  

  <xsl:template match="*[contains(@class, 'webmap-d/layout')]" mode="generate-webmap-content">
    <xsl:call-template name="debug-template">
    	<xsl:with-param name="name" select="'layout'" />
    </xsl:call-template>
    <div class="layout {@outputclass}">
    	<xsl:apply-templates select="*" mode="#current"/>
    </div>
  </xsl:template>
  
  
  <!-- the column layout should implement:
       - default behavior (no grid)
       - grid behavior
  -->
  <xsl:template match="*[contains(@class, 'webmap-d/l-column')]" mode="generate-webmap-content">
   <xsl:call-template name="debug-template">
    	<xsl:with-param name="name" select="'column'" />
    </xsl:call-template>
    <div class="{@outputclass}">
    	<xsl:apply-templates select="*" mode="#current"/>
    </div>
  </xsl:template>
  
  <!-- the column layout should implement:
       - default behavior (no grid)
       - grid behavior
  -->
  <xsl:template match="*[contains(@class, 'webmap-d/column')]" mode="generate-webmap-content">
   <xsl:call-template name="debug-template">
    	<xsl:with-param name="name" select="'column'" />
    </xsl:call-template>
  	<xsl:variable name="columnIndex" select="count(preceding-sibling::*[contains(@class, 'webmap-d/column')]) + 1"/>
  	
    <div class="{concat('col-', $columnIndex, ' ', $GRIDPREFIX, @size, ' ', @outputclass)}">
    	<xsl:apply-templates select="*" mode="#current"/>
    </div>
  </xsl:template>
  
</xsl:stylesheet>
