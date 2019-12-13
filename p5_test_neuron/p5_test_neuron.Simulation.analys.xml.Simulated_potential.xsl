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
    
    <xsl:include href="p5_test_neuron.Simulation.analys.xml.Simulated_potential.Output__x3A__flag__x3A__emmit.xsl"/>
    
    <xsl:template  name="ptn:Simulated_potential" >
        <xsl:apply-templates mode="ptn:Simulated_potential" select="."/>        
    </xsl:template>
    
    
    <!--<xsl:template mode="ptn:Simulated_potential"  match="ptn:Simulated_potential[following-sibling::ptn:Refactory_period__x3A__flag[number(ptn:Refactory_period__x3A__flag__x3A__until) &lt;= number(ancestor-or-self::*[name()='ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match.xml' or name()='ptn:Simulation.model.apply.xml']/@ptn:Simulation_body_time) ]]">
        <xsl:param name="ptn:Reset_potential" required="yes" tunnel="yes"/>
        <xsl:comment>#21 [ptn:Simulated_potential][following-sibling::ptn:Refactory_period__x3A__flag] [flag active[<xsl:value-of select="following-sibling::ptn:Refactory_period__x3A__flag/ptn:Refactory_period__x3A__flag__x3A__until"/>]]</xsl:comment>
        <xsl:message>#21 [ptn:Simulated_potential][following-sibling::ptn:Refactory_period__x3A__flag] [flag active[<xsl:value-of select="following-sibling::ptn:Refactory_period__x3A__flag/ptn:Refactory_period__x3A__flag__x3A__until"/>]]</xsl:message>
        <xsl:copy>
            <xsl:value-of select="$ptn:Reset_potential"/>
        </xsl:copy>
    </xsl:template>-->
    
    
    <xsl:template mode="ptn:Simulated_potential"  match="ptn:Simulated_potential[preceding-sibling::ptn:Firing_threshold][preceding-sibling::ptn:Capacitance][preceding-sibling::ptn:Resistance][preceding-sibling::ptn:Resting_potential][preceding-sibling::ptn:Reset_potential][not(following-sibling::ptn:Refactory_period__x3A__flag[number(ptn:Refactory_period__x3A__flag__x3A__until) &gt; number(ancestor-or-self::*[name()='ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match.xml' or name()='ptn:Simulation.model.apply.xml']/@ptn:Simulation_body_time) ])]">
        <xsl:param name="ptn:Attract_min" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulated_potential.input.vector__x3A__offset" select="1.3"/>
        <xsl:param name="ptn:Outputs" required="yes" tunnel="yes"/>
        <xsl:message terminate="no">#13-13 name()<xsl:value-of select="name()"/>- [ptn:Label][<xsl:value-of select="preceding-sibling::ptn:Label"/>]  [$ptn:Attract_min[<xsl:value-of select="$ptn:Attract_min"/>]] TODO </xsl:message>
        <xsl:variable name="ptn:Simulated_potential__x3A__vectors">
            <ptn:Simulated_potential__x3A__vectors>
                <xsl:attribute name="ptn:Simulated_potential__x3A__previous" select="text()"/>
                <xsl:apply-templates mode="ptn:Simulated_potential.resting.vector" select="."/>
                <xsl:apply-templates mode="ptn:Simulated_potential.input.vector" select="."/>
                <xsl:apply-templates mode="ptn:Simulated_potential.emmit.vector" select=".">
                    <xsl:with-param name="ptn:Label" select="preceding-sibling::ptn:Label" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulated_potential.input.vector__x3A__offset" select="$ptn:Simulated_potential.input.vector__x3A__offset" tunnel="yes"/>
                    <xsl:with-param name="ptn:Capacitance" select="preceding-sibling::ptn:Capacitance" tunnel="yes"/>
                </xsl:apply-templates>
            </ptn:Simulated_potential__x3A__vectors>
        </xsl:variable>
        <xsl:variable name="ptn:Simulated_potential__x3A__vectors.sum">
            <ptn:Simulated_potential__x3A__vectors.sum>
                <xsl:apply-templates mode="ptn:Simulated_potential__x3A__vectors.sum" select="$ptn:Simulated_potential__x3A__vectors">
                    <xsl:with-param name="ptn:Simulated_potential" select="text()" tunnel="yes"/>
                    <xsl:with-param name="ptn:Firing_threshold" select="preceding-sibling::ptn:Firing_threshold" tunnel="yes"/>
                </xsl:apply-templates>
            </ptn:Simulated_potential__x3A__vectors.sum>
        </xsl:variable>
        <!--<xsl:copy>-->
            <!--<xsl:value-of select="text() + sum($ptn:Simulated_potential__x3A__vectors//text())"/>-->
        <!--</xsl:copy>-->
        <xsl:choose>
            <xsl:when test="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*) &gt; preceding-sibling::ptn:Firing_threshold">
                <xsl:copy>
                    <xsl:value-of select="preceding-sibling::ptn:Reset_potential"/>
                </xsl:copy>
                <xsl:call-template name="ptn:Refactory_period__x3A__flag"/>
                <ptn:Output__x3A__flag>
                    <xsl:value-of select="true()"/>
                </ptn:Output__x3A__flag>
                <xsl:call-template name="ptn:Output__x3A__flag__x3A__emmit"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:value-of select="$ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*[last()]"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*) &gt; preceding-sibling::ptn:Firing_threshold and not(preceding-sibling::ptn:Outputs/ptn:Current_synapse)">
                <ptn:Stress__x3A__flag><xsl:value-of select="true()"/></ptn:Stress__x3A__flag>
            </xsl:when>
            <xsl:when test="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*) &gt; preceding-sibling::ptn:Firing_threshold and preceding-sibling::ptn:Outputs/ptn:Current_synapse">
                <!-- when fired no attract variant should be created  -->
            </xsl:when>
            <xsl:when test="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*) &gt; $ptn:Attract_min and not($ptn:Outputs//ptn:Current_synapse)">
                <xsl:message>#77AA [ptn:Current_synapse[0]][SET][ptn:Attract__x3A__flag][V[<xsl:value-of select="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*)"/>]]  [ptn:Label[<xsl:value-of select="preceding-sibling::ptn:Label"/>]]</xsl:message>
                <ptn:Attract__x3A__flag><xsl:value-of select="true()"/></ptn:Attract__x3A__flag>
            </xsl:when>
            <xsl:when test="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*) &gt; ( $ptn:Attract_min + 0.3) and $ptn:Outputs//ptn:Current_synapse[1]">
                <xsl:message>#77A [TUNE][+0.3][ptn:Current_synapse[2]][SET][ptn:Attract__x3A__flag][V[<xsl:value-of select="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*)"/>]]  [ptn:Label[<xsl:value-of select="preceding-sibling::ptn:Label"/>]]</xsl:message>
                <ptn:Attract__x3A__flag ptn:debug="#77A [TUNE][+0.3][ptn:Current_synapse[1]]"><xsl:value-of select="true()"/></ptn:Attract__x3A__flag>
            </xsl:when>
            <xsl:when test="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*) &gt; ( $ptn:Attract_min + 0.5) and $ptn:Outputs//ptn:Current_synapse[2]">
                <xsl:message>#77B [TUNE][+0.5][ptn:Current_synapse[2]][SET][ptn:Attract__x3A__flag][V[<xsl:value-of select="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*)"/>]]  [ptn:Label[<xsl:value-of select="preceding-sibling::ptn:Label"/>]]</xsl:message>
                <ptn:Attract__x3A__flag ptn:debug="#77B [TUNE][+0.5][ptn:Current_synapse[2]]"><xsl:value-of select="true()"/></ptn:Attract__x3A__flag>
            </xsl:when>
            <xsl:when test="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*) &gt; ( $ptn:Attract_min + 0.7) and $ptn:Outputs//ptn:Current_synapse[3]">
                <xsl:message>#77C [TUNE][+0.7][ptn:Current_synapse[3]][SET][ptn:Attract__x3A__flag][V[<xsl:value-of select="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*)"/>]]  [ptn:Label[<xsl:value-of select="preceding-sibling::ptn:Label"/>]]</xsl:message>
                <ptn:Attract__x3A__flag ptn:debug="#77C [TUNE][+0.7][ptn:Current_synapse[3]]"><xsl:value-of select="true()"/></ptn:Attract__x3A__flag>
            </xsl:when>
            <xsl:when test="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*) &gt; ( $ptn:Attract_min ) and $ptn:Outputs//ptn:Current_synapse">
                <xsl:message>##77BB  bypassed attract due to output avilable [LABEL[<xsl:value-of select="preceding-sibling::ptn:Label"/>]] [MAX[<xsl:value-of select="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*)"/>][GT][$ptn:Attract_min[<xsl:value-of select="$ptn:Attract_min"/>]][AND][$ptn:Outputs//ptn:Current_synapse[#[<xsl:value-of select="count($ptn:Outputs//ptn:Current_synapse)"/>]]]]</xsl:message>
                <xsl:comment>##77BB  bypassed attract due to output avilable [LABEL[<xsl:value-of select="preceding-sibling::ptn:Label"/>]] [MAX[<xsl:value-of select="max($ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*)"/>][GT][$ptn:Attract_min[<xsl:value-of select="$ptn:Attract_min"/>]][AND][$ptn:Outputs//ptn:Current_synapse[#[<xsl:value-of select="count($ptn:Outputs//ptn:Current_synapse)"/>]]]]</xsl:comment>
            </xsl:when>
        </xsl:choose>
        <xsl:copy-of select="$ptn:Simulated_potential__x3A__vectors"/>
        
        <xsl:copy-of select="$ptn:Simulated_potential__x3A__vectors.sum/ptn:Simulated_potential__x3A__vectors.sum/*"></xsl:copy-of>
    </xsl:template>
    
    <xsl:template match="ptn:Simulated_potential[following-sibling::ptn:Refactory_period__x3A__flag[number(ptn:Refactory_period__x3A__flag__x3A__until) &gt; number(ancestor-or-self::*[name()='ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match.xml' or name()='ptn:Simulation.model.apply.xml']/@ptn:Simulation_body_time) ]  ]" mode="ptn:Simulated_potential">
        <xsl:param name="ptn:Reset_potential" required="yes" tunnel="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:debug">#110 freezed by ptn:Refactory_period__x3A__flag? [overrided][$ptn:Reset_potential]</xsl:attribute>
            <xsl:value-of select="$ptn:Reset_potential"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template name="ptn:Refactory_period__x3A__flag">
        <xsl:param name="ptn:Simulation_body_time" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Refactory_period" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Refactory_period__x3A__flag" required="yes" tunnel="yes"/>
        <ptn:Refactory_period__x3A__flag>
            <xsl:choose>
                <xsl:when test="$ptn:Refactory_period__x3A__flag[number(ptn:Refactory_period__x3A__flag__x3A__until) &gt; number(ancestor-or-self::*[name()='ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match.xml' or name()='ptn:Simulation.model.apply.xml']/@ptn:Simulation_body_time) ]  ">
                    <xsl:message terminate="yes">#185 [exception][not concurent[$ptn:Refactory_period__x3A__flag] and calling[ptn:Refactory_period__x3A__flag]] [T][following-sibling::ptn:Refactory_period__x3A__flag[<xsl:value-of select="following-sibling::ptn:Refactory_period__x3A__flag/ptn:Refactory_period__x3A__flag__x3A__until"/>]]  [@time[<xsl:value-of select="ancestor-or-self::*[name()='ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match.xml' or name()='ptn:Simulation.model.apply.xml']/@ptn:Simulation_body_time"/>]]</xsl:message>
                </xsl:when>
                <xsl:otherwise>
                    <ptn:Refactory_period__x3A__flag__x3A__until>
                        <xsl:value-of select="$ptn:Refactory_period + $ptn:Simulation_body_time"/>
                    </ptn:Refactory_period__x3A__flag__x3A__until>
                </xsl:otherwise>
            </xsl:choose>
        </ptn:Refactory_period__x3A__flag>        
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential"  match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:message>#186A TODO PATTERN/n[<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential"  match="*">
        <xsl:message terminate="yes">27 incorrect format [unantended][n][<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <!--<xsl:template mode="ptn:Simulated_potential" match="text()">
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <!-\- B3-(1/J4*(B3-M4)/I4)+(F4*G4) -\->
        <!-\-<xsl:variable name="ptn:Simulated_potential.resting.vector">-\->
            <xsl:call-template name="ptn:Simulated_potential.resting.vector"/>
        <!-\-</xsl:variable>-\->
        <xsl:message terminate="no">#13-17 name()[<xsl:value-of select="name()"/>] text()[<xsl:value-of select="."/>] $ptn:Simulator_tick[<xsl:value-of select="$ptn:Simulator_tick"/>] TODO </xsl:message>
    </xsl:template>-->
    
    
    
    <xsl:template mode="ptn:Simulated_potential.resting.vector" match="ptn:Simulated_potential[preceding-sibling::ptn:Capacitance][preceding-sibling::ptn:Resistance][preceding-sibling::ptn:Resting_potential]">
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulated_potential.resting.vector__x3A__offset" select="1"/>
        <xsl:message>#100RV sim deb <xsl:value-of select="preceding-sibling::ptn:Label"/></xsl:message>
        <!--<xsl:attribute name="ptn:Simulated_potential.resting.vector.1_div_membr" select="1 div preceding-sibling::ptn:Resistance"/>
        <xsl:attribute name="ptn:Simulated_potential.resting.vector.rest_pot" select=". - preceding-sibling::ptn:Resting_potential"/>-->
                <ptn:Simulated_potential.resting.vector>
                    <!--<xsl:attribute name="ptn:Simulated_potential" select="text() - (( 1 div preceding-sibling::ptn:Resistance ) * ( . - preceding-sibling::ptn:Resting_potential ) div preceding-sibling::ptn:Capacitance ) * $ptn:Simulator_tick"/>-->
                    <xsl:value-of select=" - (( 1 div preceding-sibling::ptn:Resistance ) * ( . - preceding-sibling::ptn:Resting_potential ) div preceding-sibling::ptn:Capacitance ) * $ptn:Simulator_tick * $ptn:Simulated_potential.resting.vector__x3A__offset"/>
                </ptn:Simulated_potential.resting.vector>
        <!-- b3==current - m4===resting -->
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulated_potential.resting.vector" match="*">
       <xsl:message terminate="yes">#48 unantended name()[<xsl:value-of select="name()"/>]</xsl:message>  
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulated_potential.input.vector" match="ptn:Simulated_potential[preceding-sibling::ptn:Capacitance][preceding-sibling::ptn:Resistance][preceding-sibling::ptn:Label]">
        <xsl:param name="ptn:Inputs" tunnel="yes" required="yes"/>
        <!--<ptn:Simulated_potential.input.vector>-->
            <xsl:apply-templates mode="ptn:Simulated_potential.input.vector" select="$ptn:Inputs">
                <xsl:with-param name="ptn:Label" select="preceding-sibling::ptn:Label" tunnel="yes"/>
                <xsl:with-param name="ptn:Capacitance" select="preceding-sibling::ptn:Capacitance" tunnel="yes"/>
            </xsl:apply-templates>
        
        <!--</ptn:Simulated_potential.input.vector>-->
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulated_potential.input.vector" match="ptn:Inputs">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential.input.vector" match="ptn:Input">
        <xsl:param name="ptn:Label" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation_body_time" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Capacitance" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulated_potential.input.vector__x3A__offset" select="1.3"/>
        <xsl:choose>
            <xsl:when test="ptn:Input_exec_receptor = $ptn:Label and number(ptn:Input_exec_time) &gt;= number($ptn:Simulation_body_time) and number(ptn:Input_exec_time) &lt; ( number($ptn:Simulation_body_time) + number($ptn:Simulator_tick) )">
                <ptn:Simulated_potential.input.vector>
                    <!--<xsl:attribute name="ptn:Input_exec_time" select="ptn:Input_exec_time"/>
                    <xsl:attribute name="ptn:Simulation_body_time" select="$ptn:Simulation_body_time"/>
                    <xsl:attribute name="ptn:Simulator_tick" select="$ptn:Simulator_tick"/>
                    <xsl:attribute name="ptn:Simulation_body_time_plus_Simulator_tick" select="number($ptn:Simulation_body_time) + number($ptn:Simulator_tick)"/>
                    <xsl:attribute name="debug.Input_exec_time_gt_Simulation_body_time" select="number(ptn:Input_exec_time) &gt;= number($ptn:Simulation_body_time)"/>
                    <xsl:attribute name="debug.Input_exec_time_lt_Simulation_body_time_plus_Simulator_tick" select="number(ptn:Input_exec_time) &lt; ( number($ptn:Simulation_body_time) + number($ptn:Simulator_tick) )"/>-->
                    <!--<xsl:attribute name="ptn:Simulated_potential" select=""/>-->
                    <!--<xsl:attribute name="ptn:Input_exec_Time_constant" select="ptn:Input_exec_Time_constant"/>
                    <xsl:attribute name="ptn:Input_exec_Maximum_current" select="ptn:Input_exec_Maximum_current"/>-->
                    <xsl:value-of select="ptn:Input_exec_Time_constant * ptn:Input_exec_Maximum_current * (1 div $ptn:Capacitance) * $ptn:Simulated_potential.input.vector__x3A__offset"/><!-- todo simulating input divided to Time Constant vs simulation ticks -->
                </ptn:Simulated_potential.input.vector>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulated_potential.input.vector" match="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray">
        <xsl:comment>#56-44 TODO n/[<xsl:value-of select="name()"/>]</xsl:comment>
        <xsl:message terminate="no">#56-44 TODO n/[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential.input.vector" match="*">
        <xsl:message terminate="yes">#56-56 unantended n/[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential.input.vector"  match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:message>#186B TODO PATTERN/n[<xsl:value-of select="name()"/>]  [descendand::IndexedFaceSet][@ptn:Label__x3A__fieldOfView__x3A__ray[<xsl:value-of select="descendant-or-self::IndexedFaceSet[position() &lt;3]/@ptn:Label__x3A__fieldOfView__x3A__ray"/>]]</xsl:message>
        <xsl:comment>#186B TODO PATTERN/n[<xsl:value-of select="name()"/>]  [descendand::IndexedFaceSet][@ptn:Label__x3A__fieldOfView__x3A__ray[<xsl:value-of select="descendant-or-self::IndexedFaceSet[position() &lt;3]/@ptn:Label__x3A__fieldOfView__x3A__ray"/>]]</xsl:comment>
        <!--<xsl:copy-of select="."/>-->
    </xsl:template>
    
    
    
    <!-- EMMIT --><!-- EMMIT --><!-- EMMIT --><!-- EMMIT -->
    <xsl:template mode="ptn:Simulated_potential.emmit.vector" match="ptn:Simulated_potential[preceding-sibling::ptn:Capacitance][preceding-sibling::ptn:Resistance][preceding-sibling::ptn:Label]">
        <xsl:param name="ptn:Simulation_body" tunnel="yes" required="yes"/>
        <!--<xsl:message terminate="no">#120AS testing/n[<xsl:value-of select="name()"/>]</xsl:message>-->
        <xsl:apply-templates mode="#current" select="$ptn:Simulation_body/descendant-or-self::ptn:Output__x3A__flag__x3A__emmit"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential.emmit.vector" match="ptn:Output__x3A__flag__x3A__emmit">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential.emmit.vector" match="ptn:Current_synapse__x3A__emmit">
        <xsl:param name="ptn:Label" required="yes" tunnel="yes" />
        <xsl:param name="ptn:Simulation_body_time" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulated_potential.input.vector__x3A__offset" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Capacitance" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Is_inhibitor" required="yes" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="descendant-or-self::ptn:Input[ptn:Input_exec_receptor[.=$ptn:Label]][ptn:Input__x3A__Is_inhibitor[text()='1']][number(ptn:Input_exec_time) &gt;= number($ptn:Simulation_body_time) and number(ptn:Input_exec_time) &lt; ( number($ptn:Simulation_body_time) + number($ptn:Simulator_tick) ) ]  ">
                <ptn:Simulated_potential.emmit.vector ptn:debug="#160ASINH todo/n[{name()}]  $ptn:Is_inhibitor=[{$ptn:Is_inhibitor}] ptn:Input__x3A__Is_inhibitor=[{ptn:Input__x3A__Is_inhibitor}]" ptn:Label__x3A__context="{$ptn:Label}">
                    <xsl:copy-of select="@ptn:Output_Node"/>
                    <xsl:value-of select="- sum(descendant-or-self::ptn:Input[ptn:Input_exec_receptor[.=$ptn:Label]][number(ptn:Input_exec_time) &gt;= number($ptn:Simulation_body_time) and number(ptn:Input_exec_time) &lt; ( number($ptn:Simulation_body_time) + number($ptn:Simulator_tick) ) ] /(  ptn:Input_exec_Time_constant * ptn:Input_exec_Maximum_current * (1 div $ptn:Capacitance) * $ptn:Simulated_potential.input.vector__x3A__offset )  )"/>
                </ptn:Simulated_potential.emmit.vector>
            </xsl:when>
            <xsl:when test="descendant-or-self::ptn:Input[ptn:Input_exec_receptor[.=$ptn:Label]][number(ptn:Input_exec_time) &gt;= number($ptn:Simulation_body_time) and number(ptn:Input_exec_time) &lt; ( number($ptn:Simulation_body_time) + number($ptn:Simulator_tick) ) ]  ">
                <ptn:Simulated_potential.emmit.vector ptn:debug="#160ASA todo/n[{name()}]  $ptn:Is_inhibitor=[{$ptn:Is_inhibitor}] ptn:Input__x3A__Is_inhibitor=[{ptn:Input__x3A__Is_inhibitor}]" ptn:Label__x3A__context="{$ptn:Label}">
                    <xsl:copy-of select="@ptn:Output_Node"/>
                    <xsl:value-of select="sum(descendant-or-self::ptn:Input[ptn:Input_exec_receptor[.=$ptn:Label]][number(ptn:Input_exec_time) &gt;= number($ptn:Simulation_body_time) and number(ptn:Input_exec_time) &lt; ( number($ptn:Simulation_body_time) + number($ptn:Simulator_tick) ) ] /(  ptn:Input_exec_Time_constant * ptn:Input_exec_Maximum_current * (1 div $ptn:Capacitance) * $ptn:Simulated_potential.input.vector__x3A__offset )  )"/>
                </ptn:Simulated_potential.emmit.vector>
            </xsl:when>
            
        </xsl:choose>
                
    </xsl:template>
    
    <!--<xsl:template mode="ptn:Simulated_potential.emmit.vector" match="ptn:Current_synapse__x3A__emmit[ptn:Input__x3A__Is_inhibitor[text() = '1']]">
        <xsl:param name="ptn:Label" required="yes" tunnel="yes" />
        <xsl:param name="ptn:Simulation_body_time" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulated_potential.input.vector__x3A__offset" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Capacitance" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Is_inhibitor" required="yes" tunnel="yes"/>
        <xsl:message>160ASAI[INHIBITOR SUBSTRACT]</xsl:message>
        <xsl:choose>
            <xsl:when test="descendant-or-self::ptn:Input[ptn:Input_exec_receptor[.=$ptn:Label]][number(ptn:Input_exec_time) &gt;= number($ptn:Simulation_body_time) and number(ptn:Input_exec_time) &lt; ( number($ptn:Simulation_body_time) + number($ptn:Simulator_tick) ) ]  ">
                <ptn:Simulated_potential.emmit.vector ptn:debug="#160ASA-INHIBITOR SUBSTRACT todo/n[{name()}]" ptn:Label="{$ptn:Label} $ptn:Is_inhibitor=[{$ptn:Is_inhibitor}] ptn:Is_inhibitor=[{ptn:Is_inhibitor}]">
                    <xsl:copy-of select="@ptn:Output_Node"/>
                    <xsl:value-of select="- sum(descendant-or-self::ptn:Input[ptn:Input_exec_receptor[.=$ptn:Label]][number(ptn:Input_exec_time) &gt;= number($ptn:Simulation_body_time) and number(ptn:Input_exec_time) &lt; ( number($ptn:Simulation_body_time) + number($ptn:Simulator_tick) ) ] /(  ptn:Input_exec_Time_constant * ptn:Input_exec_Maximum_current * (1 div $ptn:Capacitance) * $ptn:Simulated_potential.input.vector__x3A__offset )  )"/>
                </ptn:Simulated_potential.emmit.vector>
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>-->
    
    
    <xsl:template mode="ptn:Simulated_potential.emmit.vector" match="*">
        <xsl:message terminate="yes">#159AS unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <!-- EMMIT --><!-- EMMIT --><!-- EMMIT --><!-- EMMIT -->
    
    <xsl:template mode="ptn:Simulated_potential__x3A__vectors.sum" match="ptn:Simulated_potential__x3A__vectors">
        <!--<ptn:Simulated_potential__x3A__vectors.sum>-->
        <xsl:apply-templates mode="#current"/>
        <!--</ptn:Simulated_potential__x3A__vectors.sum>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential__x3A__vectors.sum" match="ptn:Simulated_potential.resting.vector|ptn:Simulated_potential.input.vector|ptn:Simulated_potential.emmit.vector">
        <xsl:param name="ptn:Firing_threshold" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulated_potential" required="yes" tunnel="yes"/>
       <!-- <xsl:choose>
            <xsl:when test="$ptn:Simulated_potential + sum(preceding-sibling::*/text()) &gt; $ptn:Firing_threshold">
                <ptn:Simulated_potential.output.vector>todo</ptn:Simulated_potential.output.vector>
            </xsl:when>
            <xsl:when test="$ptn:Simulated_potential + sum(preceding-sibling::*/text()) &lt;= $ptn:Firing_threshold">-->
                <ptn:Simulated_potential__x3A__vectors.sum>
                    <xsl:value-of select="$ptn:Simulated_potential + sum(preceding-sibling::*/text()) + text()"/>
                </ptn:Simulated_potential__x3A__vectors.sum>
           <!-- </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">#123 unantended otherwise</xsl:message>
            </xsl:otherwise>
        </xsl:choose>-->
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulated_potential__x3A__vectors.sum" match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:message terminate="no">#110X [ptn:Input__x3A__generate__x3A__pattern] unantended n/[<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:comment >#110X [ptn:Input__x3A__generate__x3A__pattern] unantended n/[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential__x3A__vectors.sum" match="*">
        <xsl:message terminate="yes">#110 unantended n/[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
</xsl:stylesheet>