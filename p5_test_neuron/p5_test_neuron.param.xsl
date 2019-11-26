<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:math="http://exslt.org/math"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    <xsl:param name="ptn:Config" required="yes"/>
    <xsl:param name="ptn:Simulation_ticks" required="yes"/>
    
    <xsl:param name="ptn:Simulation.dir" required="yes"/>
    <xsl:param name="ptn:basedir" required="yes"/>
    <xsl:param name="ptn:Inputs" required="yes"/>
    <xsl:param name="basedir" required="yes"/>
    
    <xsl:param name="ptn:xsl" required="yes"/>
    
    <xsl:param name="ptn:xsd" required="yes"/>
    
    
    <xsl:param name="ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage" select="-70"/>
    <xsl:param name="ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage" select="90"/>
    
</xsl:stylesheet>