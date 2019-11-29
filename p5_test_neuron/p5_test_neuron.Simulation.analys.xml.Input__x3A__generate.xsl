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
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate.xml">
        <ptn:Input__x3A__generate.xml>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:Simulation_body_tick" select="1"/>
            <xsl:attribute name="ptn:Simulation_body_time" select="ptn:Simulation/ptn:Simulator_tick"/>
            <xsl:attribute name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick"/>
            <xsl:attribute name="ptn:Simulation_ticks" select="ptn:Simulation/ptn:Simulation_ticks"/>
            <xsl:attribute name="ptn:Simulation_body_time__x3A__last" select="0"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
            </xsl:apply-templates>
        </ptn:Input__x3A__generate.xml>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Input__x3A__generate">
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Receptors" required="yes" tunnel="yes"/>
        <xsl:message>#36IIG II m/n[<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:variable name="ptn:Input__x3A__generate__x3A__current" select="."/>
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
            
        
        
    </xsl:template>
    
    
    
    
</xsl:stylesheet>