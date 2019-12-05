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
    
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Simulation.analys.xml[ptn:Receptors]">
        <ptn:Input__x3A__generate.xml>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:debug">#17 [TODO[MIGRATE[CONTINUE]]]</xsl:attribute>
            <xsl:attribute name="ptn:Simulation_body_tick" select="1"/>
            <xsl:attribute name="ptn:Simulation_body_time" select="1"/>
            <xsl:attribute name="ptn:Simulator_tick" select="1"/>
            <xsl:attribute name="ptn:Simulation_ticks" select="$ptn:Simulation_ticks"/>
            <xsl:attribute name="ptn:Simulation_body_time__x3A__last" select="0"/>
            <xsl:copy-of select="doc(concat($ptn:Inputs,'.Defaults.xml'))"/>
            <xsl:copy-of select="doc($ptn:Inputs)"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulator_tick" select="1" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_ticks" select="$ptn:Simulation_ticks" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_ticks__x3A__real" select="$ptn:Simulation_ticks+ 1" tunnel="yes"/>
                <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
            </xsl:apply-templates>
            <ptn:Simulation>
                <ptn:Simulator_tick><xsl:value-of select="1"/></ptn:Simulator_tick>
                <ptn:Simulation_ticks><xsl:value-of select="$ptn:Simulation_ticks"/></ptn:Simulation_ticks>
            </ptn:Simulation>
        </ptn:Input__x3A__generate.xml>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate.xml[ptn:Simulation[ptn:Simulator_tick]]">
        <ptn:Input__x3A__generate.xml>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:Simulation_body_tick" select="1"/>
            <xsl:attribute name="ptn:Simulation_body_time" select="ptn:Simulation/ptn:Simulator_tick"/>
            <xsl:attribute name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick"/>
            <xsl:attribute name="ptn:Simulation_ticks" select="ptn:Simulation/ptn:Simulation_ticks"/>
            <xsl:attribute name="ptn:Simulation_body_time__x3A__last" select="0"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_ticks" select="ptn:Simulation/ptn:Simulation_ticks" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_ticks__x3A__real" select="ptn:Simulation/ptn:Simulation_ticks + 1" tunnel="yes"/>
                <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
            </xsl:apply-templates>
        </ptn:Input__x3A__generate.xml>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Simulated_potential__x3A__vectors|ptn:Simulated_potential.resting.vector|ptn:Simulated_potential__x3A__vectors.sum">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Current_synapse|ptn:Nodes">
        <xsl:message>#41 TODO MIGRATE [n][<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="*">
        <xsl:message terminate="yes">#34 unantended n[<xsl:value-of select="name()"/>]  [*/n[<xsl:for-each select="*">
            <xsl:value-of select="name()"/>]
        </xsl:for-each>]</xsl:message>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Defaults">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Receptors">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Receptor">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|ptn:Is_inhibitor|ptn:Outputs|ptn:Input__x3A__nodes">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Simulated_potential|ptn:Receptor_regex_filter">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Reset_potential|ptn:Firing_threshold|ptn:Adaptation_conductance|ptn:Adaptation_time_constant">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Refactory_period|ptn:Maximum_current|ptn:Time_constant|ptn:Delay|ptn:Attract_min">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Inputs|ptn:Input__x3A__generate__x3A__pattern">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Group__x3A__generate__x3A__pattern_Group">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Input__x3A__generate__x3A__Shape|ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:keyValue__generate__basepoint_1|ptn:keyValue__generate__basepoint_2|ptn:Input__x3A__generate__x3A__pattern__Receptor__emmit__Interpolator__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Input_exec_Maximum_current__x3A__generate__x3A__pattern|ptn:Input_exec_timex__x3A__generate__x3A__pattern|ptn:Input_exec_receptor__x3A__generate__x3A__pattern|ptn:Input_exec_Time_constant__x3A__generate__x3A__pattern">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Input__x3A__generate__x3A__pattern__x3A__Appearance|ptn:Input__x3A__generate__x3A__pattern__x3A__Material|ptn:Input__x3A__generate__x3A__pattern__x3A__LineProperties">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Simulation|ptn:Simulator_tick|ptn:Simulation_ticks">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
                                                         
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Input__x3A__generate__x3A__pattern_Group[ptn:Input__x3A__generate__x3A__pattern__Receptor__emmit__Interpolator__x3A__vector]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:debug">#42 + balancing Vectors  ; <xsl:value-of select="@ptn:debug"/></xsl:attribute>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Input__x3A__generate__x3A__pattern_Group" select="." tunnel="yes"/>
                <xsl:with-param name="ptn:Input__x3A__generate__x3A__pattern__Receptor__emmit__Interpolator__x3A__vector" select="ptn:Input__x3A__generate__x3A__pattern__Receptor__emmit__Interpolator__x3A__vector" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate" match="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector">
        <xsl:param name="ptn:Simulator_tick" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation_ticks" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation_ticks__x3A__real" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_Group" tunnel="yes" required="yes"/>
        <xsl:variable name="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector" select="."/>
        <xsl:variable name="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector.prev" select="preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector[1]"/>
        <xsl:variable name="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector.next" select="following-sibling::ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector[1]"/>
        <xsl:variable name="ptn:Simulator_tick__count__step" select="1 div $ptn:Simulation_ticks__x3A__real"/>
        <xsl:variable name="ptn:Simulator_tick__count__step_delta" >
            <xsl:choose>
                <xsl:when test="$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector.prev/@ptn:MFVec3f__x3A__distance__x3A__percent">
                    <xsl:value-of select="@ptn:MFVec3f__x3A__distance__x3A__percent - $ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector.prev/@ptn:MFVec3f__x3A__distance__x3A__percent"/>
                </xsl:when>
                <xsl:otherwise><xsl:value-of select="@ptn:MFVec3f__x3A__distance__x3A__percent"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="ptn:Simulator_tick__count__step_delta_next" select="$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector.next/@ptn:MFVec3f__x3A__distance__x3A__percent -@ptn:MFVec3f__x3A__distance__x3A__percent "/>
        
        <xsl:choose>
            <xsl:when test="$ptn:Simulator_tick__count__step_delta div $ptn:Simulator_tick__count__step &gt;= 2">
                <xsl:for-each select="1 to xs:integer(round($ptn:Simulator_tick__count__step_delta div $ptn:Simulator_tick__count__step))">
                    <ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector   ptn:Simulator_tick__count__step_delta_count="{last()}"   ><!-- ptn:Simulator_tick__count__step_delta="{$ptn:Simulator_tick__count__step_delta}" --><!-- ORYG="{$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector/@ptn:MFVec3f__x3A__distance__x3A__percent}" --><!-- Simulator_tick__count__step_delta.pos="{.}" --><!-- ptn:Simulator_tick__count__step_delta_next="{$ptn:Simulator_tick__count__step_delta_next}" -->
                        <xsl:copy-of select="$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector/@*"/>
                        <xsl:attribute name="ptn:MFVec3f__x3A__distance__x3A__percent" select="$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector/@ptn:MFVec3f__x3A__distance__x3A__percent - $ptn:Simulator_tick__count__step_delta +  $ptn:Simulator_tick__count__step * xs:double(.)"/>
                        <xsl:attribute name="ptn:Coordinate_X__x3A__vector" select="$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector/@ptn:Coordinate_X__x3A__vector div xs:double(last())"/>
                        <xsl:attribute name="ptn:Coordinate_Y__x3A__vector" select="$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector/@ptn:Coordinate_Y__x3A__vector div xs:double(last())"/>
                        <xsl:attribute name="ptn:Coordinate_Z__x3A__vector" select="$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector/@ptn:Coordinate_Z__x3A__vector div xs:double(last())"/>
                    </ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector >
                    <xsl:copy-of select="@*"/>
                </ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector>
            </xsl:otherwise>
        </xsl:choose>
        
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
                                <ptn:Input last="{last()}" pos="{position()}" ptn:debug="121 ptn:Input_exec_time__x3A__diff[{$ptn:Input_exec_time__x3A__diff}]  ptn:Input_exec_receptor__x3A__diff[{$ptn:Input_exec_receptor__x3A__diff}]"
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