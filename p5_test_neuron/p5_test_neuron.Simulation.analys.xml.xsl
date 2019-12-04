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
    
    <xsl:include href="p5_test_neuron.Simulation.analys.xml.Simulated_potential.xsl"/>
    
   <xsl:include href="p5_test_neuron.Simulation.analys.xml__x3A__Receptor__x3A__generate.xsl"/>
   
   
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match.xml[ptn:Simulation[ptn:Simulator_tick]][ptn:Inputs][ptn:Defaults[ptn:Attract_min]]"><!-- ptn:Config -->
        <xsl:message>#13 todo ptn:Config</xsl:message>
        <ptn:Simulation.analys.xml
            xsi:schemaLocation="p5_test_neuron file:{$ptn:xsd}"
            >
            <xsl:copy-of select="descendant-or-self::*/namespace::*"></xsl:copy-of>
            <xsl:copy-of select="ancestor-or-self::*/namespace::*"></xsl:copy-of>
            <xsl:attribute name="ptn:Simulation_body_tick" select="1"/>
            <xsl:attribute name="ptn:Simulation_body_time" select="ptn:Simulation/ptn:Simulator_tick"/>
            <xsl:attribute name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick"/>
            <xsl:attribute name="ptn:Simulation_body_time__x3A__last" select="0"/>
            <xsl:attribute name="ptn:Simulation_ticks" select="ptn:Simulation/ptn:Simulation_ticks"/>
            <!--<xsl:apply-templates mode="#current" select="@*"/>-->
            <!--<xsl:variable name="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate">
                <xsl:call-template name="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate"/>
            </xsl:variable>-->
            <!--<xsl:variable name="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate__x3A__merged">
                <xsl:copy-of select="ptn:Receptors"/>
                <xsl:copy-of select="$ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate"/>
            </xsl:variable>-->
            <!--<xsl:copy-of select="$ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate"></xsl:copy-of>-->
            <!--<xsl:variable name="ptn:Receptors">
                <xsl:copy-of select="ptn:Receptors"/>
                <xsl:copy-of select="$ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate"></xsl:copy-of>
            </xsl:variable>-->
            <!--<xsl:variable name="ptn:Inputs">
                <xsl:apply-templates mode="#current" select="ptn:Inputs/*">
                    <xsl:with-param name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                    <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
                </xsl:apply-templates>
            </xsl:variable>-->
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Inputs" select="ptn:Inputs" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body_time" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Attract_min" tunnel="yes" select="ptn:Defaults/ptn:Attract_min"/>
                <xsl:with-param name="ptn:Simulation_body" select="." tunnel="yes"/>
                <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
                <!--<xsl:with-param name="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" select="$ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" tunnel="yes"/>-->
            </xsl:apply-templates>
            <ptn:Nodes>
                
            </ptn:Nodes>
        </ptn:Simulation.analys.xml>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input__x3A__generate__x3A__pattern|ptn:Group__x3A__generate__x3A__pattern_Group|ptn:Input__x3A__generate__x3A__Shape">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray|IndexedFaceSet">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input__x3A__generate__x3A__pattern_Group|ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector|ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:keyValue__generate__basepoint__x3A__calculations|Coordinate">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector">
        <xsl:comment>#85 [byppased][n][<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Group__x3A__generate__x3A__pattern_Groupxxx">
        <xsl:message terminate="yes">#666 [TODO]  unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:comment>#666 [TODO]  unantended/n[<xsl:value-of select="name()"/>]</xsl:comment>
        <xsl:copy-of select="."></xsl:copy-of>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Simulation.model.apply.xml[@ptn:Simulator_tick][@ptn:Simulation_body_time]">
        <xsl:message>#14 todo ptn:Config</xsl:message>
        <ptn:Simulation.analys.xml>
            <xsl:copy-of select="@xsi:schemaLocation"/>
            <xsl:attribute name="ptn:Simulation_body_tick" select="@ptn:Simulation_body_tick + 1"/>
            <xsl:attribute name="ptn:Simulation_body_time" select="@ptn:Simulation_body_time + @ptn:Simulator_tick"/>
            <xsl:attribute name="ptn:Simulation_body_time__x3A__last" select="@ptn:Simulation_body_time"/>
            <xsl:copy-of select="@ptn:Simulator_tick"/>
            <xsl:copy-of select="descendant-or-self::*/namespace::*"></xsl:copy-of>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulator_tick" select="@ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body_time" select="@ptn:Simulation_body_time + @ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Inputs" select="doc($ptn:Inputs)//ptn:Inputs" tunnel="yes"/>
                <xsl:with-param name="ptn:Attract_min" select="doc($ptn:Config)//ptn:Defaults/ptn:Attract_min" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body" select="." tunnel="yes"/>
            </xsl:apply-templates>
        </ptn:Simulation.analys.xml>
    </xsl:template>
    
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Receptors">
        <!--<xsl:param name="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" tunnel="yes"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <!--<xsl:copy-of select="$ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate"/>-->
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Nodes">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Receptor|ptn:Leaky_neuron_standard|ptn:Leaky_neuron_inhibitor|ptn:Leaky_neuron_inhibitor__x3A__AB|ptn:Leaky_neuron_inhibitor__X3A__AA">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Outputs" select="ptn:Outputs" tunnel="yes"/>
                <xsl:with-param name="ptn:Is_inhibitor" select="ptn:Is_inhibitor" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Current_synapse|ptn:Receptor_regex_filter|ptn:Input__x3A__nodes|ptn:Input__x3A__node">
        <xsl:copy>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Output_Node|ptn:Outputs|ptn:Maximum_current|ptn:Time_constant|ptn:Delay">
        <xsl:copy>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Inputs">
        <xsl:comment>#51 ptn:Inputs transformed to:<xsl:value-of select="$ptn:Inputs"/></xsl:comment>
        <xsl:result-document href="{$ptn:Inputs}" >
            <xsl:copy copy-namespaces="yes" >
                <xsl:copy-of select="ancestor-or-self::*/namespace::*"></xsl:copy-of>
                <xsl:apply-templates mode="#current"/>
                <xsl:apply-templates mode="ptn:Simulation.analys.xml__x3A__Input__x3A__generate__x3A__pattern__x3A__apply_match_ray" select="descendant-or-self::ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray"/>
            </xsl:copy>
        </xsl:result-document>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__Input__x3A__generate__x3A__pattern__x3A__apply_match_ray" match="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray[@ptn:Simulation_tick__x3A__context][@ptn:Label__x3A__fieldOfView__x3A__ray]">
        <xsl:param name="ptn:Receptors" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input_exec_Time_constant__x3A__default" select="1"/>
        <xsl:param name="ptn:Input_exec_Maximum_current__x3A__default" select="2"/>
        <ptn:Input ptn:debug="#190 append ray [TODO[$ptn:Input_exec_Time_constant__x3A__default][$ptn:Input_exec_Maximum_current__x3A__default]]">
            <ptn:Input_exec_time><xsl:value-of select="@ptn:Simulation_tick__x3A__context"/></ptn:Input_exec_time>
            <ptn:Input_exec_receptor><xsl:value-of select="@ptn:Label__x3A__fieldOfView__x3A__ray"/></ptn:Input_exec_receptor>
            <!--<ptn:Input_exec_Time_constant><xsl:value-of select="$ptn:Receptors//ptn:Receptor[@ptn:Label = current()/@ptn:Label__x3A__fieldOfView__x3A__ray]/"/></ptn:Input_exec_Time_constant>-->
            <ptn:Input_exec_Time_constant><xsl:value-of select="$ptn:Input_exec_Time_constant__x3A__default"/></ptn:Input_exec_Time_constant>
            <ptn:Input_exec_Maximum_current><xsl:value-of select="$ptn:Input_exec_Maximum_current__x3A__default"/></ptn:Input_exec_Maximum_current>
            <ptn:Input__x3A__Is_inhibitor><xsl:value-of select="0"/></ptn:Input__x3A__Is_inhibitor>
        </ptn:Input>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__Input__x3A__generate__x3A__pattern__x3A__apply_match_ray" match="*">
        <xsl:message terminate="yes">#187 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input[ptn:Input_exec_time][ptn:Input_exec_receptor][ptn:Input_exec_Time_constant][ptn:Input_exec_Maximum_current][not(parent::ptn:Current_synapse__x3A__emmit)]">
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:choose>
            <xsl:when test="number(ptn:Input_exec_Time_constant) &lt;= number($ptn:Simulator_tick)">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>#126[ptn:Simulation.analys.xml][ptn:Simulation.analys.xml__x3A__divide_input]</xsl:message>
                <xsl:call-template name="ptn:Simulation.analys.xml__x3A__divide_input">
                    <xsl:with-param name="ptn:Input" select="." tunnel="yes"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.analys.xml__x3A__divide_input">
        <xsl:apply-templates mode="ptn:Simulation.analys.xml__x3A__divide_input"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__divide_input" match="ptn:Input_exec_Time_constant">
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Input" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Is_inhibitor" tunnel="yes" select="0"/>
        <xsl:choose>
            <xsl:when test="number(.) &lt;= number($ptn:Simulator_tick)">
                <xsl:message terminate="yes">#154 error, should not be such case [ptn:Input_exec_Time_constant]=[$ptn:Simulator_tick]</xsl:message>
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:variable name="ptn:Input" select="."/>-->
                <xsl:for-each select="1 to xs:integer(ceiling(ceiling(.) div $ptn:Simulator_tick))"><!-- 1 to xs:integer(ceiling(ptn:Input_exec_Time_constant)) -->
                    <xsl:choose>
                        <xsl:when test="position() = last()">
                            <ptn:Input ptn:debug="#97 optimized input {.} to {ceiling($ptn:Input//ptn:Input_exec_Time_constant)} for $ptn:Simulator_tick={$ptn:Simulator_tick}">
                                <ptn:Input_exec_time><xsl:value-of select="$ptn:Input//ptn:Input_exec_time + ( . - 1) * $ptn:Simulator_tick "/></ptn:Input_exec_time>
                                <xsl:choose>
                                    <xsl:when test="$ptn:Input//ptn:Input_exec_time__x3A__initial"/>
                                    <xsl:otherwise>
                                        <ptn:Input_exec_time__x3A__initial><xsl:value-of select="$ptn:Input//ptn:Input_exec_time"/></ptn:Input_exec_time__x3A__initial>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:copy-of select="$ptn:Input//ptn:Input_exec_receptor"/>
                                <ptn:Input_exec_Time_constant><!--<xsl:value-of select="$ptn:Input//ptn:Input_exec_Time_constant - . + $ptn:Simulator_tick"/>-->
                                    <xsl:choose>
                                        <xsl:when test="$ptn:Input//ptn:Input_exec_Time_constant mod $ptn:Simulator_tick = 0">
                                            <xsl:value-of select="$ptn:Simulator_tick"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select=" $ptn:Input//ptn:Input_exec_Time_constant mod $ptn:Simulator_tick"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </ptn:Input_exec_Time_constant>
                                <xsl:copy-of select="$ptn:Input//ptn:Input_exec_Maximum_current"/>
                                <ptn:Input__x3A__Is_inhibitor><xsl:value-of select="$ptn:Is_inhibitor"/></ptn:Input__x3A__Is_inhibitor>
                            </ptn:Input>
                        </xsl:when>
                        <xsl:otherwise>
                            <ptn:Input ptn:debug="#106 optimized input {.} to {ceiling($ptn:Input//ptn:Input_exec_Time_constant)} for $ptn:Simulator_tick={$ptn:Simulator_tick}">
                                <ptn:Input_exec_time><xsl:value-of select="$ptn:Input//ptn:Input_exec_time + ( . - 1) * $ptn:Simulator_tick"/></ptn:Input_exec_time>
                                <xsl:choose>
                                    <xsl:when test="$ptn:Input//ptn:Input_exec_time__x3A__initial"/>
                                    <xsl:otherwise>
                                        <ptn:Input_exec_time__x3A__initial><xsl:value-of select="$ptn:Input//ptn:Input_exec_time"/></ptn:Input_exec_time__x3A__initial>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:copy-of select="$ptn:Input//ptn:Input_exec_receptor"/>
                                <ptn:Input_exec_Time_constant><xsl:value-of select="$ptn:Simulator_tick"/></ptn:Input_exec_Time_constant>
                                <xsl:copy-of select="$ptn:Input//ptn:Input_exec_Maximum_current"/>
                                <ptn:Input__x3A__Is_inhibitor><xsl:value-of select="$ptn:Is_inhibitor"/></ptn:Input__x3A__Is_inhibitor>
                            </ptn:Input>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__divide_input" match="ptn:Time_constant">
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Current_synapse" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Input_time__x3A__attract" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Is_inhibitor" tunnel="yes" select="0"/>
        <xsl:choose>
            <xsl:when test="number(.) &lt;= number($ptn:Simulator_tick)">
                <xsl:message terminate="yes">#154BC error, should not be such case [ptn:Input_exec_Time_constant]=[$ptn:Simulator_tick]</xsl:message>
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:variable name="ptn:Input" select="."/>-->
                <xsl:for-each select="1 to xs:integer(ceiling(ceiling(.) div $ptn:Simulator_tick))"><!-- 1 to xs:integer(ceiling(ptn:Input_exec_Time_constant)) -->
                    <xsl:choose>
                        <xsl:when test="position() = last()">
                            <ptn:Input ptn:debug="#97CC [FORCED][ptn:Input_time][to NOW[{$ptn:Input_time__x3A__attract}]] optimized input {.} to {ceiling($ptn:Current_synapse//ptn:Input_constant)} for $ptn:Simulator_tick={$ptn:Simulator_tick} [+[ptn:Delay[{$ptn:Current_synapse/ptn:Delay}]]]">
                                <ptn:Input_exec_time><xsl:value-of select="($ptn:Input_time__x3A__attract + ( . - 1) * $ptn:Simulator_tick) + number($ptn:Current_synapse/ptn:Delay)"/></ptn:Input_exec_time>
                                <xsl:choose>
                                    <xsl:when test="$ptn:Current_synapse//ptn:Input_exec_time__x3A__initial"/>
                                    <xsl:otherwise>
                                        <ptn:Input_exec_time__x3A__initial><xsl:value-of select="$ptn:Input_time__x3A__attract"/></ptn:Input_exec_time__x3A__initial>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <ptn:Input_exec_receptor><xsl:value-of select="$ptn:Current_synapse/ptn:Output_Node"/></ptn:Input_exec_receptor>
                                <ptn:Input_exec_Time_constant><!--<xsl:value-of select="$ptn:Input//ptn:Input_exec_Time_constant - . + $ptn:Simulator_tick"/>-->
                                    <xsl:choose>
                                        <xsl:when test="$ptn:Current_synapse//ptn:Time_constant mod $ptn:Simulator_tick = 0">
                                            <xsl:value-of select="$ptn:Simulator_tick"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select=" $ptn:Current_synapse//ptn:Time_constant mod $ptn:Simulator_tick"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </ptn:Input_exec_Time_constant>
                                <ptn:Input_exec_Maximum_current><xsl:value-of select="$ptn:Current_synapse//ptn:Maximum_current"/></ptn:Input_exec_Maximum_current>
                                <ptn:Input__x3A__Is_inhibitor><xsl:value-of select="$ptn:Is_inhibitor"/></ptn:Input__x3A__Is_inhibitor>
                            </ptn:Input>
                        </xsl:when>
                        <xsl:otherwise>
                            <ptn:Input ptn:debug="#106CC optimized input {.} to {ceiling($ptn:Current_synapse//ptn:Time_constant)} for $ptn:Simulator_tick={$ptn:Simulator_tick}  [+[ptn:Delay[{$ptn:Current_synapse/ptn:Delay}]]]">
                                <ptn:Input_exec_time><xsl:value-of select="($ptn:Input_time__x3A__attract + ( . - 1) * $ptn:Simulator_tick) + number($ptn:Current_synapse/ptn:Delay)"/></ptn:Input_exec_time>
                                <xsl:choose>
                                    <xsl:when test="$ptn:Current_synapse//ptn:Input_exec_time__x3A__initial"/>
                                    <xsl:otherwise>
                                        <ptn:Input_exec_time__x3A__initial><xsl:value-of select="$ptn:Input_time__x3A__attract"/></ptn:Input_exec_time__x3A__initial>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:copy-of select="$ptn:Current_synapse//ptn:Input_exec_receptor"/>-->
                                <ptn:Input_exec_receptor><xsl:value-of select="$ptn:Current_synapse/ptn:Output_Node"/></ptn:Input_exec_receptor>
                                <ptn:Input_exec_Time_constant><xsl:value-of select="$ptn:Simulator_tick"/></ptn:Input_exec_Time_constant>
                                <ptn:Input_exec_Maximum_current><xsl:value-of select="$ptn:Current_synapse//ptn:Maximum_current"/></ptn:Input_exec_Maximum_current>
                                <ptn:Input__x3A__Is_inhibitor><xsl:value-of select="$ptn:Is_inhibitor"/></ptn:Input__x3A__Is_inhibitor>
                            </ptn:Input>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__divide_input" match="*">
        <xsl:message terminate="yes">#184 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__divide_input" match="ptn:Input_exec_time|ptn:Input_exec_receptor|ptn:Input_exec_Maximum_current|ptn:Input__x3A__Is_inhibitor"/>
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__divide_input" match="ptn:Delay|ptn:Maximum_current|ptn:Output_Node"/>
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Simulation">
        <xsl:comment>#59 transformed ptn:Simulation</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Simulated_potential">
            <xsl:call-template name="ptn:Simulated_potential"/>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="text()">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Defaults|ptn:Simulated_potential__x3A__vectors|ptn:Simulated_potential__x3A__vectors.sum|ptn:Simulation.attract__x3A__calculate|ptn:Simulation.attract__x3A__calculate.best.unique">
        <xsl:message >#52 bypassed <xsl:value-of select="name()"/></xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node"/>
        
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input__x3A__nodes__x3A__prohibit">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Output__x3A__flag__x3A__emmit">
        <xsl:comment >#241A todo <xsl:value-of select="name()"/></xsl:comment>
        <xsl:message >#241A [TODO] <xsl:value-of select="name()"/></xsl:message>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Output__x3A__flag__x3A__emmit[not(*)]">
        <xsl:comment >#241A bypassed empty <xsl:value-of select="name()"/>; [text?[<xsl:value-of select="text()"/>]]</xsl:comment>
        
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Current_synapse__x3A__emmit">
        <!--<xsl:variable name="ptn:Input__x3A__test">-->
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:comment >#241B [TODOconsumed][removed] <xsl:value-of select="name()"/></xsl:comment>
                <xsl:apply-templates mode="#current"/>
            </xsl:copy>
        <!--</xsl:variable>-->
        <!--<xsl:choose>
            <xsl:when test="$ptn:Input__x3A__test//ptn:Input">
                <xsl:copy-of select="$ptn:Input__x3A__test"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment >#241B [consumed][removed] <xsl:value-of select="name()"/></xsl:comment>
            </xsl:otherwise>
        </xsl:choose>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Current_synapse__x3A__emmit[not(*)]">
        <xsl:comment >#241B-R removed empty[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    <!--<xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Current_synapse__x3A__emmit[not(*)]">
        <xsl:comment >#241C removed empty child[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>-->
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input[parent::ptn:Current_synapse__x3A__emmit]">
        <xsl:param name="ptn:Simulation_body_time" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        
        <xsl:choose>
            <xsl:when test="number(ptn:Input_exec_time) &gt;= number($ptn:Simulation_body_time) and number(ptn:Input_exec_time) &lt; ( number($ptn:Simulation_body_time) + number($ptn:Simulator_tick) ) ">
                <xsl:comment >#60A removed/n[<xsl:value-of select="name()"/>] for ptn:Input_exec_time[<xsl:value-of select="ptn:Input_exec_time"/>]  ptn:Input_exec_receptor[<xsl:value-of select="ptn:Input_exec_receptor"/>]</xsl:comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:attribute name="ptn:debug">#257  not removed ptn:Input[parent::ptn:Current_synapse__x3A__emmit] sth coud be exact for now</xsl:attribute>
                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Simulation.attract__x3A__aggregate">
        <xsl:comment>#334 unantended/n[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="*">
        <xsl:message terminate="yes">#15AAN unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <!--<xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:message terminate="yes">#19 [TODO] unantended /n[<xsl:value-of select="name()"/>]</xsl:message>
        <!-\-<xsl:copy-of select="."></xsl:copy-of>-\->
    </xsl:template>-->
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Receptor__x3A__generate">
        <xsl:message terminate="yes">#19X [TODO] unantended /n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Output__x3A__flag|ptn:Stress__x3A__flag|ptn:Attract__x3A__flag">
        <xsl:comment>#107 todo implement n/[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    
    
    
    
</xsl:stylesheet>