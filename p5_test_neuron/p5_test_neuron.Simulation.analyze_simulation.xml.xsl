<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!--<xsl:include href="p5_test_neuron.param.xsl"/>-->
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Config">
        
        <xsl:variable name="ptn:Inputs" select="doc($ptn:Inputs)//ptn:Inputs"/>
        <xsl:variable name="ptn:Simulation_ticks" select="ptn:Simulation/ptn:Simulation_ticks"/>
        <xsl:variable name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick"/>
        <xsl:variable name="file" select="concat('file:///',$ptn:Simulation.dir,'?select=Simulation.analys.xml.*.xml;recurse=no')"/>
        <!--<xsl:variable name="files" select="collection('file:///Users/a.binder/procesy5-dita-templates-druki/Imaginaerum/p5_test_neuron/repository/Simulation?select=Simulation.analys.xml.*.xml;recurse=no')"/>-->
        <xsl:variable name="files" select="collection($file)"/>
        <ptn:Simulation.analyze_simulation.xml file="{$file}">
            <xsl:copy-of select="@xsi:schemaLocation"/>
            <xsl:attribute name="ptn:Simulation_ticks" select="$ptn:Simulation_ticks"/>
            <xsl:attribute name="ptn:Simulator_tick" select="$ptn:Simulator_tick"/>
            <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.xml__x3A__Inputs" select="$ptn:Inputs"/>
            <xsl:for-each select="$files">
                <xsl:sort select="ptn:Simulation.analys.xml/@ptn:Simulation_body_tick" data-type="number" order="ascending"/>
                <xsl:choose>
                    <xsl:when test="ptn:Simulation.analys.xml"/>
                    <xsl:otherwise>
                        <xsl:message terminate="yes">#28 unexpected /n[<xsl:value-of select="name()"/>]</xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- ptn:Simulation_body -->
                <xsl:message>#24AA [READING][<xsl:value-of select="document-uri(.)"/>]</xsl:message>
                <!--<file url="{document-uri(.)}"></file>-->
                <xsl:apply-templates mode="#current">
                    <xsl:with-param name="ptn:Simulation_ticks" select="$ptn:Simulation_ticks" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulator_tick" select="$ptn:Simulator_tick" tunnel="yes"/>
                </xsl:apply-templates>
            </xsl:for-each>
            <!--<xsl:apply-templates mode="#current" select="collection($file)"/>-->
        </ptn:Simulation.analyze_simulation.xml>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml__x3A__Inputs" match="text()|comment()"/>
        
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml__x3A__Inputs" match="*">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml__x3A__Inputs" match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:message>#52 [TODO][ptn:Simulation.analyze_simulation.xml__x3A__Inputs] /b[<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:function name="ptn:Simulation.analyze_simulation.xml__x3A__element.name">
        <xsl:param name="name"/>
        <xsl:value-of select="concat($name,'__x3A__analyze')"/>
    </xsl:function>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Simulation_body|ptn:Simulation.analys.xml">
        <xsl:element name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}">
            <xsl:copy-of select="@ptn:Simulation_body_time"/>
            <xsl:copy-of select="@ptn:Simulation_body_tick"/>
            <xsl:copy-of select="@ptn:Simulator_tick"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulation_body_tick" select="@ptn:Simulation_body_tick" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Receptors|ptn:Nodes">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Receptor[ptn:Label]|ptn:Leaky_neuron_inhibitor__X3A__AA[ptn:Label]|ptn:Leaky_neuron_inhibitor__x3A__AB[ptn:Label]|ptn:Leaky_neuron_standard[ptn:Label]">
        <xsl:element name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}">
            <xsl:copy-of select="@ptn:Simulation__x3A__visualize"/>
            <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.xml.attrs">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
            <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.xml.Outputs">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.attrs" match="ptn:Simulated_potential|ptn:Is_inhibitor|ptn:Attract__x3A__flag|
        ptn:Output__x3A__flag|ptn:Refactory_period__x3A__flag|ptn:Output__x3A__flag__x3A__emmit|ptn:Stress__x3A__flag">
        <xsl:attribute name="{name()}" select="."/>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.attrs" match="ptn:Outputs">
        <xsl:attribute name="ptn:Outputs__x3A__count" select="count(ptn:Current_synapse)"/>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.attrs" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|
        ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|
        ptn:Firing_threshold|ptn:Refactory_period|ptn:Input__x3A__nodes|ptn:Input__x3A__nodes__x3A__prohibit|
        ptn:Simulated_potential__x3A__vectors|ptn:Simulated_potential__x3A__vectors.sum|
        ptn:Input__x3A__attract__x3A__vectors|ptn:Receptor_regex_filter"/>
        
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.attrs" match="*">
        <xsl:message terminate="yes">#112 unantended[n][<xsl:value-of select="name()"/>]    [followings[<xsl:value-of select="following-sibling::*/name()"/>]]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="ptn:Outputs">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="ptn:Current_synapse">
        <xsl:element name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="ptn:Output_Node">
        <xsl:attribute name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}" select="."/>
        
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="*">
        <xsl:message terminate="yes">#99 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="ptn:Input__x3A__attract__x3A__vectors"/>
                
    
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Z|ptn:Coordinate_Y|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage"/>
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Maximum_current|ptn:Time_constant"/>    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="ptn:Delay|ptn:Input__x3A__nodes|ptn:Simulated_potential|ptn:Attract__x3A__flag|ptn:Simulated_potential__x3A__vectors|ptn:Simulated_potential__x3A__vectors.sum"/>
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="ptn:Receptor_regex_filter|ptn:Input__x3A__nodes__x3A__prohibit|ptn:Stress__x3A__flag|ptn:Refactory_period__x3A__flag"/>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml.Outputs" match="ptn:Output__x3A__flag|ptn:Output__x3A__flag__x3A__emmit">
        <xsl:message>#109 [TODO][<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z">
        <xsl:param name="ptn:Simulation_body_tick" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Label" required="yes" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="$ptn:Simulation_body_tick = 1">
                <xsl:attribute name="{name()}" select="."/>
            </xsl:when>
            <xsl:when test="parent::*[@ptn:New]">
                <xsl:attribute name="{name()}" select="."/>
            </xsl:when>
            <xsl:otherwise>
                    <xsl:attribute name="{name()}" select="."/>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Label">
        <xsl:copy-of select="@ptn:Simulation__x3A__visualize"/>
        <xsl:attribute name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}" select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential"/>
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Simulated_potential__x3A__vectors|ptn:Simulated_potential__x3A__vectors.sum|ptn:Receptor_regex_filter"/>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Firing_threshold|ptn:Refactory_period|ptn:Reset_potential|ptn:Input__x3A__nodes"/>  
    
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Refactory_period__x3A__flag|ptn:Stress__x3A__flag"/>
        
        
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input__x3A__nodes__x3A__prohibit"/>
    
    <!--<xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Output__x3A__flag__x3A__emmit"/>-->
        
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Output__x3A__flag__x3A__emmit">
        <!--<xsl:attribute name="{name()}" select="."/>-->
        <xsl:element name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}">
            <xsl:attribute name="{name()}__x3A__count" select="count(ptn:Current_synapse__x3A__emmit)"/>
            <xsl:attribute name="{name()}__x3A__time__x3A__min" select="min(descendant-or-self::ptn:Input_exec_time/text())"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Current_synapse__x3A__emmit">
        <xsl:element name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}">
            <xsl:attribute name="{name()}__x3A__count" select="count(ptn:Current_synapse__x3A__emmit)"/>
            <xsl:attribute name="{name()}__x3A__time__x3A__min" select="min(descendant-or-self::ptn:Input_exec_time/text())"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input_exec_time[parent::ptn:Input[parent::ptn:Current_synapse__x3A__emmit]]">
        <xsl:attribute name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}" select="."/>     
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input_exec_receptor[parent::ptn:Input[parent::ptn:Current_synapse__x3A__emmit]]">
        <xsl:attribute name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}" select="."/>     
    </xsl:template>
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input_exec_Time_constant[parent::ptn:Input[parent::ptn:Current_synapse__x3A__emmit]]">
        <xsl:attribute name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}" select="."/>     
    </xsl:template>
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input_exec_Maximum_current[parent::ptn:Input[parent::ptn:Current_synapse__x3A__emmit]]">
        <xsl:attribute name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}" select="."/>     
    </xsl:template>
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input_exec_time__x3A__initial[parent::ptn:Input[parent::ptn:Current_synapse__x3A__emmit]]">
        <xsl:attribute name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}" select="."/>     
    </xsl:template>
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input__x3A__Is_inhibitor[parent::ptn:Input[parent::ptn:Current_synapse__x3A__emmit]]">
        <xsl:attribute name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}" select="."/>     
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input[parent::ptn:Current_synapse__x3A__emmit]"><!-- [number(ptn:Input_exec_time) &lt;= number(ancestor-or-self::ptn:Simulation.analys.xml/@ptn:Simulation_body_time__x3A__last) -->
        <xsl:param name="ptn:Simulation_ticks" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick" required="yes" tunnel="yes"/>
        <!--<xsl:attribute name="{name()}" select="."/>-->
        <xsl:choose>
            <xsl:when test="number(ptn:Input_exec_time) &gt; number($ptn:Simulation_ticks * $ptn:Simulator_tick)">
                <xsl:comment>#223 [bypassed[n][<xsl:value-of select="name()"/>]] [not fit][ptn:Input_exec_time=[<xsl:value-of select="number(ptn:Input_exec_time)"/>]=  [$ptn:Simulation_ticks[<xsl:value-of select="$ptn:Simulation_ticks"/>]]</xsl:comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{ptn:Simulation.analyze_simulation.xml__x3A__element.name(name())}">
                    <xsl:apply-templates mode="#current"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    
    <!--<xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input[parent::ptn:Current_synapse__x3A__emmit][number(ptn:Input_exec_time) &gt; number(ancestor-or-self::ptn:Simulation.analys.xml/@ptn:Simulation_body_time__x3A__last)]">
        <xsl:param name="ptn:Simulation_ticks" required="yes" tunnel="yes"/>
        <!-\-<xsl:attribute name="{name()}" select="."/>-\->
        <xsl:comment>#223 [bypassed[n][<xsl:value-of select="name()"/>]] [not fit][ptn:Input_exec_time=[<xsl:value-of select="number(ptn:Input_exec_time)"/>]==@time[<xsl:value-of select="number(ancestor-or-self::ptn:Simulation.analys.xml/@ptn:Simulation_body_time__x3A__last)"/>]]  [$ptn:Simulation_ticks[<xsl:value-of select="$ptn:Simulation_ticks"/>]]</xsl:comment>
    </xsl:template>-->
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|
        ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Outputs|ptn:Simulated_potential|
        ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector|ptn:Is_inhibitor|ptn:Output__x3A__flag|ptn:Attract__x3A__flag"/>
        
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.xml" match="*">
        <xsl:message terminate="yes">#46 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
</xsl:stylesheet>