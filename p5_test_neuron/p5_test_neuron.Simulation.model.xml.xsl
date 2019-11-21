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
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Simulation_body">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:variable name="ptn:Simulation.attract__x3A__calculate.best.unique">
                <xsl:call-template name="ptn:Simulation.attract__x3A__calculate.best.unique"/>
            </xsl:variable>
            <xsl:for-each select="$ptn:Simulation.attract__x3A__calculate.best.unique/*">
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <ptn:Simulation.attract__x3A__calculate.best.unique__x3A__debug>
                        <xsl:for-each select="*">
                            <xsl:copy>
                                <xsl:copy-of select="@*"/>
                                <xsl:for-each select="ptn:Simulation.attract__x3A__calculate__x3A__output_node">
                                    <xsl:copy>
                                        <xsl:copy-of select="@*"/>
                                        <xsl:copy-of select="ptn:Label"/>
                                        <xsl:for-each select="ptn:Outputs">
                                           <xsl:copy>
                                               <xsl:for-each select="ptn:Current_synapse">
                                                   <xsl:copy-of select="ptn:Output_Node"/>
                                               </xsl:for-each>
                                           </xsl:copy>
                                        </xsl:for-each>
                                    </xsl:copy>
                                </xsl:for-each>
                            </xsl:copy>
                        </xsl:for-each>
                    </ptn:Simulation.attract__x3A__calculate.best.unique__x3A__debug>
                </xsl:copy>
            </xsl:for-each>
            <!--<xsl:copy-of select="$ptn:Simulation.attract__x3A__calculate.best.unique"/>-->
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulation.attract__x3A__calculate.best.unique" select="$ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes"/>
                <xsl:with-param name="ptn:Defaults" select="doc($ptn:Config)//ptn:Defaults" tunnel="yes"/>
                <!-- todo choose best only attracts  -->
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Output__x3A__flag__x3A__emmit">
        <xsl:comment >#59M unintended/n[<xsl:value-of select="name()"/>]</xsl:comment>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Output__x3A__flag">
        <xsl:comment >#57M unintended/n[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="*">
        <xsl:message terminate="yes">#29M unintended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Input__x3A__nodes__x3A__prohibit">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Receptors">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Nodes">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" select="$ptn:Simulation.attract__x3A__calculate.best.unique"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Receptor[ptn:Label]|ptn:Leaky_neuron_standard[ptn:Label]|ptn:Leaky_neuron_inhibitor[ptn:Label]|ptn:Leaky_neuron_inhibitor__x3A__AB[ptn:Label]|ptn:Leaky_neuron_inhibitor__X3A__AA[ptn:Label]">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Simulated_potential|ptn:Receptor_regex_filter|ptn:Current_synapse|ptn:Input__x3A__nodes|ptn:Input__x3A__node">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Output_Node|ptn:Maximum_current|ptn:Time_constant|ptn:Delay">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Outputs">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <!--<xsl:param name="ptn:Label" tunnel="yes" required="yes"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" select="$ptn:Simulation.attract__x3A__calculate.best.unique"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Attract__x3A__flag">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:comment>#59 TODO handle this flag when created model stale flag that was used</xsl:comment>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Simulation.attract__x3A__calculate">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:comment>#58M bypassed/n[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="text()">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    
    <xsl:template name="ptn:Simulation.attract__x3A__calculate.best.unique">
        <xsl:variable name="ptn:Simulation.attract__x3A__calculate.best.unique">
            <ptn:Simulation.attract__x3A__calculate.best.unique ptn:debug="#133 just for devel analys, passed to childs">
                <xsl:for-each-group select="descendant-or-self::ptn:Simulation.attract__x3A__calculate[number(@ptn:Simulated_potential__x3A__diff) &gt; 0 ]" group-by="@ptn:Label">
                    <xsl:sort select="@ptn:Distance" data-type="number" order="ascending"/>
                    <xsl:copy>
                        <xsl:attribute name="ptn:Simulation.attract__x3A__calculate.best.unique.position" select="position()"/>
                        <!--<xsl:attribute name="prec_silb" select="current()/preceding-sibling::ptn:Simulation.attract__x3A__calculate/@ptn:Label"/>--><!-- and not(current()/preceding-sibling::ptn:Simulation.attract__x3A__calculate/@ptn:Label__x3A__context = current()/@ptn:Label) -->
                        <xsl:copy-of select="@*"/>
                        <xsl:copy-of select="*"/>
                    </xsl:copy>
                </xsl:for-each-group>
            </ptn:Simulation.attract__x3A__calculate.best.unique>
        </xsl:variable>
        <ptn:Simulation.attract__x3A__calculate.best.unique>
            <xsl:for-each select="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate">
                <xsl:variable name="ptn:Simulation.attract__x3A__calculate.best.unique.position" select="@ptn:Simulation.attract__x3A__calculate.best.unique.position"/>
                
                <xsl:choose>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context = current()/@ptn:Label and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <!--<xsl:comment>#67Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>-->
                        <!--<xsl:message>#67Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:message>-->
                        <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="67Mignored {@ptn:Label__x3A__context} to {@ptn:Label}"></ptn:Simulation.attract__x3A__calculate__x3A__ignored>
                    </xsl:when>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context = current()/@ptn:Label__x3A__context and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <!--<xsl:comment>#111Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>
                        <xsl:message>#111Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:message>-->
                        <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="111Mignored {@ptn:Label__x3A__context} to {@ptn:Label}"></ptn:Simulation.attract__x3A__calculate__x3A__ignored>
                    </xsl:when>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context = current()/@ptn:Label__x3A__context and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <!--<xsl:comment>#131Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>
                        <xsl:message>#131Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:message>-->
                        <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="131Mignored {@ptn:Label__x3A__context} to {@ptn:Label}"></ptn:Simulation.attract__x3A__calculate__x3A__ignored>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:copy-of select="@*"/>
                            <xsl:attribute name="ptn:debug" select="concat(@ptn:Label__x3A__context,'to',@ptn:Label)"/>
                            <!--<xsl:attribute name="debug.Output_Node" select="$ptn:Output_Node"/>-->
                            <xsl:copy-of select="text()"/>
                            <xsl:copy-of select="*"/>
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </ptn:Simulation.attract__x3A__calculate.best.unique>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate.best.unique">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate[@ptn:Simulated_potential__x3A__less_charged_node][@ptn:Simulated_potential__x3A__more_charged_node][@ptn:Output_Node]">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <!--<xsl:variable name="ptn:Output_Node"><xsl:call-template name="ptn:Output_Node"/></xsl:variable>-->
        <xsl:choose>
            <xsl:when test="$ptn:Label = @ptn:Simulated_potential__x3A__less_charged_node"><!-- $ptn:Label = @ptn:Label__x3A__context or $ptn:Label = @ptn:Label -->
                <ptn:Current_synapse ptn:debug="#173A todo use derive synape from parents instead config">
                    <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
                    <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
                    <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
                    <!--<ptn:Output_Node><xsl:value-of select="@ptn:Label"/></ptn:Output_Node>-->
                    <ptn:Output_Node><xsl:value-of select="@ptn:Output_Node"/></ptn:Output_Node>
                </ptn:Current_synapse>
                <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__less_charged_node"/>
            </xsl:when>
            <xsl:when test="$ptn:Label = @ptn:Simulated_potential__x3A__more_charged_node"><!-- $ptn:Label = @ptn:Label__x3A__context or $ptn:Label = @ptn:Label -->
                <ptn:Current_synapse ptn:debug="#173B todo use derive synape from parents instead config">
                    <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
                    <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
                    <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
                    <!--<ptn:Output_Node><xsl:value-of select="@ptn:Label"/></ptn:Output_Node>-->
                    <ptn:Output_Node><xsl:value-of select="@ptn:Output_Node"/></ptn:Output_Node>
                </ptn:Current_synapse>
                <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__more_charged_node"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>#183M bypassed @ptn:Label[<xsl:value-of select="@ptn:Label"/>] context[$ptn:Label[<xsl:value-of select="$ptn:Label"/>]]  @less_chd[<xsl:value-of select="@ptn:Simulated_potential__x3A__less_charged_node"/>]</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__more_charged_node" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor__x3A__AB']">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <ptn:Current_synapse ptn:debug="#213M todo use derive synape from parents instead config">
            <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
            <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
            <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
            <ptn:Output_Node><xsl:value-of select="ptn:Label"/></ptn:Output_Node>
        </ptn:Current_synapse>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__less_charged_node" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor__X3A__AA']">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <ptn:Current_synapse ptn:debug="#213M todo use derive synape from parents instead config">
            <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
            <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
            <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
            <ptn:Output_Node><xsl:value-of select="ptn:Label"/></ptn:Output_Node>
        </ptn:Current_synapse>
    </xsl:template>
    
    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor']">
        
    </xsl:template>-->
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__more_charged_node ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__less_charged_node" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node"/>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__ignored"/>
        
    
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="*">
        <xsl:message terminate="yes">#123M unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template name="ptn:Output_Node">
        <ptn:Output_Node>
            <xsl:apply-templates mode="ptn:Output_Node" select="."/>
        </ptn:Output_Node>
    </xsl:template>
    
    <xsl:template mode="ptn:Output_Node" match="*">
        <xsl:message terminate="yes">#161M unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Output_Node" match="ptn:Simulation.attract__x3A__calculate[@ptn:Label]">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:attribute name="ptn:Output_Node__x3A__inhibitor">_<xsl:value-of select="@ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="$ptn:Label"/></xsl:attribute>
        <xsl:attribute name="ptn:Output_Node__x3A__inhibitor__x3A__self">_<xsl:value-of select="@ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="@ptn:Label"/></xsl:attribute>
        
        <xsl:value-of select="@ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="$ptn:Label"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Output_Node" match="ptn:Receptor[ptn:Label]">
        <xsl:param name="ptn:Label" tunnel="yes" required="yes"/>
        <xsl:attribute name="ptn:Output_Node__x3A__inhibitor">_<xsl:value-of select="ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="$ptn:Label"/></xsl:attribute>
        <xsl:attribute name="ptn:Output_Node__x3A__inhibitor__x3A__self">_<xsl:value-of select="ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="ptn:Label"/></xsl:attribute>
        <xsl:value-of select="ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="$ptn:Label"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__ignored"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="*">
        <xsl:message terminate="yes">#209M Unantended[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate.best.unique">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context][@ptn:Label]">
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
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[following-sibling::ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor__x3A__AB']][@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type][ptn:Input__x3A__nodes]">
        <xsl:element name="{@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type}" >
            <xsl:attribute name="ptn:debug">#317M <xsl:value-of select="@ptn:Inputs"/><xsl:text> </xsl:text><xsl:value-of select="following-sibling::ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor__x3A__AB']/ptn:Label"/></xsl:attribute>
            <xsl:attribute name="ptn:New" select="true()"/>
            <!--<xsl:apply-templates></xsl:apply-templates>-->
            <xsl:copy-of select="*"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type][ptn:Input__x3A__nodes]">
        <xsl:element name="{@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type}" >
            <xsl:attribute name="ptn:debug">#324M</xsl:attribute>
            <xsl:attribute name="ptn:New" select="true()"/>
            <xsl:copy-of select="*"/>
        </xsl:element>
    </xsl:template>
    
    
    
</xsl:stylesheet>