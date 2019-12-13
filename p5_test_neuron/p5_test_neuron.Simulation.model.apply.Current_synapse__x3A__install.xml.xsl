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


    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="*">
        <xsl:message terminate="yes">#16 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__self_node__x3A__assert|ptn:Capacitance__x3A__attract__x3A__calculate__x3A__output_node__x3A__assert">
        <xsl:comment>#22 [bypassed][n][<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>-->

    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="ptn:Simulation.attract__x3A__aggregate__x3A__validated">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Simulation.Stress__x3A__calculate__x3A__validated">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector">
        <!--<xsl:apply-templates mode="#current"/>-->
    </xsl:template>
    
    
    <!---->
    <!--<xsl:template mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Simulation.model.validate.xml__x3A__stats"/>-->

    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Simulation.attract__x3A__calculate__x3A__validated[@ptn:Output_Node__x3A__attract][@ptn:Label__x3A__context]">
        <xsl:param name="ptn:Simulation.model.validate.xml__x3A__stats" required="yes" tunnel="yes"/>
        <!--<xsl:comment>#157  TODO unantended/n[<xsl:value-of select="name()"/>]</xsl:comment>-->
        <xsl:comment>#30  /c[<xsl:value-of select="*/name()"/>] MM[<xsl:value-of select="$ptn:Simulation.model.validate.xml__x3A__stats/name()"/>][LP[<xsl:value-of select="@ptn:Simulated_potential__x3A__less_charged_node"/>]] [MP[<xsl:value-of select="@ptn:Simulated_potential__x3A__more_charged_node"/>]]</xsl:comment>
        <xsl:choose>
            <xsl:when test="number(@ptn:Simulated_potential__x3A__diff) &lt; 0">
                <xsl:comment>#32X bypassed due to number(@ptn:Simulated_potential__x3A__diff) &lt; 0 [<xsl:value-of select="@ptn:Label__x3A__context"/>]</xsl:comment>
            </xsl:when>
            
            <xsl:otherwise>
                <xsl:apply-templates mode="#current">
                    <xsl:with-param name="ptn:Output_Node__x3A__attract" select="@ptn:Output_Node__x3A__attract" tunnel="yes"/>
                    <xsl:with-param name="ptn:Label__x3A__context" tunnel="yes" select="@ptn:Label__x3A__context"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    


    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__not_validated">
        <xsl:message terminate="no">#173M [WARNING][NOT_VALIDATED]/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Simulation.Stress__x3A__calculate__x3A__output_node__x3A__validated">
        <xsl:comment>#644[m][<xsl:value-of select="name()"/>]</xsl:comment>
        <xsl:apply-templates mode="#current">
            <xsl:with-param name="ptn:Label__x3A__attract" select="ptn:Label" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Simulation.Stress__x3A__calculate__x3A__output_node__x3A__not_validated">
        <xsl:message terminate="no">#173M [WARNING][NOT_VALIDATED]/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>


    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[ptn:Label]">
        <xsl:param name="ptn:Simulation.model.validate.xml__x3A__stats" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <!--<xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>-->
        <xsl:comment>#112[m][<xsl:value-of select="name()"/>]</xsl:comment>
        <!--<xsl:message>#112[m][<xsl:value-of select="name()"/>]</xsl:message>-->
        <xsl:choose>
            <xsl:when test="$ptn:Simulation.model.validate.xml__x3A__stats//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@ptn:Label__x3A__stats = current()/ptn:Label][@ptn:Label__x3A__count = 2]">
                <xsl:comment>#32B [DUPLICATED] </xsl:comment>
            </xsl:when>
        </xsl:choose>
        <xsl:apply-templates mode="#current">
            <xsl:with-param name="ptn:Label__x3A__attract" select="ptn:Label" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    


    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[@ptn:Simulated_potential__x3A__less_charged_node][@ptn:Simulated_potential__x3A__more_charged_node][@ptn:Output_Node__x3A__attract]">
        <!-\-  ptn:Simulation.attract__x3A__calculate -\->
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <!-\-<xsl:variable name="ptn:Output_Node"><xsl:call-template name="ptn:Output_Node"/></xsl:variable>-\->
        <xsl:choose>
            <xsl:when test="$ptn:Label = @ptn:Simulated_potential__x3A__less_charged_node"><!-\- $ptn:Label = @ptn:Label__x3A__context or $ptn:Label = @ptn:Label -\->
                <ptn:Current_synapse ptn:debug="#173A todo use derive synape from parents instead config">
                    <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
                    <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
                    <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
                    <!-\-<ptn:Output_Node><xsl:value-of select="@ptn:Label"/></ptn:Output_Node>-\->
                    <ptn:Output_Node><xsl:value-of select="@ptn:Output_Node__x3A__attract"/></ptn:Output_Node>
                </ptn:Current_synapse>
                <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__less_charged_node"/>
            </xsl:when>
            <xsl:when test="$ptn:Label = @ptn:Simulated_potential__x3A__more_charged_node"><!-\- $ptn:Label = @ptn:Label__x3A__context or $ptn:Label = @ptn:Label -\->
                <ptn:Current_synapse ptn:debug="#173B todo use derive synape from parents instead config">
                    <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
                    <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
                    <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
                    <!-\-<ptn:Output_Node><xsl:value-of select="@ptn:Label"/></ptn:Output_Node>-\->
                    <ptn:Output_Node><xsl:value-of select="@ptn:Output_Node__x3A__attract"/></ptn:Output_Node>
                </ptn:Current_synapse>
                <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__more_charged_node"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>#183M bypassed @ptn:Label[<xsl:value-of select="@ptn:Label"/>] context[$ptn:Label[<xsl:value-of select="$ptn:Label"/>]]  @less_chd[<xsl:value-of select="@ptn:Simulated_potential__x3A__less_charged_node"/>]</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    
    
    
    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__more_charged_node" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor__x3A__AB']">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <ptn:Current_synapse ptn:debug="#213M todo use derive synape from parents instead config">
            <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
            <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
            <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
            <ptn:Output_Node><xsl:value-of select="ptn:Label"/></ptn:Output_Node>
        </ptn:Current_synapse>
    </xsl:template>-->
    
    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__less_charged_node"
        match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor__X3A__AA']">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        
        <ptn:Current_synapse ptn:debug="#213M todo use derive synape from parents instead config">
            <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
            <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
            <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
            <ptn:Output_Node><xsl:value-of select="ptn:Label"/></ptn:Output_Node>
        </ptn:Current_synapse>
    </xsl:template>-->
    
    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[ptn:Label][@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_standard']">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <xsl:comment>#72[m][<xsl:value-of select="name()"/>] cont lower</xsl:comment>
            <xsl:apply-templates mode="#current"/>
    </xsl:template>-->
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="ptn:Input__x3A__nodes">
        <xsl:comment>#85[m][<xsl:value-of select="name()"/>]</xsl:comment>
            <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="ptn:Input__x3A__node">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Output_Node__x3A__attract" required="no" tunnel="yes"/>
        <xsl:param name="ptn:Label__x3A__attract" required="no" tunnel="yes"/>
        <xsl:param name="ptn:Label__x3A__context" required="no" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="$ptn:Label = text()">
                <ptn:Current_synapse ptn:debug="#994M todo use derive synape from parents instead config [$ptn:Output_Node__x3A__attract][{$ptn:Output_Node__x3A__attract}][{text()}][{$ptn:Label}][{$ptn:Label__x3A__context}][{$ptn:Label__x3A__attract}]">
                    <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
                    <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
                    <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
                    <ptn:Output_Node><xsl:value-of select="$ptn:Label__x3A__attract"/></ptn:Output_Node>
                </ptn:Current_synapse>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>#98 not matced[<xsl:value-of select="text()"/>]</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
    
    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated">
        <!-\-<xsl:apply-templates mode="#current"/>-\->
        <ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated debug="{name()}">
            <xsl:apply-templates mode="#current" select=""/>
        </ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated>
        
    </xsl:template>-->
    
    
    
    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="*">
        <xsl:param name="ptn:Label" tunnel="yes" required="yes"/>
        <xsl:message terminate="no">#123M unantended/n 
            [<xsl:value-of select="name()"/>]</xsl:message>
            <xsl:comment>224 APL [ERROR][/n[<xsl:value-of select="name()"/>]] [FROM][[ptn:Label]<xsl:value-of select="$ptn:Label"/>] </xsl:comment>
    </xsl:template>-->
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="ptn:Refactory_period__x3A__flag"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="ptn:Input__x3A__nodes__x3A__prohibit"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" 
        match="ptn:Simulation.attract__x3A__calculate__x3A__ignored"/>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__more_charged_node ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install__x3A__less_charged_node"
        match="ptn:Simulation.attract__x3A__calculate__x3A__output_node"/>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold"/>    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Refactory_period|ptn:Is_inhibitor|ptn:Simulated_potential"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install"
        match="ptn:Outputs"/>
    
</xsl:stylesheet>