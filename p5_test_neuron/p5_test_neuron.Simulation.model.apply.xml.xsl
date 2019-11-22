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
    
    <!-- {p5_test_neuron}Simulation.model.apply.xml -->
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulation.model.validate.xml">
        <xsl:message>#16AA [ptn:Simulation.model.apply.xml] - just install</xsl:message>
        <ptn:Simulation.model.apply.xml xsi:schemaLocation="p5_test_neuron file:{$ptn:xsd}">
            <xsl:copy-of select="@*"/>
            <!--<xsl:copy-of select="*"/>-->
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulation.attract__x3A__aggregate__x3A__validated" select="ptn:Simulation.attract__x3A__aggregate__x3A__validated" tunnel="yes"/>
            </xsl:apply-templates>
        </ptn:Simulation.model.apply.xml>
        
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulation.attract__x3A__aggregate__x3A__validated">
        <xsl:comment>#30 bypassed/n[<xsl:value-of select="name()"/>] to be context installed</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulation.model.validate.xml__x3A__stats">
        <xsl:comment>#306 bypassed/n[<xsl:value-of select="name()"/>] to be context installed</xsl:comment>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulation.attract__x3A__aggregate">
        <xsl:comment>#32 bypassed/n[<xsl:value-of select="name()"/>] to be context installed</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="*">
        <xsl:message terminate="yes">#16 [ptn:Simulation.model.apply.xml]  unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Receptors|ptn:Nodes">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|ptn:Receptor_regex_filter">
        <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Minimum_voltage">
        <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold">
        <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Refactory_period|ptn:Is_inhibitor">
        <xsl:copy-of select="."/>
    </xsl:template>
   
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Input__x3A__nodes|ptn:Simulated_potential|ptn:Attract__x3A__flag">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
   
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Output__x3A__flag__x3A__emmit">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Stress__x3A__flag">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Receptor[ptn:Label]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Outputs">
        <xsl:param name="ptn:Simulation.attract__x3A__aggregate__x3A__validated" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" select="$ptn:Simulation.attract__x3A__aggregate__x3A__validated"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install " match="ptn:Simulation.attract__x3A__calculate.best.unique">
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
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.Stress__x3A__calculate__x3A__validated">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
                                                                                                                       
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__aggregate__x3A__validated">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__validated">
        <xsl:comment>#157  TODO unantended/n[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="*">
        <xsl:message terminate="yes">#123M unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__not_validated">
        <xsl:message terminate="no">#173M [WARNING][NOT_VALIDATED]/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__ignored"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__more_charged_node ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__less_charged_node" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node"/>
    
    
    
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
        <xsl:param name="ptn:Simulation_body_tick" tunnel="yes" required="yes"/>
        <xsl:element name="{@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type}" >
            <xsl:attribute name="ptn:debug">#317M  #324M @tick[<xsl:value-of select="$ptn:Simulation_body_tick"/>] <xsl:value-of select="@ptn:Inputs"/><xsl:text> </xsl:text><xsl:value-of select="following-sibling::ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor__x3A__AB']/ptn:Label"/></xsl:attribute>
            <xsl:attribute name="ptn:New" select="true()"/>
            <!--<xsl:apply-templates></xsl:apply-templates>-->
            <xsl:copy-of select="*"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type][ptn:Input__x3A__nodes]">
        <xsl:param name="ptn:Simulation_body_tick" tunnel="yes" required="yes"/>
        <xsl:element name="{@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type}" >
            <xsl:attribute name="ptn:debug">#324M @tick[<xsl:value-of select="$ptn:Simulation_body_tick"/>]</xsl:attribute>
            <xsl:attribute name="ptn:New" select="true()"/>
            <xsl:copy-of select="*"/>
        </xsl:element>
    </xsl:template>
    
    
    
</xsl:stylesheet>