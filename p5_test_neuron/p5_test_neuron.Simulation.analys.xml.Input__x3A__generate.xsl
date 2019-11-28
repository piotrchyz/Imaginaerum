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
    
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:message>#19 [TODO]  /n[<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:copy-of select="."></xsl:copy-of>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input__x3A__generate">
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Receptors" required="yes" tunnel="yes"/>
        <xsl:variable name="ptn:Input__x3A__generate__x3A__current" select="."/>
        
        <xsl:variable name="ptn:Inputs">
            <ptn:Inputs>
            <xsl:for-each select="1 to @ptn:Input__x3A__generate__x3A__sequences">
                <xsl:comment>#78 [ptn:Input__x3A__generate] test 1</xsl:comment>
                <xsl:message>#78 [ptn:Input__x3A__generate] test 1</xsl:message>
                <xsl:variable name="current_pos" select="position()"/>
                <xsl:choose>
                    <xsl:when test="1 = 1">
                        <xsl:variable name="ptn:Input_exec_time__x3A__pause" select="$ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_time/@ptn:Input_exec_time__x3A__pause"/>
                        <xsl:variable name="ptn:Input_exec_time__x3A__diff" select="last()"/><!--  -->
                        <xsl:variable name="ptn:Input_exec_time__x3A__diff_vals" select="$ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_time/@ptn:Input_exec_time__x3A__end - $ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_time/@ptn:Input_exec_time__x3A__start"/>
                        <xsl:variable name="ptn:Input_exec_time__x3A__step" select="$ptn:Input_exec_time__x3A__diff_vals div last()"/>
                        <xsl:variable name="ptn:Input_exec_time__x3A__set" select="$ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_time/@ptn:Input_exec_time__x3A__start + ($ptn:Input_exec_time__x3A__step * (position() - 1) * $ptn:Input_exec_time__x3A__pause)"/>
                        <xsl:variable name="ptn:Input_exec_receptor__x3A__diff" select="- $ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_receptor/@ptn:Input_exec_receptor__start + $ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_receptor/@ptn:Input_exec_receptor__end"/>
                        <xsl:variable name="ptn:Input_exec_receptor__x3A__diff_step" select="$ptn:Input_exec_receptor__x3A__diff div $ptn:Input_exec_time__x3A__diff"/>
                        <xsl:variable name="ptn:Input_exec_receptor__x3A__prop" select="$ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_receptor/@ptn:Input_exec_receptor__start + $ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_receptor/@ptn:Input_exec_receptor__end"/>
                        <xsl:variable name="ptn:Input_exec_receptor__x3A__set" select="$ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_receptor/@ptn:Input_exec_receptor__start  + $ptn:Input_exec_receptor__x3A__diff_step * ( position() -1 )"/>
                        <xsl:variable name="ptn:Input_exec_receptor__x3A__set_R" select="round($ptn:Input_exec_receptor__x3A__set)"/>
                        
                        <xsl:variable name="ptn:Input_exec_time__x3A__pause__x3A__mod" select="position() mod $ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_time/@ptn:Input_exec_time__x3A__pause"/>
                        <xsl:choose>
                            <xsl:when test="not($ptn:Receptors//ptn:Receptor[position() = $ptn:Input_exec_receptor__x3A__set_R ])">
                                <xsl:comment>#64A [NOT FOUND RECEPTOR][#[<xsl:value-of select="$ptn:Input_exec_receptor__x3A__set_R"/>]]</xsl:comment>
                            </xsl:when>
                            <xsl:when test="$ptn:Input_exec_time__x3A__pause__x3A__mod &lt; $ptn:Input_exec_time__x3A__step">
                                <ptn:Input last="{last()}" pos="{position()}" ptn:debug=" ptn:Input_exec_time__x3A__diff[{$ptn:Input_exec_time__x3A__diff}]  ptn:Input_exec_receptor__x3A__diff[{$ptn:Input_exec_receptor__x3A__diff}]"
                                    ptn:Input_exec_time__x3A__diff="{$ptn:Input_exec_time__x3A__diff}"
                                    ptn:Input_exec_time__x3A__step="{$ptn:Input_exec_time__x3A__step}"
                                    ptn:Input_exec_time__x3A__set="{$ptn:Input_exec_time__x3A__set}"
                                    ptn:Input_exec_receptor__x3A__prop="{$ptn:Input_exec_receptor__x3A__prop}"
                                    ptn:Input_exec_receptor__x3A__diff="{$ptn:Input_exec_receptor__x3A__diff}"
                                    ptn:Input_exec_receptor__x3A__diff_step="{$ptn:Input_exec_receptor__x3A__diff_step}"
                                    ptn:Input_exec_receptor__x3A__set="{$ptn:Input_exec_receptor__x3A__set}"
                                    ptn:Input_exec_receptor__x3A__set_R="{$ptn:Input_exec_receptor__x3A__set_R}"
                                    ptn:Input_exec_time__x3A__pause="{$ptn:Input_exec_time__x3A__pause}"
                                    ptn:Input_exec_time__x3A__pause__x3A__mod="{$ptn:Input_exec_time__x3A__pause__x3A__mod}"
                                    >
                                    <xsl:attribute name="ptn:Input_exec_receptor__x3A__set" select="$ptn:Input_exec_receptor__x3A__set"/>
                                    <ptn:Input_exec_time><xsl:value-of select="round($ptn:Input_exec_time__x3A__set)"/></ptn:Input_exec_time>
                                    <ptn:Input_exec_receptor><xsl:value-of select="$ptn:Receptors//ptn:Receptor[position() = $ptn:Input_exec_receptor__x3A__set_R ]/ptn:Label"/></ptn:Input_exec_receptor>
                                    <ptn:Input_exec_Time_constant><xsl:value-of select="$ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_Time_constant/@ptn:Input_exec_Time_constant__x3A__start"/></ptn:Input_exec_Time_constant>
                                    <ptn:Input_exec_Maximum_current><xsl:value-of select="$ptn:Input__x3A__generate__x3A__current/ptn:Input_exec_Maximum_current/@ptn:Input_exec_Maximum_current__x3A__start"/></ptn:Input_exec_Maximum_current>
                                </ptn:Input>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:comment>#64 [GENERATE][MOD[<xsl:value-of select="$ptn:Input_exec_time__x3A__pause__x3A__mod"/>]] [pos[<xsl:value-of select="position()"/>]]</xsl:comment>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:comment>#45 done</xsl:comment>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:comment>#94 no such receptor error</xsl:comment>
                    </xsl:otherwise>
                </xsl:choose>
                
                
            </xsl:for-each>
            </ptn:Inputs>
        </xsl:variable>
        <xsl:apply-templates mode="ptn:Simulation.analys.xml" select="$ptn:Inputs//ptn:Input"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Receptor__x3A__generate"/>
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" match="*"/>
    
    
    <xsl:template name="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" >
        <!--<xsl:param name="ptn:Receptors" tunnel="yes" required="yes"/>-->
        <xsl:apply-templates mode="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" select="descendant-or-self::ptn:Receptor__x3A__generate"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" match="ptn:Receptor__x3A__generate" >
        
        <xsl:variable name="ptn:Receptor__x3A__generate" select="."/>
        <xsl:message>#85AGG [ptn:Receptor__x3A__generate]  </xsl:message>
        <xsl:comment>#85AGG [ptn:Receptor__x3A__generate] [<xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__max "/>][to][<xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__max"/>]</xsl:comment>
        <xsl:for-each select="$ptn:Receptor__x3A__generate/ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__min to $ptn:Receptor__x3A__generate/ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__max">
            <xsl:variable name="ptn:Coordinate_X__x3A__generated" select="."/>
            <!--<xsl:comment>#90 ptn:Coordinate_X__x3A__generated[<xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>] </xsl:comment>-->
            <xsl:for-each select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__min to $ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__max">
                <xsl:variable name="ptn:Coordinate_Y__x3A__generated" select="."/>
                <!--<xsl:comment>#90 ptn:Coordinate_X__x3A__generated[<xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>] </xsl:comment>-->
                <xsl:message>#90 ptn:Coordinate_X__x3A__generated[<xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>][<xsl:value-of select="$ptn:Coordinate_Y__x3A__generated"/>] </xsl:message>
                <ptn:Receptor>
                    <ptn:Label><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Label/@ptn:Label__x3A__generate__x3A__prefix"/><xsl:text>_X</xsl:text><xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>_Y<xsl:value-of select="$ptn:Coordinate_Y__x3A__generated"/>_Z<xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Z/@ptn:Coordinate_Z__x3A__generate__min"/></ptn:Label>
                    <ptn:Coordinate_X ><xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/></ptn:Coordinate_X>
                    <ptn:Coordinate_Y ><xsl:value-of select="$ptn:Coordinate_Y__x3A__generated"/></ptn:Coordinate_Y>
                    <ptn:Coordinate_Z ><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Z/@ptn:Coordinate_Z__x3A__generate__min"/></ptn:Coordinate_Z>
                    <ptn:Capacitance><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Capacitance"/></ptn:Capacitance>
                    <ptn:Resistance><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Resistance"/></ptn:Resistance>
                    <ptn:Minimum_voltage><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Minimum_voltage"/></ptn:Minimum_voltage>
                    <ptn:Maximum_voltage><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Maximum_voltage"/></ptn:Maximum_voltage>
                    <ptn:Resting_potential><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Resting_potential"/></ptn:Resting_potential>
                    <ptn:Reset_potential><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Reset_potential"/></ptn:Reset_potential>
                    <ptn:Firing_threshold><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Firing_threshold"/></ptn:Firing_threshold>
                    <ptn:Refactory_period><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Refactory_period"/></ptn:Refactory_period>
                    <ptn:Is_inhibitor><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Is_inhibitor"/></ptn:Is_inhibitor>
                    <ptn:Outputs/>
                    <ptn:Input__x3A__nodes/>
                    <ptn:Simulated_potential><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Simulated_potential"/></ptn:Simulated_potential>
                    <ptn:Receptor_regex_filter><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Label/@ptn:Label__x3A__generate__x3A__prefix"/><xsl:text>_X</xsl:text><xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>_Y<xsl:value-of select="$ptn:Coordinate_Y__x3A__generated"/>_Z<xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Z/@ptn:Coordinate_Z__x3A__generate__min"/></ptn:Receptor_regex_filter>
                </ptn:Receptor>
 
 
            </xsl:for-each>
            
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>