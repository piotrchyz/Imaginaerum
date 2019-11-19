<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:include href="p5_test_neuron.Simulation.analys.xml.Simulated_potential.xsl"/>
   
   
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Config[ptn:Simulation[ptn:Simulator_tick]][ptn:Inputs][ptn:Defaults[ptn:Attract_min]]">
        <xsl:message>#13 todo ptn:Config</xsl:message>
        <ptn:Simulation_body
            xsi:schemaLocation="p5_test_neuron file:{$ptn:xsd}"
            >
            <xsl:attribute name="ptn:Simulation_body_tick" select="1"/>
            <xsl:attribute name="ptn:Simulation_body_time" select="ptn:Simulation/ptn:Simulator_tick"/>
            <xsl:attribute name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick"/>
            <!--<xsl:apply-templates mode="#current" select="@*"/>-->
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Inputs" select="ptn:Inputs" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body_time" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Attract_min" tunnel="yes" select="ptn:Defaults/ptn:Attract_min"/>
            </xsl:apply-templates>
            <ptn:Nodes>
                
            </ptn:Nodes>
        </ptn:Simulation_body>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Simulation_body[@ptn:Simulator_tick][@ptn:Simulation_body_time]">
        <xsl:message>#14 todo ptn:Config</xsl:message>
        <xsl:copy>
            <xsl:copy-of select="@xsi:schemaLocation"/>
            <xsl:attribute name="ptn:Simulation_body_tick" select="@ptn:Simulation_body_tick + 1"/>
            <xsl:attribute name="ptn:Simulation_body_time" select="@ptn:Simulation_body_time + @ptn:Simulator_tick"/>
            <xsl:copy-of select="@ptn:Simulator_tick"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulator_tick" select="@ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body_time" select="@ptn:Simulation_body_time + @ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Inputs" select="doc($ptn:Config)//ptn:Inputs" tunnel="yes"/>
                <xsl:with-param name="ptn:Attract_min" select="doc($ptn:Config)//ptn:Defaults/ptn:Attract_min" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Receptors|ptn:Receptor">
        <xsl:copy>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Current_synapse|ptn:Receptor_regex_filter">
        <xsl:copy>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Inputs">
        <xsl:comment>#51 ptn:Inputs transformed</xsl:comment>
    </xsl:template>
    
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Simulation">
        <xsl:comment>#59 transformed ptn:Simulation</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Simulated_potential">
            <xsl:call-template name="ptn:Simulated_potential"/>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="text()">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Defaults|ptn:Simulated_potential__x3A__vectors|ptn:Simulated_potential__x3A__vectors.sum">
        <xsl:message >#52 bypassed <xsl:value-of select="name()"/></xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="*">
        <xsl:message terminate="yes">#15 todo <xsl:value-of select="name()"/></xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Nodes">
        <xsl:copy>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Output__x3A__flag|ptn:Stress__x3A__flag|ptn:Attract__x3A__flag">
        <xsl:comment>#107 todo implement n/[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    
</xsl:stylesheet>