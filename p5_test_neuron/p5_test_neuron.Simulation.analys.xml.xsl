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
   
   
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Config[ptn:Simulation[ptn:Simulator_tick]][ptn:Inputs][ptn:Defaults[ptn:Attract_min]]">
        <xsl:message>#13 todo ptn:Config</xsl:message>
        <ptn:Simulation_body
            xsi:schemaLocation="p5_test_neuron file:{$ptn:xsd}"
            >
            <xsl:copy-of select="descendant-or-self::*/namespace::*"></xsl:copy-of>
            <xsl:copy-of select="ancestor-or-self::*/namespace::*"></xsl:copy-of>
            <xsl:attribute name="ptn:Simulation_body_tick" select="1"/>
            <xsl:attribute name="ptn:Simulation_body_time" select="ptn:Simulation/ptn:Simulator_tick"/>
            <xsl:attribute name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick"/>
            <!--<xsl:apply-templates mode="#current" select="@*"/>-->
            <xsl:variable name="ptn:Inputs">
                <xsl:apply-templates mode="#current" select="ptn:Inputs/*">
                    <xsl:with-param name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                </xsl:apply-templates>
            </xsl:variable>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulator_tick" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Inputs" select="$ptn:Inputs" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body_time" select="ptn:Simulation/ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Attract_min" tunnel="yes" select="ptn:Defaults/ptn:Attract_min"/>
            </xsl:apply-templates>
            <ptn:Nodes>
                
            </ptn:Nodes>
        </ptn:Simulation_body>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Simulation_body[@ptn:Simulator_tick][@ptn:Simulation_body_time]">
        <xsl:message>#14 todo ptn:Config</xsl:message>
        <xsl:copy>
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
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Receptors|ptn:Receptor|ptn:Leaky_neuron_standard|ptn:Leaky_neuron_inhibitor|ptn:Leaky_neuron_inhibitor__x3A__AB|ptn:Leaky_neuron_inhibitor__X3A__AA">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Outputs" select="ptn:Outputs" tunnel="yes"/>
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
            </xsl:copy>
        </xsl:result-document>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Input[ptn:Input_exec_time][ptn:Input_exec_receptor][ptn:Input_exec_Time_constant][ptn:Input_exec_Maximum_current][not(parent::ptn:Current_synapse__x3A__emmit)]">
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:choose>
            <xsl:when test="number(ptn:Input_exec_Time_constant) &lt;= number($ptn:Simulator_tick)">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
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
                            </ptn:Input>
                        </xsl:when>
                        <xsl:otherwise>
                            <ptn:Input ptn:debug="#106 optimized input {.} to {ceiling($ptn:Input//ptn:Input_exec_Time_constant)} for $ptn:Simulator_tick={$ptn:Simulator_tick}">
                                <ptn:Input_exec_time><xsl:value-of select="$ptn:Input//ptn:Input_exec_time + ( . - 1) * $ptn:Simulator_tick"/></ptn:Input_exec_time>
                                <xsl:copy-of select="$ptn:Input//ptn:Input_exec_receptor"/>
                                <ptn:Input_exec_Time_constant><xsl:value-of select="$ptn:Simulator_tick"/></ptn:Input_exec_Time_constant>
                                <xsl:copy-of select="$ptn:Input//ptn:Input_exec_Maximum_current"/>
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
                            </ptn:Input>
                        </xsl:when>
                        <xsl:otherwise>
                            <ptn:Input ptn:debug="#106CC optimized input {.} to {ceiling($ptn:Current_synapse//ptn:Time_constant)} for $ptn:Simulator_tick={$ptn:Simulator_tick}  [+[ptn:Delay[{$ptn:Current_synapse/ptn:Delay}]]]">
                                <ptn:Input_exec_time><xsl:value-of select="($ptn:Input_time__x3A__attract + ( . - 1) * $ptn:Simulator_tick) + number($ptn:Current_synapse/ptn:Delay)"/></ptn:Input_exec_time>
                                <!--<xsl:copy-of select="$ptn:Current_synapse//ptn:Input_exec_receptor"/>-->
                                <ptn:Input_exec_receptor><xsl:value-of select="$ptn:Current_synapse/ptn:Output_Node"/></ptn:Input_exec_receptor>
                                <ptn:Input_exec_Time_constant><xsl:value-of select="$ptn:Simulator_tick"/></ptn:Input_exec_Time_constant>
                                <ptn:Input_exec_Maximum_current><xsl:value-of select="$ptn:Current_synapse//ptn:Maximum_current"/></ptn:Input_exec_Maximum_current>
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
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__divide_input" match="ptn:Input_exec_time|ptn:Input_exec_receptor|ptn:Input_exec_Maximum_current"/>
    
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
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Output__x3A__flag__x3A__emmit|ptn:Current_synapse__x3A__emmit">
        <xsl:comment >#241A todo <xsl:value-of select="name()"/></xsl:comment>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
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
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="*">
        <xsl:message terminate="yes">#15 todo <xsl:value-of select="name()"/></xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Nodes">
        <xsl:copy>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.analys.xml" match="ptn:Output__x3A__flag|ptn:Stress__x3A__flag|ptn:Attract__x3A__flag">
        <xsl:comment>#107 todo implement n/[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    
</xsl:stylesheet>