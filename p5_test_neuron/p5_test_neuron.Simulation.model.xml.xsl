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
    
    <xsl:include href="p5_test_neuron.Simulation.model.Stress.xml.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.model.apply.xml.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.model.validate.xml.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.model.attract__x3A__aggregate.xml.xsl"/>
    
    <!-- przerzucamy modele to roota -->
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Simulation.attract.xml">
        <ptn:Simulation.model.xml>
            <xsl:copy-of select="@*"/>
            <xsl:call-template name="ptn:Simulation.attract__x3A__aggregate"/><!-- przekopiowanie attract na wierzch tylko -->
          
            <xsl:apply-templates mode="#current">
                <!--<xsl:with-param name="ptn:Simulation.attract__x3A__calculate.best.unique" select="$ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes"/>-->
                <!--<xsl:with-param name="ptn:Simulation.Stress__x3A__calculate.best.unique" select="descendant-or-self::ptn:Simulation.Stress__x3A__calculate" tunnel="yes"/>-->
                <xsl:with-param name="ptn:Defaults" select="doc($ptn:Config)//ptn:Defaults" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body_tick" select="@ptn:Simulation_body_tick" tunnel="yes"/>
                <!-- todo choose best only attracts  -->
            </xsl:apply-templates>
        </ptn:Simulation.model.xml>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Nodes">
       <!-- <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation.Stress__x3A__calculate.best.unique" tunnel="yes" required="yes"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
           <!-- <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" select="$ptn:Simulation.attract__x3A__calculate.best.unique"/>
            <xsl:apply-templates mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Nodes__x3A__install" select="$ptn:Simulation.Stress__x3A__calculate.best.unique"/>-->
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Output__x3A__flag__x3A__emmit">
        <xsl:comment >#59M unintended/n[<xsl:value-of select="name()"/>]</xsl:comment>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Output__x3A__flag">
        <xsl:comment >#57M unintended/n[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Simulation.Stress__x3A__calculate__x3A__ignored">
        <xsl:comment >#57MA unintended/n[<xsl:value-of select="name()"/>]</xsl:comment>
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
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Receptor[ptn:Label]|ptn:Leaky_neuron_standard[ptn:Label]|ptn:Leaky_neuron_inhibitor[ptn:Label]|ptn:Leaky_neuron_inhibitor__x3A__AB[ptn:Label]|ptn:Leaky_neuron_inhibitor__X3A__AA[ptn:Label]">
        <!--<xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>-->
        <!--<xsl:param name="ptn:Simulation.Stress__x3A__calculate.best.unique" tunnel="yes" required="yes"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Simulated_potential|ptn:Receptor_regex_filter|ptn:Current_synapse|ptn:Input__x3A__nodes|ptn:Input__x3A__node">
        <!--<xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Output_Node|ptn:Maximum_current|ptn:Time_constant|ptn:Delay">
        <!--<xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Outputs">
        <!--<xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>-->
        
        <!--<xsl:param name="ptn:Label" tunnel="yes" required="yes"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <!--<xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" select="$ptn:Simulation.attract__x3A__calculate.best.unique"/>-->
            <!--<xsl:apply-templates mode="ptn:Simulation.Stress__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" select="following-sibling::ptn:Simulation.Stress__x3A__calculate">
                <xsl:with-param name="ptn:Label" select="preceding-sibling::ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>-->
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Attract__x3A__flag">
        <!--<xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:comment>#59 TODO handle this flag when created model stale flag that was used</xsl:comment>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Simulation.attract__x3A__calculate">
        <!--<xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>-->
        <xsl:comment>#58M bypassed/n[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="text()">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    
    
    
    
    
    
    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[@ptn:Simulation.attract__x3A__calculate__x3A__output_node.type='ptn:Leaky_neuron_inhibitor']">
        
    </xsl:template>-->
    
    
    
    
    
        
    
    
    
    
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
    
    
    <xsl:template mode="ptn:Output_Node" match="ptn:Receptor[ptn:Label]|ptn:Leaky_neuron_standard|ptn:Leaky_neuron_inhibitor__X3A__AA">
        <xsl:param name="ptn:Label" tunnel="yes" required="yes"/>
        <xsl:attribute name="ptn:Output_Node__x3A__inhibitor">_<xsl:value-of select="ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="$ptn:Label"/></xsl:attribute>
        <xsl:attribute name="ptn:Output_Node__x3A__inhibitor__x3A__self">_<xsl:value-of select="ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="ptn:Label"/></xsl:attribute>
        <xsl:value-of select="ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="$ptn:Label"/>
    </xsl:template>
    
    
    
</xsl:stylesheet>