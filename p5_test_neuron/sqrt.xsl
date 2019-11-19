<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:system_cache__appinfo="http://biuro.biall-net.pl/xmlschema_procesy5/default_db_xml_cache/appinfo.xsd"
    xmlns:math="http://exslt.org/math"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:function name="math:sqrt">
        <xsl:param name="number"/>
        <xsl:call-template name="math:sqrt">
            <xsl:with-param name="number" select="$number"/>
        </xsl:call-template>
    </xsl:function>
    
    <xsl:template name="math:sqrt">
        <!--  The number you want to find the square root of  -->
        <xsl:param name="number"
            select="0" />
        <!--  The current 'try'.  This is used internally.  -->
        <xsl:param name="try"
            select="1" />
        <!--  The current iteration, checked against maxiter to limit loop count  -->
        <xsl:param name="iter"
            select="1" />
        <!--  Set this up to ensure against infinite loops  -->
        <xsl:param name="maxiter"
            select="10" />
        <!--  This template was written by Nate Austin using Sir Isaac Newton's
       method of finding roots  -->
        <xsl:choose>
            <xsl:when test="$try * $try = $number or $iter > $maxiter">
                <xsl:value-of select="$try" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="math:sqrt">
                    <xsl:with-param name="number"
                        select="$number" />
                    <xsl:with-param name="try"
                        select="$try - (($try * $try - $number) div (2 * $try))" />
                    <xsl:with-param name="iter"
                        select="$iter + 1" />
                    <xsl:with-param name="maxiter"
                        select="$maxiter" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
</xsl:stylesheet>