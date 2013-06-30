<xsl:stylesheet xmlns:df="http://dita2indesign.org/dita/functions"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:htmlutil="http://dita4publishers.org/functions/htmlutil"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:dc="http://purl.org/dc/elements/1.1/"
  exclude-result-prefixes="df xs relpath htmlutil xd dc" version="2.0">

  <xsl:output method="html" standalone="no" indent="yes"/>
  <xsl:param name="OUTPUTDEFAULTNAVIGATION" select="false()" />

  <xsl:template match="*[df:class(., 'map/map')]" priority="50" mode="generate-root-pages"/>

  <xsl:template match="*[df:class(., 'map/map')]" priority="50" mode="generate-content">
    <xsl:param name="uniqueTopicRefs" as="element()*" tunnel="yes"/>
    <xsl:param name="rootMapDocUrl" as="xs:string" tunnel="yes"/>
    <xsl:message> + [INFO] Generating webmap content. </xsl:message>
    <xsl:apply-templates select="." mode="generate-webmap-content"/>
    <xsl:message> + [INFO] Content generated.</xsl:message>
  </xsl:template>

  <xsl:template match="*[df:class(., 'map/map')]" mode="generate-webmap-content">  
  	<xsl:apply-templates mode="#current" />
  </xsl:template>
   
  <xsl:template match="*[contains(@class, 'webmap-d/page')]" mode="generate-webmap-content">
    <xsl:param name="rootMapDocUrl" as="xs:string" tunnel="yes"/>
    <xsl:param name="collected-data" as="element()" tunnel="yes"/>
    
    <xsl:variable name="countPages" select="count(preceding-sibling::*[contains(@class, 'webmap-d/page')])" />

	<xsl:variable name="pageIndex">
		<xsl:choose>
			<xsl:when test="@destination">
				<xsl:value-of select="@destination"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$countPages = 0">
						<xsl:value-of select="'index'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('page-', $countPages)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
    <xsl:variable name="topicResultUri" select="concat($pageIndex, $OUTEXT)" as="xs:string"/>
  
    <xsl:variable name="topic-content">
     	<xsl:apply-templates select="*" mode="#current" />
    </xsl:variable>

    <xsl:variable name="relativePath" select="'./'"/>
    
    <xsl:variable name="topic-title" select="'My title'"/>

   <xsl:message>+ [INFO]  Generating page <xsl:value-of select="$topicResultUri" /></xsl:message>
    <xsl:result-document href="{$topicResultUri}" format="indented-xml">
    
     <xsl:apply-templates mode="generate-html5-page" select=".">
        <xsl:with-param name="relativePath" select="$relativePath" as="xs:string" tunnel="yes"/>
        <xsl:with-param name="content" select="$topic-content" tunnel="yes"/>
        <xsl:with-param name="topic-title" select="$topic-title" tunnel="yes"/>
        <xsl:with-param name="is-root" select="false()" tunnel="yes"/>
      </xsl:apply-templates>
    </xsl:result-document>
  </xsl:template>

</xsl:stylesheet>
