<xsl:stylesheet 
  xmlns:df="http://dita2indesign.org/dita/functions"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:htmlutil="http://dita4publishers.org/functions/htmlutil"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:dc="http://purl.org/dc/elements/1.1/"
  exclude-result-prefixes="df xs relpath htmlutil xd dc" version="2.0">

 <xsl:template match="*[contains(@class, 'map/topicref')][contains(@class, 'webmap-d/article')]" mode="generate-webmap-content">
 
    <xsl:call-template name="debug-template">
    	<xsl:with-param name="name" select="'article'" />
    </xsl:call-template>
    
    <article class="{@outputclass}">
    	<xsl:apply-templates select="*" mode="#current"/>
    </article>
    
  </xsl:template>
  
  <xsl:template match="*[contains(@class, 'map/topicref')][contains(@class, 'webmap-d/section')]" mode="generate-webmap-content">
 
    <xsl:call-template name="debug-template">
    	<xsl:with-param name="name" select="'article'" />
    </xsl:call-template>
    
    <section class="{@outputclass}">
    	<xsl:apply-templates select="*" mode="#current"/>
    </section>
    
  </xsl:template>
  
  <xsl:template match="*[contains(@class, 'map/topicref')][contains(@class, 'webmap-d/aside')]" mode="generate-webmap-content">
 
    <xsl:call-template name="debug-template">
    	<xsl:with-param name="name" select="'article'" />
    </xsl:call-template>
    
    <aside class="{@outputclass}">
    	<xsl:apply-templates select="*" mode="#current"/>
    </aside>
    
  </xsl:template>

 <xsl:template match="*[contains(@class, 'map/topicref')][contains(@class, 'webmap-d/main')]" mode="generate-webmap-content">
 
    <xsl:call-template name="debug-template">
    	<xsl:with-param name="name" select="'article'" />
    </xsl:call-template>
    
    <main class="{@outputclass}">
    	<xsl:apply-templates select="*" mode="#current"/>
    </main>
    
  </xsl:template>
 
</xsl:stylesheet>