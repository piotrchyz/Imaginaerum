<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    xmlns:p5suis="http://biuro.biall-net.pl/xmlschema_procesy5/WPS_Functions/system_ui_info_speech/system_ui_info_speech.xsd"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:include href="p5_test_neuron.Simulation.attract.Stress.xsl"/>
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Simulation.analys.xml">
        <ptn:Simulation.attract.xml>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Attract__x3A__flag.nodes" select="descendant-or-self::*[ptn:Attract__x3A__flag]" tunnel="yes"/>
                <xsl:with-param name="ptn:Stress__x3A__flag.nodes" select="descendant-or-self::*[ptn:Stress__x3A__flag]" tunnel="yes"/>
                <xsl:with-param name="ptn:Defaults" select="doc($ptn:Config)//ptn:Defaults" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body_tick" select="@ptn:Simulation_body_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation.analys.xml" select="." tunnel="yes"/>
            </xsl:apply-templates>
        </ptn:Simulation.attract.xml>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Receptors">
        <xsl:copy>
          <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Receptor|ptn:Nodes|ptn:Leaky_neuron_standard|ptn:Leaky_neuron_inhibitor|ptn:Leaky_neuron_inhibitor__X3A__AA|ptn:Leaky_neuron_inhibitor__x3A__AB|ptn:Leaky_neuron_inhibitor__X3A__AA">
        <xsl:copy>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Simulated_potential|ptn:Receptor_regex_filter|ptn:Current_synapse|ptn:Outputs|ptn:Input__x3A__nodes">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Simulated_potential__x3A__vectors|ptn:Simulated_potential__x3A__vectors.sum">
        <xsl:comment> #40 removed/n <xsl:value-of select="name()"/></xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Output__x3A__flag">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Attract__x3A__flag[preceding-sibling::ptn:Label][preceding-sibling::ptn:Coordinate_X][preceding-sibling::ptn:Coordinate_Z][preceding-sibling::ptn:Coordinate_Y][preceding-sibling::ptn:Simulated_potential][preceding-sibling::ptn:Outputs][following-sibling::ptn:Input__x3A__attract__x3A__vectors]">
        <xsl:param name="ptn:Attract__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <xsl:choose>
            <xsl:when test="count($ptn:Attract__x3A__flag.nodes) &gt;1">
                <xsl:comment> #44 TODO to implement/n <xsl:value-of select="name()"/></xsl:comment>
                <xsl:call-template name="ptn:Simulation.attract__x3A__calculate">
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
                    <xsl:with-param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector" select="following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector" select="following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector" select="following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector" tunnel="yes"/>
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
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="*">
        <xsl:message terminate="yes">#30A unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Output__x3A__flag__x3A__emmit">
        <xsl:comment>#102 todo transform emmit </xsl:comment>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract.xml" match="ptn:Input__x3A__nodes__x3A__prohibit">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template name="ptn:Simulation.attract__x3A__calculate">
        <xsl:param name="ptn:Attract__x3A__flag.nodes" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Stress__x3A__flag" tunnel="yes" required="no"/>
        <!--<xsl:param name="ptn:Label" tunnel="yes" required="yes"/>-->
        <!--<ptn:Simulation.attract__x3A__calculate>
            
        </ptn:Simulation.attract__x3A__calculate>-->
        <xsl:variable name="ptn:Simulation.attract__x3A__calculate">
            <xsl:apply-templates  mode="ptn:Simulation.attract__x3A__calculate" select="$ptn:Attract__x3A__flag.nodes"/>
        </xsl:variable>
        <!--<xsl:copy-of select="$ptn:Simulation.attract__x3A__calculate"/>-->
        <!-- grouping node with nearest -->
        <xsl:comment>#95 lower sorted grouped unique </xsl:comment>
        <xsl:for-each select="$ptn:Simulation.attract__x3A__calculate/ptn:Simulation.attract__x3A__calculate" >
            <xsl:sort select="@ptn:Distance" data-type="number" order="ascending"/>
            <xsl:copy-of select="."/>
        </xsl:for-each>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate" match="*">
        <xsl:message terminate="yes">#92AT unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate" match="ptn:Receptor[ptn:Coordinate_X][ptn:Coordinate_Y][ptn:Coordinate_Z][ptn:Simulated_potential][ptn:Outputs]|ptn:Leaky_neuron_standard|ptn:Leaky_neuron_inhibitor__X3A__AA|ptn:Leaky_neuron_inhibitor__x3A__AB">
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
        <xsl:param name="ptn:Simulation.analys.xml" required="yes" tunnel="yes"/>
        <xsl:variable name="ptn:Output_Node">
            <xsl:call-template name="ptn:Output_Node"/>            
        </xsl:variable>
        <xsl:variable name="ptn:Distance__x3A__minimal" select="min($ptn:Simulation.analys.xml/*[name()='ptn:Receptors' or name()='ptn:Nodes'  ]/*[ptn:Attract__x3A__flag][not(ptn:Label = $ptn:Label )]/math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) )"/>
        <xsl:variable name="ptn:Distance__x3A__current" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
        <xsl:message>#167[ptn:Distance__x3A__minimal][PRE_STATS][<xsl:value-of select="$ptn:Distance__x3A__minimal"/>]  [VS]  [ptn:Distance__x3A__current][<xsl:value-of select="$ptn:Distance__x3A__current"/>]</xsl:message>
        <xsl:choose>
            <xsl:when test="$ptn:Distance__x3A__minimal &lt; $ptn:Distance__x3A__current">
                <xsl:comment>#172 [ptn:Distance__x3A__minimal][PRE_STATS][BYPASSED][ptn:Label][<xsl:value-of select="$ptn:Label"/>] [$ptn:Distance__x3A__minimal][<xsl:value-of select="$ptn:Distance__x3A__minimal"/>]</xsl:comment>
            </xsl:when>
            <xsl:when test="$ptn:Input__x3A__nodes__x3A__prohibit//ptn:Input__x3A__node__x3A__prohibit[text() = $ptn:Label]">
                <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="#80bypassed ptn:Input__x3A__node__x3A__prohibit label=[{ptn:Label}]"><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                </ptn:Simulation.attract__x3A__calculate__x3A__ignored>
            </xsl:when>
            <xsl:when test="ptn:Label = $ptn:Label">
                <!--<xsl:comment>#99bypassed same context label=[<xsl:value-of select="ptn:Label"/>]</xsl:comment>-->
                <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="#99bypassed same context label=[{ptn:Label}]"><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                </ptn:Simulation.attract__x3A__calculate__x3A__ignored>
            </xsl:when>
            <!--<xsl:when test="$ptn:Outputs//ptn:Current_synapse[ptn:Output_Node = 'A' ]">
                <!-\-<xsl:comment>121bypassed - existient Synapse to <xsl:value-of select="ptn:Label"/></xsl:comment>
                <xsl:message>121bypassed - existient Synapse to <xsl:value-of select="ptn:Label"/></xsl:message>-\->
                <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="121bypassed existient Synapse to[{ptn:Label}]"><!-\- 0A create -\->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node" select="$ptn:Output_Node"/>
                </ptn:Simulation.attract__x3A__calculate__x3A__ignored>
            </xsl:when>-->
            <xsl:when test="$ptn:Outputs//ptn:Current_synapse[ptn:Output_Node = $ptn:Output_Node ]">
                <!--<xsl:comment>130bypassed - existient Synapse to <xsl:value-of select="$ptn:Output_Node"/></xsl:comment>
                <xsl:message>130bypassed - existient Synapse to <xsl:value-of select="$ptn:Output_Node"/></xsl:message>-->
                <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="130bypassed  existient Synapse to[$ptn:Output_Node][{$ptn:Output_Node}]"><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                </ptn:Simulation.attract__x3A__calculate__x3A__ignored>
            </xsl:when>
            <xsl:when test="$ptn:Is_inhibitor = 1">
                <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="204bypassed  [$ptn:Is_inhibitor][{$ptn:Is_inhibitor}]"><!-- 0A create -->
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                </ptn:Simulation.attract__x3A__calculate__x3A__ignored>
            </xsl:when>
            <xsl:otherwise>
                <ptn:Simulation.attract__x3A__calculate p5suis:say.PL="Nowy wariant dla węzła {$ptn:Label} oraz {ptn:Label} w scenie nr {$ptn:Simulation_body_tick} ."><!-- 0A create -->
                    
                    <xsl:attribute name="ptn:Label__x3A__context" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Label" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Distance" select="math:sqrt(((ptn:Coordinate_X - $ptn:Coordinate_X) * (ptn:Coordinate_X - $ptn:Coordinate_X)) + ((ptn:Coordinate_Y - $ptn:Coordinate_Y) * (ptn:Coordinate_Y - $ptn:Coordinate_Y)) ) "/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__diff" select="number($ptn:Simulated_potential) - number(ptn:Simulated_potential)"/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__more_charged_node" select="$ptn:Label"/>
                    <xsl:attribute name="ptn:Simulated_potential__x3A__less_charged_node" select="ptn:Label"/>
                    <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node"/>
                    <xsl:attribute name="ptn:debug">#190 std create; [ptn:Outputs/#[<xsl:value-of select="count($ptn:Outputs/*)"/>]] ++[(ptn:Capacitance + $ptn:Capacitance) * 1.2]</xsl:attribute>
                    <ptn:Simulation.attract__x3A__calculate__x3A__output_node>
                        <xsl:variable name="ptn:Input__x3A__nodes"><!-- todo template -->
                            <ptn:Input__x3A__nodes>
                                <ptn:Input__x3A__node><xsl:value-of select="$ptn:Label"/></ptn:Input__x3A__node>
                                <ptn:Input__x3A__node><xsl:value-of select="ptn:Label"/></ptn:Input__x3A__node>
                                <ptn:Input__x3A__node><xsl:value-of select="$ptn:Output_Node//@ptn:Output_Node__x3A__inhibitor"/></ptn:Input__x3A__node>
                            </ptn:Input__x3A__nodes>
                        </xsl:variable>
                        <xsl:attribute name="ptn:Simulation.attract__x3A__calculate__x3A__output_node.type" select="'ptn:Leaky_neuron_standard'"/>
                        <!--<xsl:attribute name="ptn:Inputs" select="concat($ptn:Label,' ',ptn:Label)"/>-->
                        <ptn:Label><xsl:value-of select="$ptn:Output_Node"/></ptn:Label>
                        <!--<ptn:Coordinate_X><xsl:value-of select="abs(ptn:Coordinate_X + $ptn:Coordinate_X) div 3"/></ptn:Coordinate_X>-->
                        <!--<ptn:Coordinate_Y>
                            <xsl:choose>
                                <xsl:when test="number(ptn:Coordinate_Y) &gt; $ptn:Coordinate_Y"><xsl:value-of select="ptn:Coordinate_Y + 10"/></xsl:when><!-\- todo config -\->
                                <xsl:otherwise><xsl:value-of select="$ptn:Coordinate_Y + 10"/></xsl:otherwise>
                            </xsl:choose>
                        </ptn:Coordinate_Y>-->
                        <!--<ptn:Coordinate_Z><xsl:value-of select="$ptn:Simulation_body_tick"/></ptn:Coordinate_Z>-->
                        <ptn:Coordinate_X__calculate__x3A__empty ptn:Coordinate_X__x3A__more_charged_node="{$ptn:Coordinate_X}" ptn:Coordinate_X__x3A__less_charged_node="{ptn:Coordinate_X}"></ptn:Coordinate_X__calculate__x3A__empty>
                        <ptn:Coordinate_Y__calculate__x3A__empty ptn:Coordinate_Y__x3A__more_charged_node="{$ptn:Coordinate_Y}" ptn:Coordinate_Y__x3A__less_charged_node="{ptn:Coordinate_Y}"></ptn:Coordinate_Y__calculate__x3A__empty>
                        <ptn:Coordinate_Z__calculate__x3A__empty ptn:Coordinate_Z__x3A__more_charged_node="{$ptn:Coordinate_Z}" ptn:Coordinate_Z__x3A__less_charged_node="{ptn:Coordinate_Z}"></ptn:Coordinate_Z__calculate__x3A__empty>
                        
                        
                        
                        <ptn:Capacitance ptn:debug="#268 todo __assert"><xsl:value-of select="(ptn:Capacitance + $ptn:Capacitance) * 1.2"/></ptn:Capacitance><!-- todo config strategy -->
                        <ptn:Resistance ptn:debug="#269 todo __assert"><xsl:value-of select="(ptn:Resistance + $ptn:Resistance) div 2"/></ptn:Resistance><!-- todo config strategy -->
                        <ptn:Minimum_voltage ptn:debug="#270 todo __assert"><xsl:value-of select="(ptn:Minimum_voltage + $ptn:Minimum_voltage) div 2"/></ptn:Minimum_voltage><!-- todo config strategy -->
                        <ptn:Maximum_voltage ptn:debug="#272 todo __assert"><xsl:value-of select="(ptn:Maximum_voltage + $ptn:Maximum_voltage) div 2"/></ptn:Maximum_voltage><!-- todo config strategy -->
                        <ptn:Resting_potential ptn:debug="#273 todo __assert"><xsl:value-of select="(ptn:Resting_potential + $ptn:Resting_potential) div 2"/></ptn:Resting_potential><!-- todo config strategy -->
                        <ptn:Reset_potential ptn:debug="#274 todo __assert"><xsl:value-of select="(ptn:Reset_potential + $ptn:Reset_potential) div 2"/></ptn:Reset_potential><!-- todo config strategy -->
                        <ptn:Firing_threshold ptn:debug="#275 todo __assert"><xsl:value-of select="(ptn:Firing_threshold + $ptn:Firing_threshold) div 2"/></ptn:Firing_threshold><!-- todo config strategy -->
                        <ptn:Refactory_period ptn:debug="#276 todo __assert"><xsl:value-of select="(number(ptn:Refactory_period) + number($ptn:Refactory_period)) div 2"/></ptn:Refactory_period><!-- todo config strategy -->
                        <ptn:Is_inhibitor><xsl:value-of select="$ptn:Is_inhibitor"/></ptn:Is_inhibitor>
                        <ptn:Outputs/>
                        <xsl:copy-of select="$ptn:Input__x3A__nodes"/>
                        <ptn:Simulated_potential ptn:debug="#279 todo __assert"><xsl:value-of select="(ptn:Reset_potential + $ptn:Reset_potential) div 2"/></ptn:Simulated_potential><!-- todo config strategy -->
                        <xsl:call-template name="ptn:Input__x3A__attract__x3A__vectors__x3A__calculate">
                            <xsl:with-param name="ptn:Input__x3A__nodes"  select="$ptn:Input__x3A__nodes" tunnel="yes"/>
                        </xsl:call-template>
                        <ptn:Input__x3A__attract__x3A__vectors__calculate__x3A__empty/>
                        <!--<ptn:Receptor_regex_filter>C</ptn:Receptor_regex_filter>-->
                    </ptn:Simulation.attract__x3A__calculate__x3A__output_node>
                    <ptn:Simulation.attract__x3A__calculate__x3A__output_node ptn:debug="#214 inhibitor ">
                        <xsl:variable name="ptn:Input__x3A__nodes"><!-- todo template -->
                            <ptn:Input__x3A__nodes>
                                <ptn:Input__x3A__node><xsl:value-of select="$ptn:Label"/></ptn:Input__x3A__node>
                            </ptn:Input__x3A__nodes>
                        </xsl:variable>
                        <xsl:attribute name="ptn:Simulation.attract__x3A__calculate__x3A__output_node.type" select="'ptn:Leaky_neuron_inhibitor__x3A__AB'"/>
                        <!--<xsl:attribute name="ptn:Inputs" select="$ptn:Label"/>-->
                        <ptn:Label><xsl:value-of select="$ptn:Output_Node//@ptn:Output_Node__x3A__inhibitor"/></ptn:Label>
                        <ptn:Coordinate_X><xsl:value-of select="abs(ptn:Coordinate_X + $ptn:Coordinate_X) div 4"/></ptn:Coordinate_X>
                        <ptn:Coordinate_Y>
                            <xsl:choose>
                                <xsl:when test="number(ptn:Coordinate_Y) &gt; $ptn:Coordinate_Y"><xsl:value-of select="ptn:Coordinate_Y + 5"/></xsl:when><!-- todo config -->
                                <xsl:otherwise><xsl:value-of select="$ptn:Coordinate_Y + 5"/></xsl:otherwise>
                            </xsl:choose>
                        </ptn:Coordinate_Y>
                        <ptn:Coordinate_Z><xsl:value-of select="$ptn:Simulation_body_tick"/></ptn:Coordinate_Z>
                        <ptn:Capacitance><xsl:value-of select="(ptn:Capacitance + $ptn:Capacitance)"/></ptn:Capacitance><!-- todo config strategy -->
                        <ptn:Resistance><xsl:value-of select="(ptn:Resistance + $ptn:Resistance) div 2"/></ptn:Resistance><!-- todo config strategy -->
                        <ptn:Minimum_voltage><xsl:value-of select="(ptn:Minimum_voltage + $ptn:Minimum_voltage) div 2"/></ptn:Minimum_voltage><!-- todo config strategy -->
                        <ptn:Maximum_voltage><xsl:value-of select="(ptn:Maximum_voltage + $ptn:Maximum_voltage) div 2"/></ptn:Maximum_voltage><!-- todo config strategy -->
                        <ptn:Resting_potential><xsl:value-of select="(ptn:Resting_potential + $ptn:Resting_potential) div 2"/></ptn:Resting_potential><!-- todo config strategy -->
                        <ptn:Reset_potential><xsl:value-of select="(ptn:Reset_potential + $ptn:Reset_potential) div 2"/></ptn:Reset_potential><!-- todo config strategy -->
                        <ptn:Firing_threshold><xsl:value-of select="(ptn:Firing_threshold + $ptn:Firing_threshold) div 2"/></ptn:Firing_threshold><!-- todo config strategy -->
                        <ptn:Refactory_period><xsl:value-of select="(number(ptn:Refactory_period) + number($ptn:Refactory_period)) div 2"/></ptn:Refactory_period><!-- todo config strategy -->
                        <ptn:Is_inhibitor><xsl:value-of select="1"/></ptn:Is_inhibitor>
                        <ptn:Outputs>
                            <ptn:Current_synapse ptn:debug="#235 todo use tempalte">
                                <ptn:Maximum_current>3.0</ptn:Maximum_current>
                                <ptn:Time_constant>2.0</ptn:Time_constant>
                                <ptn:Delay>5.0</ptn:Delay>
                                <ptn:Output_Node><xsl:value-of select="$ptn:Output_Node"/></ptn:Output_Node>
                            </ptn:Current_synapse>
                        </ptn:Outputs>
                        
                        <xsl:copy-of select="$ptn:Input__x3A__nodes"/>
                        <ptn:Input__x3A__nodes__x3A__prohibit>
                            <ptn:Input__x3A__node__x3A__prohibit><xsl:value-of select="ptn:Label"/></ptn:Input__x3A__node__x3A__prohibit>
                        </ptn:Input__x3A__nodes__x3A__prohibit>
                        <ptn:Simulated_potential><xsl:value-of select="(ptn:Reset_potential + $ptn:Reset_potential) div 2"/></ptn:Simulated_potential><!-- todo config strategy -->
                        <!--<ptn:Receptor_regex_filter>C</ptn:Receptor_regex_filter>-->
                    </ptn:Simulation.attract__x3A__calculate__x3A__output_node>
                    <ptn:Simulation.attract__x3A__calculate__x3A__output_node ptn:debug="#245 -AA inhibitor {$ptn:Label}--{ptn:Label}">
                        <xsl:variable name="ptn:Input__x3A__nodes"><!-- todo template -->
                            <ptn:Input__x3A__nodes>
                                <ptn:Input__x3A__node><xsl:value-of select="ptn:Label"/></ptn:Input__x3A__node>
                            </ptn:Input__x3A__nodes>
                        </xsl:variable>
                        <xsl:attribute name="ptn:Simulation.attract__x3A__calculate__x3A__output_node.type" select="'ptn:Leaky_neuron_inhibitor__X3A__AA'"/>
                        <!--<xsl:attribute name="ptn:Inputs" select="ptn:Label"/>-->
                        <ptn:Label><xsl:value-of select="$ptn:Output_Node//@ptn:Output_Node__x3A__inhibitor__x3A__self"/></ptn:Label>
                        <ptn:Coordinate_X><xsl:value-of select="abs(ptn:Coordinate_X + $ptn:Coordinate_X) div 5"/></ptn:Coordinate_X>
                        <ptn:Coordinate_Y>
                            <xsl:choose>
                                <xsl:when test="number(ptn:Coordinate_Y) &gt; $ptn:Coordinate_Y"><xsl:value-of select="ptn:Coordinate_Y + 7"/></xsl:when><!-- todo config -->
                                <xsl:otherwise><xsl:value-of select="$ptn:Coordinate_Y + 7"/></xsl:otherwise>
                            </xsl:choose>
                        </ptn:Coordinate_Y>
                        <ptn:Coordinate_Z><xsl:value-of select="$ptn:Simulation_body_tick"/></ptn:Coordinate_Z>
                        <ptn:Capacitance><xsl:value-of select="(ptn:Capacitance + $ptn:Capacitance)"/></ptn:Capacitance><!-- todo config strategy -->
                        <ptn:Resistance><xsl:value-of select="(ptn:Resistance + $ptn:Resistance) div 2"/></ptn:Resistance><!-- todo config strategy -->
                        <ptn:Minimum_voltage><xsl:value-of select="(ptn:Minimum_voltage + $ptn:Minimum_voltage) div 2"/></ptn:Minimum_voltage><!-- todo config strategy -->
                        <ptn:Maximum_voltage><xsl:value-of select="(ptn:Maximum_voltage + $ptn:Maximum_voltage) div 2"/></ptn:Maximum_voltage><!-- todo config strategy -->
                        <ptn:Resting_potential><xsl:value-of select="(ptn:Resting_potential + $ptn:Resting_potential) div 2"/></ptn:Resting_potential><!-- todo config strategy -->
                        <ptn:Reset_potential><xsl:value-of select="(ptn:Reset_potential + $ptn:Reset_potential) div 2"/></ptn:Reset_potential><!-- todo config strategy -->
                        <ptn:Firing_threshold><xsl:value-of select="(ptn:Firing_threshold + $ptn:Firing_threshold) div 2"/></ptn:Firing_threshold><!-- todo config strategy -->
                        <ptn:Refactory_period><xsl:value-of select="(number(ptn:Refactory_period) + number($ptn:Refactory_period)) div 2"/></ptn:Refactory_period><!-- todo config strategy -->
                        <ptn:Is_inhibitor><xsl:value-of select="1"/></ptn:Is_inhibitor>
                        <ptn:Outputs>
                            <ptn:Current_synapse ptn:debug="#266 todo use tempalte">
                                <ptn:Maximum_current>3.0</ptn:Maximum_current>
                                <ptn:Time_constant>2.0</ptn:Time_constant>
                                <ptn:Delay>5.0</ptn:Delay>
                                <ptn:Output_Node><xsl:value-of select="$ptn:Output_Node"/></ptn:Output_Node>
                            </ptn:Current_synapse>
                        </ptn:Outputs>
                        <xsl:copy-of select="$ptn:Input__x3A__nodes"/>
                        <ptn:Input__x3A__nodes__x3A__prohibit>
                            <ptn:Input__x3A__node__x3A__prohibit><xsl:value-of select="$ptn:Label"/></ptn:Input__x3A__node__x3A__prohibit>
                        </ptn:Input__x3A__nodes__x3A__prohibit>
                        <ptn:Simulated_potential><xsl:value-of select="(ptn:Reset_potential + $ptn:Reset_potential) div 2"/></ptn:Simulated_potential><!-- todo config strategy -->
                        <!--<ptn:Receptor_regex_filter>C</ptn:Receptor_regex_filter>-->
                    </ptn:Simulation.attract__x3A__calculate__x3A__output_node>
                </ptn:Simulation.attract__x3A__calculate>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
    
</xsl:stylesheet>