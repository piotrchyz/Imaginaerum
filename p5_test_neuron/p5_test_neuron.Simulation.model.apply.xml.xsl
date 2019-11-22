<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulation_body">
        <xsl:message>#16 [ptn:Simulation.model.apply.xml]</xsl:message>
        <xsl:copy-of select="."/>
    </xsl:template>
    
</xsl:stylesheet>