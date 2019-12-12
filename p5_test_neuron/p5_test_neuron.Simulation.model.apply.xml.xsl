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
    
    <xsl:include href="p5_test_neuron.Simulation.model.apply.Current_synapse__x3A__install.xml.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.model.apply.Nodes__x3A__install.xml.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.model.apply.install__x3A__Reset_potential.xsl"/>
    
    
    <!-- {p5_test_neuron}Simulation.model.apply.xml -->
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulation.model.validate.xml">
        <xsl:message>#16AA [ptn:Simulation.model.apply.xml] - just install validated components;  T[<xsl:value-of select="ptn:Simulation.attract__x3A__aggregate__x3A__validated/name()"/>]</xsl:message>
        <ptn:Simulation.model.apply.xml xsi:schemaLocation="p5_test_neuron file:{$ptn:xsd}">
            <xsl:copy-of select="@*"/>
            <!--<xsl:copy-of select="*"/>-->
            
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulation.attract__x3A__aggregate__x3A__validated" select="ptn:Simulation.attract__x3A__aggregate__x3A__validated" tunnel="yes"/>
                <xsl:with-param name="ptn:Defaults" select="doc($ptn:Config)//ptn:Defaults" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body_tick" select="@ptn:Simulation_body_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation.model.validate.xml__x3A__stats" select="ptn:Simulation.model.validate.xml__x3A__stats" tunnel="yes"/>
            </xsl:apply-templates>
        </ptn:Simulation.model.apply.xml>
        
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulation.attract__x3A__aggregate__x3A__validated">
        <xsl:comment>#30 bypassed/n[<xsl:value-of select="name()"/>] to be context installed</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulation.model.validate.xml__x3A__stats">
        <xsl:comment>#306 bypassed/n[<xsl:value-of select="name()"/>] to be context installed</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>        
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulation.attract__x3A__aggregate">
        <xsl:comment>#32 bypassed/n[<xsl:value-of select="name()"/>] to be context installed</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Refactory_period__x3A__flag|ptn:Refactory_period__x3A__flag__x3A__until">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="*">
        <xsl:message terminate="yes">#16 [ptn:Simulation.model.apply.xml]  unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Receptors">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Nodes">
        <xsl:param name="ptn:Simulation.attract__x3A__aggregate__x3A__validated" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" select="$ptn:Simulation.attract__x3A__aggregate__x3A__validated"/>
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
   
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Input__x3A__nodes|ptn:Input__x3A__node|ptn:Attract__x3A__flag">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
   
   
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Simulated_potential">
        <!--<xsl:copy>
            <xsl:copy-of select="@*"/>-->
            <!--<xsl:attribute name="ptn:debug">#96[TODO][RESET][POTENTIAL][WHEN_INSTALLED]</xsl:attribute>-->
        <xsl:comment>#105 [ptn:Simulation.model.apply.xml] [n][<xsl:value-of select="name()"/>] call [ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential]</xsl:comment>
            <xsl:call-template name="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential">
                <xsl:with-param name="ptn:Simulated_potential__x3A__current" select="." tunnel="yes"/>
            </xsl:call-template>
        <!--</xsl:copy>-->
        
    </xsl:template>
   
   
   
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Input__x3A__nodes__x3A__prohibit|ptn:Input__x3A__node__x3A__prohibit">
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
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Current_synapse__x3A__emmit">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Stress__x3A__flag">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Leaky_neuron_standard[ptn:Label]|ptn:Leaky_neuron_inhibitor__x3A__AB[ptn:Label]|ptn:Leaky_neuron_inhibitor__X3A__AA[ptn:Label]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Receptor[ptn:Label]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Outputs">
        <xsl:param name="ptn:Simulation.attract__x3A__aggregate__x3A__validated" tunnel="yes" required="yes"/>
        <!--<xsl:message>#101 try to install Synapses #c/[$ptn:Simulation.attract__x3A__aggregate__x3A__validated[<xsl:value-of select="count($ptn:Simulation.attract__x3A__aggregate__x3A__validated//*)"/>]/n[<xsl:value-of select="$ptn:Simulation.attract__x3A__aggregate__x3A__validated/name()"/>]]</xsl:message>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:debug">#105  todo Install Synaps</xsl:attribute>
            <xsl:apply-templates mode="#current"/>
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" select="$ptn:Simulation.attract__x3A__aggregate__x3A__validated"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Current_synapse">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml" match="ptn:Maximum_current|ptn:Time_constant|ptn:Delay|ptn:Output_Node">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <!--<xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install " match="ptn:Simulation.attract__x3A__calculate.best.unique">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>-->
    
    
    
    
</xsl:stylesheet>