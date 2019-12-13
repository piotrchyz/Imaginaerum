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
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Simulation.Stress__x3A__calculate__x3A__output_node">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Simulation.Stress__x3A__calculate">
        <xsl:comment >#74M to implement context attract/n[<xsl:value-of select="name()"/>]</xsl:comment>
        <!--<xsl:apply-templates mode="#current">
            <xsl:with-param name="ptn:Label" select="preceding-sibling::ptn:Label" tunnel="yes"/>
        </xsl:apply-templates>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Stress__x3A__flag">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:comment>#59X TODO handle this flag when created model stale flag that was used</xsl:comment>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.Stress__x3A__calculate.best.unique">
        <ptn:Simulation.Stress__x3A__calculate.best.unique>
            <xsl:copy-of select="descendant-or-self::ptn:Simulation.Stress__x3A__calculate"/>
        </ptn:Simulation.Stress__x3A__calculate.best.unique>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="*">
        <xsl:message terminate="yes">#257 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.Stress__x3A__calculate">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.Stress__x3A__calculate.best.unique">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.Stress__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type]">
        <xsl:comment>#296 stress installed</xsl:comment>
        <!--<xsl:element name="{@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type}">
            <xsl:copy-of select="*"/>
        </xsl:element>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.Stress__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type]">
        <xsl:comment>#296 stress installed</xsl:comment>
        <xsl:element name="{@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type}">
            <xsl:copy-of select="*"/>
        </xsl:element>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="*">
        <xsl:message terminate="yes">#130 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.Stress__x3A__calculate.best.unique">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.Stress__x3A__calculate[@ptn:Simulated_potential__x3A__less_charged_node][@ptn:Simulated_potential__x3A__more_charged_node][@ptn:Output_Node]">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <ptn:Current_synapse ptn:debug="#173-341A todo use derive synape from parents instead config">
            <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
            <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
            <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
            <!--<ptn:Output_Node><xsl:value-of select="@ptn:Label"/></ptn:Output_Node>-->
            <ptn:Output_Node><xsl:value-of select="@ptn:Output_Node"/></ptn:Output_Node>
        </ptn:Current_synapse>            
    </xsl:template>
    
    
    
</xsl:stylesheet>