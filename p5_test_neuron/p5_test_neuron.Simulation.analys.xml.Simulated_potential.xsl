<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template  name="ptn:Simulated_potential" >
        <xsl:apply-templates mode="ptn:Simulated_potential" select="."/>        
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulated_potential"  match="ptn:Simulated_potential[preceding-sibling::ptn:Capacitance][preceding-sibling::ptn:Resistance][preceding-sibling::ptn:Resting_potential]">
        
        <xsl:copy>
            <xsl:apply-templates mode="ptn:Simulated_potential.resting.vector" select="."/>
            <xsl:apply-templates mode="ptn:Simulated_potential.input.vector" select="."/>
            <xsl:message terminate="no">#13-13 name()<xsl:value-of select="name()"/> TODO </xsl:message>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulated_potential"  match="*">
        <xsl:message terminate="yes">27 incorrect format <xsl:value-of select="name()"/></xsl:message>
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
        <!--<xsl:attribute name="ptn:Simulated_potential.resting.vector.1_div_membr" select="1 div preceding-sibling::ptn:Resistance"/>
        <xsl:attribute name="ptn:Simulated_potential.resting.vector.rest_pot" select=". - preceding-sibling::ptn:Resting_potential"/>-->
        <ptn:Simulated_potential.resting.vector>
            <xsl:value-of select=". - (( 1 div preceding-sibling::ptn:Resistance ) * ( . - preceding-sibling::ptn:Resting_potential ) div preceding-sibling::ptn:Capacitance ) * $ptn:Simulator_tick"/>
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
        <xsl:choose>
            <xsl:when test="ptn:Input_exec_receptor = $ptn:Label and ptn:Input_exec_time &gt;= $ptn:Simulation_body_time and ptn:Input_exec_time &lt; ( $ptn:Simulation_body_time + $ptn:Simulator_tick )">
                <ptn:Simulated_potential.input.vector>
                    <xsl:value-of select="ptn:Input_exec_Time_constant * ptn:Input_exec_Maximum_current div (1 div $ptn:Capacitance)"/><!-- todo simulating input divided to Time Constant vs simulation ticks -->
                </ptn:Simulated_potential.input.vector>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulated_potential.input.vector" match="*">
        <xsl:message terminate="yes">#56-56 unantended n/[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
</xsl:stylesheet>