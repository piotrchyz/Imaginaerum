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
    
    
                                                                                                             
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__aggregate__x3A__validated">
        <xsl:comment>#16 MI[/n][<xsl:value-of select="name()"/>]</xsl:comment>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__ignored"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="*">
        <xsl:message terminate="yes">#209M Unantended[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate.best.unique">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__validated[@ptn:Label__x3A__context][@ptn:Label]">
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <xsl:variable name="ptn:Output_Node">
            <xsl:call-template name="ptn:Output_Node">
                <xsl:with-param name="ptn:Label" select="@ptn:Label__x3A__context" tunnel="yes"/>
            </xsl:call-template>            
        </xsl:variable>
        <!--<xsl:copy>
            <xsl:attribute name="ptn:debug" ><xsl:value-of select="@ptn:debug"/>; #230 just debug $ptn:Output_Node=<xsl:value-of select="$ptn:Output_Node"/></xsl:attribute>
            <xsl:copy-of select="text()"/>
        </xsl:copy>-->
        <xsl:apply-templates mode="#current"/>
        <!--<ptn:Leaky_neuron_standard ptn:debug="{@ptn:debug}; #233 todo another context than default">
            <ptn:Label><xsl:value-of select="$ptn:Output_Node"/></ptn:Label>
            <ptn:Coordinate_X>/2</ptn:Coordinate_X>
            <ptn:Coordinate_Y>+10</ptn:Coordinate_Y>
            <ptn:Capacitance>0.8</ptn:Capacitance>
        </ptn:Leaky_neuron_standard>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[following-sibling::ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor__x3A__AB']][@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type][ptn:Input__x3A__nodes]">
        <xsl:param name="ptn:Simulation_body_tick" tunnel="yes" required="yes"/>
        <xsl:element name="{@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type}" >
            <xsl:attribute name="ptn:debug">#317M  #324M @tick[<xsl:value-of select="$ptn:Simulation_body_tick"/>] <xsl:value-of select="@ptn:Inputs"/><xsl:text> </xsl:text><xsl:value-of select="following-sibling::ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor__x3A__AB']/ptn:Label"/></xsl:attribute>
            <xsl:attribute name="ptn:New" select="true()"/>
            <!--<xsl:apply-templates></xsl:apply-templates>-->
            <xsl:copy-of select="*"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type][ptn:Input__x3A__nodes]">
        <xsl:param name="ptn:Simulation_body_tick" tunnel="yes" required="yes"/>
        <xsl:element name="{@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type}" >
            <xsl:attribute name="ptn:debug">#324M @tick[<xsl:value-of select="$ptn:Simulation_body_tick"/>]</xsl:attribute>
            <xsl:attribute name="ptn:New" select="true()"/>
            <xsl:copy-of select="*"/>
        </xsl:element>
    </xsl:template>
    
    
    
</xsl:stylesheet>