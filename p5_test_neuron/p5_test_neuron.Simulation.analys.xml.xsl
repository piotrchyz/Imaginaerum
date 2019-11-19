<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
   
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Config">
        <xsl:message>#13 todo ptn:Config</xsl:message>
        <xsl:copy></xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="*">
        <xsl:message>#15 todo <xsl:value-of select="name()"/></xsl:message>
    </xsl:template>
    
</xsl:stylesheet>