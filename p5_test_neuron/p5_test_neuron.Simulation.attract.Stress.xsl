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
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Stress__x3A__flag">
        <xsl:param name="ptn:Attract__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Stress__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <xsl:copy-of select="."/>
        <xsl:comment>#51AX unsupported /n[<xsl:value-of select="name()"/>]</xsl:comment>
        
        <xsl:choose>
            <xsl:when test="count($ptn:Attract__x3A__flag.nodes) = 0 or 1=1">
                <xsl:comment> #44AA TODO to implement/n <xsl:value-of select="name()"/></xsl:comment>
                <xsl:call-template name="ptn:Simulation.Stress__x3A__calculate">
                    <xsl:with-param name="ptn:Label" select="preceding-sibling::ptn:Label" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_X" select="preceding-sibling::ptn:Coordinate_X" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_Y" select="preceding-sibling::ptn:Coordinate_Y" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_Z" select="preceding-sibling::ptn:Coordinate_Z" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulated_potential" tunnel="yes" select="preceding-sibling::ptn:Simulated_potential"/>
                    <xsl:with-param name="ptn:Outputs" select="preceding-sibling::ptn:Outputs" tunnel="yes"/>
                    <xsl:with-param name="ptn:Capacitance" select="preceding-sibling::ptn:Capacitance" tunnel="yes"/>
                    <xsl:with-param name="ptn:Resistance" select="preceding-sibling::ptn:Resistance" tunnel="yes"/>
                    <xsl:with-param name="ptn:Minimum_voltage" select="preceding-sibling::ptn:Minimum_voltage" tunnel="yes"/>
                    <xsl:with-param name="ptn:Maximum_voltage" select="preceding-sibling::ptn:Maximum_voltage" tunnel="yes"/>
                    <xsl:with-param name="ptn:Resting_potential" select="preceding-sibling::ptn:Resting_potential" tunnel="yes"/><!--  | $ptn:Defaults/ptn:Resting_potential and not(preceding-sibling::ptn:Resting_potential)) -->
                    <xsl:with-param name="ptn:Reset_potential" select="preceding-sibling::ptn:Reset_potential" tunnel="yes"/><!-- or $ptn:Defaults/ptn:Reset_potential -->
                    <xsl:with-param name="ptn:Firing_threshold" select="preceding-sibling::ptn:Firing_threshold" tunnel="yes"/>
                    <xsl:with-param name="ptn:Adaptation_conductance" select="preceding-sibling::ptn:Adaptation_conductance" tunnel="yes"/>
                    <xsl:with-param name="ptn:Adaptation_time_constant" select="preceding-sibling::ptn:Adaptation_time_constant" tunnel="yes"/>
                    <xsl:with-param name="ptn:Refactory_period" select="preceding-sibling::ptn:Refactory_period" tunnel="yes"/>
                    <!--<xsl:with-param name="ptn:Maximum_current" select="preceding-sibling::ptn:Maximum_current" tunnel="yes"/>-->
                    <!--<xsl:with-param name="ptn:Time_constant" select="preceding-sibling::ptn:Time_constant" tunnel="yes"/>-->
                    <xsl:with-param name="ptn:Is_inhibitor" select="preceding-sibling::ptn:Is_inhibitor" tunnel="yes"/>
                    <xsl:with-param name="ptn:Input__x3A__nodes__x3A__prohibit" select="preceding-sibling::ptn:Input__x3A__nodes__x3A__prohibit" tunnel="yes"/>
                    <xsl:with-param name="ptn:Stress__x3A__flag" select="." tunnel="yes"/>
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
    
    
    <xsl:template name="ptn:Simulation.Stress__x3A__calculate">
        <xsl:param name="ptn:Stress__x3A__flag.nodes" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Stress__x3A__flag" tunnel="yes" required="no"/>
        <!--<xsl:param name="ptn:Label" tunnel="yes" required="yes"/>-->
        <!--<ptn:Simulation.attract__x3A__calculate>
            
        </ptn:Simulation.attract__x3A__calculate>-->
        <xsl:variable name="ptn:Simulation.Stress__x3A__calculate">
            <xsl:apply-templates  mode="ptn:Simulation.Stress__x3A__calculate" select="$ptn:Stress__x3A__flag.nodes"/>
        </xsl:variable>
        <!--<xsl:copy-of select="$ptn:Simulation.Stress__x3A__calculate"/>-->
        <!-- grouping node with nearest -->
        <xsl:comment>#180 lower sorted grouped unique  STRES?[<xsl:value-of select="$ptn:Stress__x3A__flag"/>]</xsl:comment>
        <xsl:for-each select="$ptn:Simulation.Stress__x3A__calculate/ptn:Simulation.Stress__x3A__calculate" >
            <xsl:sort select="@ptn:Distance" data-type="number" order="ascending"/>
            <xsl:copy-of select="."/>
        </xsl:for-each>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate" match="*">
        <xsl:message terminate="yes">#189 STRESS unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.Stress__x3A__calculate" match="ptn:Receptor[ptn:Coordinate_X][ptn:Coordinate_Y][ptn:Coordinate_Z][ptn:Simulated_potential]|ptn:Leaky_neuron_standard">
        <xsl:param name="ptn:Label" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_X" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_Y" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_Z" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulated_potential" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Outputs" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Capacitance" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Resistance" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Minimum_voltage" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Maximum_voltage"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Resting_potential"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Reset_potential" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Firing_threshold"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Adaptation_conductance"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Adaptation_time_constant"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Refactory_period" required="yes" tunnel="yes"/>
        <!--<xsl:with-param name="ptn:Maximum_current" select="preceding-sibling::ptn:Maximum_current" tunnel="yes"/>-->
        <!--<xsl:with-param name="ptn:Time_constant" select="preceding-sibling::ptn:Time_constant" tunnel="yes"/>-->
        <xsl:param name="ptn:Is_inhibitor"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Input__x3A__nodes__x3A__prohibit" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation_body_tick" required="yes" tunnel="yes"/>
        <xsl:variable name="ptn:Output_Node">
            <xsl:call-template name="ptn:Output_Node"/>            
        </xsl:variable>
        
        
        <xsl:choose>
            <xsl:when test="descendant-or-self::ptn:Input__x3A__node[text() = $ptn:Label]">
                <ptn:Simulation.Stress__x3A__calculate__x3A__ignored ptn:debug="#1000  BYPASSED pexistient descendant-or-self::tn:Input__x3A__node[text() = $ptn:Label]=[{$ptn:Label}]"><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                </ptn:Simulation.Stress__x3A__calculate__x3A__ignored>
            </xsl:when>
            <xsl:when test="descendant-or-self::ptn:Label[text() = $ptn:Output_Node]">
                <ptn:Simulation.Stress__x3A__calculate__x3A__ignored ptn:debug="#132 BYPASSED pexistient $ptn:Output_Node[ptn:Label]=[{$ptn:Output_Node}]"><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                </ptn:Simulation.Stress__x3A__calculate__x3A__ignored>
            </xsl:when>
            <xsl:when test="$ptn:Input__x3A__nodes__x3A__prohibit//ptn:Input__x3A__node__x3A__prohibit[text() = $ptn:Label]">
                <ptn:Simulation.Stress__x3A__calculate__x3A__ignored ptn:debug="#80Abypassed ptn:Input__x3A__node__x3A__prohibit label=[{ptn:Label}]"><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                </ptn:Simulation.Stress__x3A__calculate__x3A__ignored>
            </xsl:when>
            <xsl:when test="ptn:Label = $ptn:Label">
                <!--<xsl:comment>#99bypassed same context label=[<xsl:value-of select="ptn:Label"/>]</xsl:comment>-->
                <ptn:Simulation.Stress__x3A__calculate__x3A__ignored ptn:debug="#99AAbypassed same context label=[{ptn:Label}]"><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                </ptn:Simulation.Stress__x3A__calculate__x3A__ignored>
                
                <ptn:Simulation.Stress__x3A__calculate><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__more_charged_node" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__less_charged_node" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                    <xsl:attribute name="ptn:debug">#190XX@  create more clone, reconfigure self, mabe some inhibitors install std create; [ptn:Outputs/#[<xsl:value-of select="count($ptn:Outputs/*)"/>]]  n[<xsl:value-of select="name()"/>]</xsl:attribute>
                    <ptn:Simulation.Stress__x3A__calculate__x3A__output_node>
                        <xsl:attribute name="ptn:Simulation.attract__x3A__calculate__x3A__output_node.type" select="'ptn:Leaky_neuron_standard'"/>
                        <!--<xsl:attribute name="ptn:Inputs" select="concat($ptn:Label,' ',ptn:Label)"/>-->
                        <ptn:Label><xsl:value-of select="$ptn:Output_Node"/></ptn:Label>
                        <ptn:Coordinate_X><xsl:value-of select="ptn:Coordinate_X"/></ptn:Coordinate_X>
                        <ptn:Coordinate_Y><xsl:value-of select="ptn:Coordinate_Y + 10"/></ptn:Coordinate_Y>
                        
                        <ptn:Coordinate_Z><xsl:value-of select="$ptn:Simulation_body_tick"/></ptn:Coordinate_Z>
                        <ptn:Capacitance><xsl:value-of select="ptn:Capacitance"/></ptn:Capacitance><!-- todo config strategy -->
                        <ptn:Resistance><xsl:value-of select="ptn:Resistance"/></ptn:Resistance><!-- todo config strategy -->
                        <ptn:Minimum_voltage><xsl:value-of select="ptn:Minimum_voltage"/></ptn:Minimum_voltage><!-- todo config strategy -->
                        <ptn:Maximum_voltage><xsl:value-of select="ptn:Maximum_voltage"/></ptn:Maximum_voltage><!-- todo config strategy -->
                        <ptn:Resting_potential><xsl:value-of select="ptn:Resting_potential"/></ptn:Resting_potential><!-- todo config strategy -->
                        <ptn:Reset_potential><xsl:value-of select="ptn:Reset_potential"/></ptn:Reset_potential><!-- todo config strategy -->
                        <ptn:Firing_threshold><xsl:value-of select="ptn:Firing_threshold"/></ptn:Firing_threshold><!-- todo config strategy -->
                        <ptn:Refactory_period><xsl:value-of select="ptn:Refactory_period"/></ptn:Refactory_period><!-- todo config strategy -->
                        <ptn:Is_inhibitor><xsl:value-of select="ptn:Is_inhibitor"/></ptn:Is_inhibitor>
                        <ptn:Outputs/>
                        <ptn:Input__x3A__nodes>
                            <ptn:Input__x3A__node><xsl:value-of select="ptn:Label"/></ptn:Input__x3A__node>
                        </ptn:Input__x3A__nodes>
                        <ptn:Input__x3A__nodes__x3A__prohibit>
                            <ptn:Input__x3A__node__x3A__prohibit><xsl:value-of select="ptn:Label"/></ptn:Input__x3A__node__x3A__prohibit>
                        </ptn:Input__x3A__nodes__x3A__prohibit>
                        <ptn:Simulated_potential><xsl:value-of select="ptn:Reset_potential"/></ptn:Simulated_potential><!-- todo config strategy -->
                        <!--<ptn:Receptor_regex_filter>C</ptn:Receptor_regex_filter>-->
                    </ptn:Simulation.Stress__x3A__calculate__x3A__output_node>
                    
                    
                </ptn:Simulation.Stress__x3A__calculate>
                
            </xsl:when>
            
            <xsl:when test="$ptn:Outputs//ptn:Current_synapse[ptn:Output_Node = $ptn:Output_Node ]">
                <!--<xsl:comment>130bypassed - existient Synapse to <xsl:value-of select="$ptn:Output_Node"/></xsl:comment>
                <xsl:message>130bypassed - existient Synapse to <xsl:value-of select="$ptn:Output_Node"/></xsl:message>-->
                <ptn:Simulation.Stress__x3A__calculate__x3A__ignored ptn:debug="130XXbypassed  existient Synapse to[$ptn:Output_Node][{$ptn:Output_Node}]"><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                </ptn:Simulation.Stress__x3A__calculate__x3A__ignored>
            </xsl:when>
            <xsl:otherwise>
                
            </xsl:otherwise>
        </xsl:choose>
        
        
    </xsl:template>
    
    
</xsl:stylesheet>