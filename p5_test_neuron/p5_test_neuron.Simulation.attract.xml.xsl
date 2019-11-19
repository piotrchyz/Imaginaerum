<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Simulation_body">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:Simulation.attract.xml" select="true()"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Attract__x3A__flag.nodes" select="descendant-or-self::*[ptn:Attract__x3A__flag]" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Receptors">
        <xsl:copy>
          <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Receptor|ptn:Nodes">
        <xsl:copy>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Simulated_potential|ptn:Receptor_regex_filter">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Simulated_potential__x3A__vectors|ptn:Simulated_potential__x3A__vectors.sum">
        <xsl:comment> #40 removed/n <xsl:value-of select="name()"/></xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Output__x3A__flag">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Stress__x3A__flag">
        <xsl:copy-of select="."/>
        <xsl:message terminate="yes">#51A unsupported /n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Attract__x3A__flag">
        <xsl:param name="ptn:Attract__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="count($ptn:Attract__x3A__flag.nodes) &gt;1">
                <xsl:comment> #44 TODO to implement/n <xsl:value-of select="name()"/></xsl:comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:attribute name="ptn:Attract__x3A__flag.nodes.count" select="count($ptn:Attract__x3A__flag.nodes)"/>
                    <xsl:copy-of select="text()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="*">
        <xsl:message terminate="yes">#30A unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
</xsl:stylesheet>