<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Simulation_body">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
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
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Simulated_potential|ptn:Receptor_regex_filter|ptn:Current_synapse|ptn:Outputs">
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
    
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Attract__x3A__flag[preceding-sibling::ptn:Label][preceding-sibling::ptn:Coordinate_X][preceding-sibling::ptn:Coordinate_Y][preceding-sibling::ptn:Simulated_potential][preceding-sibling::ptn:Outputs]">
        <xsl:param name="ptn:Attract__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="count($ptn:Attract__x3A__flag.nodes) &gt;1">
                <xsl:comment> #44 TODO to implement/n <xsl:value-of select="name()"/></xsl:comment>
                <xsl:call-template name="ptn:Simulation.attract__x3A__calculate">
                    <xsl:with-param name="ptn:Label" select="preceding-sibling::ptn:Label" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_X" select="preceding-sibling::ptn:Coordinate_X" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_Y" select="preceding-sibling::ptn:Coordinate_Y" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulated_potential" tunnel="yes" select="preceding-sibling::ptn:Simulated_potential"/>
                    <xsl:with-param name="ptn:Outputs" select="preceding-sibling::ptn:Outputs" tunnel="yes"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <!--<xsl:attribute name="ptn:Attract__x3A__flag.nodes.count" select="count($ptn:Attract__x3A__flag.nodes)"/>-->
                    <xsl:copy-of select="text()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="*">
        <xsl:message terminate="yes">#30A unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.attract__x3A__calculate">
        <xsl:param name="ptn:Attract__x3A__flag.nodes" tunnel="yes" required="yes"/>
        <!--<xsl:param name="ptn:Label" tunnel="yes" required="yes"/>-->
        <!--<ptn:Simulation.attract__x3A__calculate>
            
        </ptn:Simulation.attract__x3A__calculate>-->
        <xsl:variable name="ptn:Simulation.attract__x3A__calculate">
            <xsl:apply-templates  mode="ptn:Simulation.attract__x3A__calculate" select="$ptn:Attract__x3A__flag.nodes"/>
        </xsl:variable>
        <!--<xsl:copy-of select="$ptn:Simulation.attract__x3A__calculate"/>-->
        <!-- grouping node with nearest -->
        <xsl:comment>#95 lower sorted grouped unique</xsl:comment>
        <xsl:for-each select="$ptn:Simulation.attract__x3A__calculate/ptn:Simulation.attract__x3A__calculate" >
            <xsl:sort select="@ptn:Distance" data-type="number" order="ascending"/>
            <xsl:copy-of select="."/>
        </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate" match="*">
        <xsl:message terminate="yes">#92AT unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate" match="ptn:Receptor[ptn:Coordinate_X][ptn:Coordinate_Y][ptn:Simulated_potential][ptn:Outputs]">
        <xsl:param name="ptn:Label" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_X" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_Y" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulated_potential" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Outputs" required="yes" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="ptn:Label = $ptn:Label">
                <xsl:comment>
                    #99 bypassed same context label=[<xsl:value-of select="ptn:Label"/>]
                </xsl:comment>
            </xsl:when>
            <xsl:when test="$ptn:Outputs//ptn:Current_synapse[ptn:Output_Node/text() = 'A' ]">
                <xsl:comment>121bypassed - existient Synapse to <xsl:value-of select="ptn:Label"/></xsl:comment>
                <xsl:message>121bypassed - existient Synapse to <xsl:value-of select="ptn:Label"/></xsl:message>
            </xsl:when>
            <xsl:otherwise>
                <ptn:Simulation.attract__x3A__calculate><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                </ptn:Simulation.attract__x3A__calculate>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
    
</xsl:stylesheet>