<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
    exclude-result-prefixes="xs math"
    xmlns:x3d="http://www.web3d.org/specifications/x3d-3.0.xsd"
    version="2.0">
    
    <xsl:output indent="yes" method="xml" /><!-- doctype-public="ISO//Web3D//DTD X3D 3.0//EN" doctype-system="http://www.web3d.org/specifications/x3d-3.0.dtd" -->
    <xsl:strip-space elements="*"/>
    
    <xsl:include href="p5_test_neuron.Simulation.analyze_simulation.x3d.generate__x3A__pattern.scene__x3A__LineSet__CoordinateInterpolator.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.analyze_simulation.x3d.generate__x3A__pattern__x3A__apply.xsl"/>
    
    <!-- for base analys  -->
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Input__x3A__generate.xml">
        <ptn:Input__x3A__generate__x3A__pattern.xml>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulation_body_tick" select="@ptn:Simulation_body_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_body_time" select="@ptn:Simulation_body_time" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulator_tick" select="@ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_ticks" select="@ptn:Simulation_ticks" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_ticks__x3A__real" select="number(@ptn:Simulation_ticks) + 1" tunnel="yes"/>
                <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
            </xsl:apply-templates>
        </ptn:Input__x3A__generate__x3A__pattern.xml>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="*">
        <xsl:message terminate="yes">## 32A [unantended/n][<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Defaults|ptn:Receptors|ptn:Receptor|ptn:Simulation|ptn:Simulator_tick|ptn:Simulation_ticks">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Firing_threshold|ptn:Adaptation_conductance|ptn:Adaptation_time_constant|ptn:Refactory_period|ptn:Maximum_current">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates mode="#current"/>
            </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Time_constant|ptn:Delay|ptn:Attract_min|ptn:Reset_potential|ptn:Label|ptn:Is_inhibitor">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Outputs|ptn:Input__x3A__nodes|ptn:Simulated_potential|ptn:Receptor_regex_filter">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Inputs|ptn:Input|ptn:Input_exec_time|ptn:Input_exec_receptor|ptn:Input_exec_Time_constant|ptn:Input_exec_Maximum_current">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Input__x3A__generate__x3A__pattern[@ptn:Input__x3A__generate__x3A__sequences]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Input__x3A__generate__x3A__sequences" select="@ptn:Input__x3A__generate__x3A__sequences" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Group__x3A__generate__x3A__pattern_Group">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Input__x3A__generate__x3A__Shape">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Input__x3A__generate__x3A__pattern_Group">
        <!--<xsl:param name="ptn:Simulation_ticks" required="yes" tunnel="yes"/>-->
        <xsl:param name="ptn:Simulation_ticks__x3A__real" required="yes" tunnel="yes"/>
        <xsl:variable name="ptn:Input__x3A__generate__x3A__pattern_Group" select="."/>
            
        
        <!--<xsl:param name="ptn:Simulator_tick__x3A__for-each-group">
            <xsl:call-template name="ptn:Input__x3A__generate__x3A__pattern__x3A__Simulation.analys.xml__x3A__analyze"/>
        </xsl:param>-->
        <xsl:call-template name="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:debug">#123 here todo  1 to $ptn:Simulation_ticks__x3A__real[<xsl:value-of select="$ptn:Simulation_ticks__x3A__real"/>] </xsl:attribute>
            <!--<xsl:apply-templates mode="#current">
                <!-\-<xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group" select="$ptn:Simulator_tick__x3A__for-each-group" tunnel="yes"/>-\->
            </xsl:apply-templates>-->
            
            
                <xsl:for-each select=" 1 to xs:integer($ptn:Simulation_ticks__x3A__real)">
                    
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="last()"/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="last()"/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" select="."/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step" select="1 div last() * ."/>
                    
                    <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector" select="$ptn:Input__x3A__generate__x3A__pattern_Group">
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__context" select="." tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__step__x3A__percent" select="1 div last()" tunnel="yes"/>
                    </xsl:apply-templates>
                        
                    
                </xsl:for-each>
            
        </xsl:copy>
    </xsl:template>
    
    <!--<xsl:template name="ptn:Input__x3A__generate__x3A__pattern__x3A__Simulation.analys.xml__x3A__analyze">
        <xsl:param name="ptn:Input__x3A__generate__x3A__sequences" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation_body_time" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation_ticks" tunnel="yes" required="yes"/>
        <ptn:Input__x3A__generate__x3A__pattern__x3A__Simulation.analys.xml__x3A__analyze>
            <ptn:Simulation.analys.xml__x3A__analyze ptn:Simulation_body_time="1"
                    ptn:Simulation_body_tick="1"
                    ptn:Simulator_tick="1">
                    <ptn:Receptor__x3A__analyze ptn:Label__x3A__analyze="A"
                        ptn:Coordinate_X="0"
                        ptn:Coordinate_Y="0"
                        ptn:Coordinate_Z="0"
                        ptn:Is_inhibitor="0"
                        ptn:Outputs__x3A__count="0"
                        ptn:Simulated_potential="-64.48"/>
                    <ptn:Receptor__x3A__analyze ptn:Label__x3A__analyze="B"
                        ptn:Coordinate_X="10"
                        ptn:Coordinate_Y="0"
                        ptn:Coordinate_Z="0"
                        ptn:Is_inhibitor="0"
                        ptn:Outputs__x3A__count="0"
                        ptn:Simulated_potential="-70.98"/>
                </ptn:Simulation.analys.xml__x3A__analyze>
            <ptn:Simulation.analys.xml__x3A__analyze ptn:Simulation_body_time="2"
                ptn:Simulation_body_tick="2"
                ptn:Simulator_tick="1">
                <ptn:Receptor__x3A__analyze ptn:Label__x3A__analyze="A"
                    ptn:Coordinate_X="0"
                    ptn:Coordinate_Y="0"
                    ptn:Coordinate_Z="0"
                    ptn:Is_inhibitor="0"
                    ptn:Outputs__x3A__count="0"
                    ptn:Simulated_potential="-58.0904"
                    ptn:Attract__x3A__flag="true"/>
                <ptn:Receptor__x3A__analyze ptn:Label__x3A__analyze="B"
                    ptn:Coordinate_X="10"
                    ptn:Coordinate_Y="0"
                    ptn:Coordinate_Z="0"
                    ptn:Is_inhibitor="0"
                    ptn:Outputs__x3A__count="0"
                    ptn:Simulated_potential="-70.9604"/>
            </ptn:Simulation.analys.xml__x3A__analyze>
        </ptn:Input__x3A__generate__x3A__pattern__x3A__Simulation.analys.xml__x3A__analyze>
    </xsl:template>-->
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
        <xsl:param name="ptn:Input__x3A__generate__x3A__sequences" tunnel="yes" required="yes"/>
        <!--<xsl:param name="ptn:Simulator_tick__x3A__for-each-group" tunnel="yes" required="yes"/>-->
        <xsl:param name="ptn:Simulation_body_tick" required="yes" tunnel="yes"/>
        <!--<xsl:param name="current-group" select="$ptn:Simulator_tick__x3A__for-each-group/descendant-or-self::ptn:Simulation.analys.xml__x3A__analyze[@ptn:Simulation_body_tick = $ptn:Simulation_body_tick]"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            
            
            <!--<xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Interpolator">
                <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__type" select="'CoordinateInterpolator'" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" select="'Current_synapse.Input'" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" select="'Coordinate'" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" select="'point'" tunnel="yes"/>
            </xsl:call-template>-->
            
            <ptn:Input ptn:debug="ptn:Input__x3A__generate__x3A__pattern#125">
                <ptn:Input_exec_time>109</ptn:Input_exec_time>
                <ptn:Input_exec_receptor>I</ptn:Input_exec_receptor>
                <ptn:Input_exec_Time_constant>2</ptn:Input_exec_Time_constant>
                <ptn:Input_exec_Maximum_current>2.5</ptn:Input_exec_Maximum_current>
                <ptn:Coordinate__x3A__pattern__LineSet__x3A__vector>
                    <!--<current-group>
                        <xsl:copy-of select="$current-group"></xsl:copy-of>
                    </current-group>-->
                    <!--<ptn:Simulator_tick__x3A__for-each-group>
                        <xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:copy-of>
                    </ptn:Simulator_tick__x3A__for-each-group>-->
                    <!--<xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys">
                        <xsl:call-template name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys">
                            <xsl:with-param name="current-group" tunnel="yes"/>
                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group" tunnel="yes"/>
                            <xsl:with-param name="current" tunnel="yes" select="$current-group"/>
                        </xsl:call-template>    
                    </xsl:variable>-->
                    <!--<xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys"/>-->
                    <!--<xsl:call-template name="ptn:MFVec3f__x3A__section__x3A__sequence_debug">
                        <xsl:with-param name="ptn:Coordinate_X" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Y" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Y" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Z" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Z" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_X__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_X" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Y__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Y" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Z__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Z" tunnel="yes"/>
                        <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="count(following-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector) = 0"/>
                        <xsl:with-param name="ptn:MFVec3f__x3A__length" tunnel="yes">1</xsl:with-param>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="$ptn:Input__x3A__generate__x3A__sequences" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Input__x3A__generate__x3A__sequences" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" select="1" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" tunnel="yes" select="$ptn:Input__x3A__generate__x3A__sequences"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" select="true()" tunnel="yes"/> 
                    </xsl:call-template>-->    
                </ptn:Coordinate__x3A__pattern__LineSet__x3A__vector>   
                <xsl:apply-templates mode="#current"/>
            </ptn:Input>
            
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern" match="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector"/>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector" match="ptn:Input__x3A__generate__x3A__pattern_Group">
        <xsl:apply-templates mode="#current">
            <xsl:with-param name="ptn:Input__x3A__generate__x3A__pattern_Group" select="." tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    
    <xsl:template name="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray">
        <xsl:param name="ptn:Receptors" required="yes" tunnel="yes"/>
        
            <xsl:for-each select="$ptn:Receptors/descendant-or-self::ptn:Receptor[@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray][@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray][@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray]">
                <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView" select="ptn:Coordinate_X"/>
                <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView" select="ptn:Coordinate_Y"/>
                <xsl:variable name="ptn:Coordinate_Z__x3A__fieldOfView" select="ptn:Coordinate_Z"/>
                <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less">
                    <xsl:for-each select="$ptn:Receptors/descendant-or-self::ptn:Receptor[number(@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray) &lt; current()/number(@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray)]">
                        <xsl:sort select="@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray"/>    
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__more">
                    <xsl:for-each select="$ptn:Receptors/descendant-or-self::ptn:Receptor[number(@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray) &gt; current()/number(@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray)]">
                        <xsl:sort select="@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray"/>    
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context" select="@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray"/>   
                <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less">
                    <xsl:for-each select="$ptn:Receptors/descendant-or-self::ptn:Receptor[number(@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray) &lt; current()/number(@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray)]">
                        <xsl:sort select="@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray"/>    
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context" select="@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray"/>
                <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__more">
                    <xsl:for-each select="$ptn:Receptors/descendant-or-self::ptn:Receptor[number(@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray) &gt; current()/number(@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray)]">
                        <xsl:sort select="@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray"/>    
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context" select="@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray"/>
                
                <ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray>
                        <IndexedFaceSet coordIndex="0 1 2   -1 1 3    2 -1 2    3 0 -1     3 1 0" ptn:Label__x3A__fieldOfView__x3A__ray="{ptn:Label}"
                            ptn:Coordinate_X__x3A__fieldOfView="{$ptn:Coordinate_X__x3A__fieldOfView}"
                            ptn:Coordinate_Y__x3A__fieldOfView="{$ptn:Coordinate_Y__x3A__fieldOfView}"
                            ptn:Coordinate_Z__x3A__fieldOfView="{$ptn:Coordinate_Z__x3A__fieldOfView}"
                            ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context}"
                            ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context}"
                            ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context="{$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}"
                            ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less}"
                            ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__more="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__more}"
                            ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less}"
                            ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__more="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__more}"
                            >
                        </IndexedFaceSet>
                </ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray>        
            </xsl:for-each>
        
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector" match="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector[@ptn:MFVec3f__x3A__distance__x3A__percent]">
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Receptors" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_Group" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__context" tunnel="yes" required="yes"/>
        <!--<xsl:variable name="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector" select="."/>-->
        <xsl:choose>
            <xsl:when test="preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector/number(@ptn:MFVec3f__x3A__distance__x3A__percent) &gt;= number($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step)">
                <!--<xsl:comment>#333A number(@ptn:MFVec3f__x3A__distance__x3A__percent)[<xsl:value-of select="number(@ptn:MFVec3f__x3A__distance__x3A__percent)"/>]  gt? $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step[<xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step"/>]</xsl:comment>-->
            </xsl:when>
            <xsl:when test="number(@ptn:MFVec3f__x3A__distance__x3A__percent) &gt;= number($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step)">
                <xsl:comment>
                    #333B number(@ptn:MFVec3f__x3A__distance__x3A__percent)[<xsl:value-of select="number(@ptn:MFVec3f__x3A__distance__x3A__percent)"/>]  $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step[<xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step"/>] gt? $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step[<xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step"/>]
                    #C[$ptn:Input__x3A__generate__x3A__pattern_Group[<xsl:value-of select="count($ptn:Input__x3A__generate__x3A__pattern_Group)"/>]]
                    #C2[<xsl:value-of select="count($ptn:Input__x3A__generate__x3A__pattern_Group/descendant-or-self::ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector)"/>]
                    #C2[Ticks[<xsl:copy-of select="$ptn:Input__x3A__generate__x3A__pattern_Group/descendant-or-self::ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector/@ptn:MFVec3f__x3A__distance__x3A__percent"/>]]
                </xsl:comment>
                <xsl:copy-of select="."/>                
                <!--<xsl:call-template name="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray"/>-->
                <xsl:variable name="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector__x3A__context" select="."/>
                <xsl:for-each select="$ptn:Input__x3A__generate__x3A__pattern_Group/descendant-or-self::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
                    <xsl:copy>
                        <xsl:copy-of select="@DEF"/>
                        
                        <xsl:attribute name="ptn:debug"><xsl:copy-of select="@ptn:debug"/> ; [@perc[<xsl:copy-of select="$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector__x3A__context/@ptn:MFVec3f__x3A__distance__x3A__percent"/>]] #344 context for ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector</xsl:attribute>
                        <xsl:attribute name="ptn:Simulator_tick__x3A__context" select="$ptn:Simulator_tick__x3A__context"/>
                        <xsl:attribute name="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector__x3A__position" select="count($ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector__x3A__context/*)"/>
                        <xsl:attribute name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step"/>
                        <ptn:keyValue__generate__basepoint__x3A__calculations ptn:Coordinate_X="{ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X}" ptn:Coordinate_Y="{ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Y}" ptn:Coordinate_Z="{ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Z}"
                            ptn:Coordinate_X__x3A__remote="{ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_X}" ptn:Coordinate_Y__x3A__remote="{ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Y}" ptn:Coordinate_Z__x3A__remote="{ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Z}"
                            
                            ptn:Coordinate_X__x3A__vector="{$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector__x3A__context/@ptn:Coordinate_X__x3A__vector}"
                            ptn:Coordinate_Y__x3A__vector="{$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector__x3A__context/@ptn:Coordinate_Y__x3A__vector}"
                            ptn:Coordinate_Z__x3A__vector="{$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector__x3A__context/@ptn:Coordinate_Z__x3A__vector}"
                            ptn:MFVec3f__x3A__distance__x3A__percent="{$ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector__x3A__context/@ptn:MFVec3f__x3A__distance__x3A__percent}"
                            >
                            <xsl:variable name="x" select="- ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X + ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_X"/>
                            <xsl:variable name="y" select="- ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Y + ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Y"/>
                            <xsl:variable name="z" select="- ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Z + ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Z"/>
                            <xsl:variable name="xt" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X - $x"/>
                            <xsl:variable name="yt" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Y - $y"/>
                            <xsl:variable name="zt" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Z - $z"/>
                            <xsl:attribute name="xt" select="$xt"/>
                            <xsl:attribute name="yt" select="$yt"/>
                            <xsl:attribute name="zt" select="$zt"/>
                            
                            <Coordinate ptn:debug="#342 todo">
                                    <xsl:attribute name="point">
                                        <xsl:call-template name="ptn:MFVec3f__x3A__sequence">
                                            <xsl:with-param name="ptn:Coordinate_X"  select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X" tunnel="yes"/>
                                            <xsl:with-param name="ptn:Coordinate_Y" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Y" tunnel="yes"/>
                                            <xsl:with-param name="ptn:Coordinate_Z" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Z" tunnel="yes"/>
                                            <xsl:with-param name="ptn:Coordinate_X__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_X" tunnel="yes"/>
                                            <xsl:with-param name="ptn:Coordinate_Y__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Y" tunnel="yes"/>
                                            <xsl:with-param name="ptn:Coordinate_Z__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Z" tunnel="yes"/>
                                            <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="true()"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                <xsl:text> </xsl:text>
                            </Coordinate>
                            <xsl:text> </xsl:text>
                        </ptn:keyValue__generate__basepoint__x3A__calculations>
                    </xsl:copy>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
        
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector|ptn:Input__x3A__generate__x3A__pattern__Receptor__emmit__Interpolator__x3A__vector|ptn:Input__x3A__generate__x3A__pattern__x3A__Appearance"/>
        
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector" match="*">
        <xsl:message terminate="yes">#252  [PATT]  unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    
    <!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="Shape[parent::Shape]">
        <xsl:comment>#373AA TODO Shape[parent::Shape] PATTERN</xsl:comment>
            <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="Shape[not(parent::Shape)]">
        <xsl:comment>#373AB TODO PATTERN</xsl:comment>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="LineSet[Coordinate]">
        <xsl:comment>#373AAB TODO Shape[parent::Shape] PATTERN</xsl:comment>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:text> </xsl:text>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="IndexedFaceSet">
        <xsl:comment>#373D TODO PATTERN[ERROR] [n][<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="IndexedFaceSet[Coordinate]">
        <xsl:comment>#373AABB TODO Shape[parent::Shape] PATTERN</xsl:comment>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:text> </xsl:text>
        </xsl:copy>
        
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="IndexedFaceSet[not(Coordinate)][@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less[not(.='')]][@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less[not(.='')]][@ptn:Coordinate_X__x3A__fieldOfView][@ptn:Coordinate_Y__x3A__fieldOfView][@ptn:Coordinate_Z__x3A__fieldOfView][@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context][@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context][@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context]">
        <xsl:comment>#373ACC TODO PATTERN [n][<xsl:value-of select="name()"/>]</xsl:comment>
        <Shape>
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <Coordinate point=" {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context} 
                    {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context} 
                    {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}
                    {@ptn:Coordinate_X__x3A__fieldOfView} {@ptn:Coordinate_Y__x3A__fieldOfView} {@ptn:Coordinate_Z__x3A__fieldOfView}"><xsl:text> </xsl:text></Coordinate>
                <xsl:text> </xsl:text>
            </xsl:copy>
            <xsl:choose>
                <xsl:when test="Appearance"/>
                <xsl:otherwise>
                    <Appearance>
                        <Material  transparency='.9'>
                            <xsl:attribute name="diffuseColor">
                                <xsl:call-template name="ptn:MFColor__x3A__sequence">
                                    <xsl:with-param name="ptn:MFColor__x3A__R">0.9</xsl:with-param>
                                    <xsl:with-param name="ptn:MFColor__x3A__G">0.9</xsl:with-param>
                                    <xsl:with-param name="ptn:MFColor__x3A__B">0.3</xsl:with-param>
                                    <xsl:with-param name="ptn:MFColor__x3A__sequence__x3A__last" select="true()"/>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:text> </xsl:text>
                        </Material>
                    </Appearance> 
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text> </xsl:text>
        </Shape>
        <Shape>
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <Coordinate point=" {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context} 
                    {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context} 
                    {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}
                    {@ptn:Coordinate_X__x3A__fieldOfView} {@ptn:Coordinate_Y__x3A__fieldOfView} {@ptn:Coordinate_Z__x3A__fieldOfView}"><xsl:text> </xsl:text></Coordinate>
                <xsl:text> </xsl:text>
            </xsl:copy>
            <xsl:choose>
                <xsl:when test="Appearance"/>
                <xsl:otherwise>
                    <Appearance>
                        <Material  transparency='.5'>
                            <xsl:attribute name="diffuseColor">
                                <xsl:call-template name="ptn:MFColor__x3A__sequence">
                                    <xsl:with-param name="ptn:MFColor__x3A__R">0.9</xsl:with-param>
                                    <xsl:with-param name="ptn:MFColor__x3A__G">0.9</xsl:with-param>
                                    <xsl:with-param name="ptn:MFColor__x3A__B">0.3</xsl:with-param>
                                    <xsl:with-param name="ptn:MFColor__x3A__sequence__x3A__last" select="true()"/>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:text> </xsl:text>
                        </Material>
                    </Appearance> 
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text> </xsl:text>
        </Shape>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="IndexedFaceSet[parent::Shape][not(Coordinate)][@ptn:Coordinate_X][@ptn:Coordinate_Y][@ptn:Coordinate_Z][@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less[not(.='')]][@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less[not(.='')]][@ptn:Coordinate_X__x3A__fieldOfView][@ptn:Coordinate_Y__x3A__fieldOfView][@ptn:Coordinate_Z__x3A__fieldOfView][@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context][@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context][@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context]">
        <xsl:comment>#373A TODO PATTERN [n][<xsl:value-of select="name()"/>]</xsl:comment>
            <Shape>
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <Coordinate point="{@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}  
                        {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}
                        {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}
                        {@ptn:Coordinate_X} {@ptn:Coordinate_Y} {@ptn:Coordinate_Z}"  ><xsl:text> </xsl:text></Coordinate><!-- {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context} -->
                    <xsl:text> </xsl:text>
                </xsl:copy>
            <xsl:text> </xsl:text>
            </Shape>
            <Shape>
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <Coordinate point="{@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}  
                        {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}
                        {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}
                        {@ptn:Coordinate_X} {@ptn:Coordinate_Y} {@ptn:Coordinate_Z}"  ><xsl:text> </xsl:text></Coordinate><!-- {@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less} {@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context} {@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context} -->
                    <xsl:text> </xsl:text>
                </xsl:copy>
                <xsl:text> </xsl:text>
            </Shape>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="LineSet[not(Coordinate)][@ptn:Coordinate_X][@ptn:Coordinate_Y][@ptn:Coordinate_Z][@ptn:Coordinate_X__x3A__remote][@ptn:Coordinate_Y__x3A__remote][@ptn:Coordinate_Z__x3A__remote]">
        <xsl:comment>#373A TODO PATTERN</xsl:comment>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <Coordinate point="{@ptn:Coordinate_X} {@ptn:Coordinate_Y} {@ptn:Coordinate_Z} {@ptn:Coordinate_X__x3A__remote} {@ptn:Coordinate_Y__x3A__remote} {@ptn:Coordinate_Z__x3A__remote}"><xsl:text> </xsl:text></Coordinate>
            <xsl:text> </xsl:text>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray">
        <xsl:comment>#373V TODO PATTERN</xsl:comment>
            <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="Coordinate">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    <!--  --><!--  --><!--  --><!--  --><!--  -->
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="*">
        <xsl:message terminate="yes">#77 [ptn:Input__x3A__generate__x3A__pattern__X3A__scene]  unantended[n][<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Simulation.analys.xml__x3A__analyze"/>
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:message>#81 DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/></xsl:message>
        <xsl:comment>#81 DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/></xsl:comment>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="Group">
        <xsl:message>#81A DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/>]  [@][<xsl:copy-of select="@*/name()"/>]</xsl:message>
        <xsl:comment>#81A DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/>]  [@][<xsl:copy-of select="@*/name()"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Group__x3A__generate__x3A__pattern_Group[@ptn:Simulation__x3A__DEF__x3A__elements__x3A__group]">
        <xsl:comment>#81-37 DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/></xsl:comment>
        <Group>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" select="@ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes"/>
            </xsl:apply-templates>
            <xsl:text> </xsl:text>
        </Group>        
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__Shape">
        <xsl:comment>#442 [ptn:Input__x3A__generate__x3A__pattern__X3A__scene]  [TODO][n][<xsl:value-of select="name()"/>]</xsl:comment>
       <!-- <Shape>
            <xsl:copy-of select="@*"/>-->
            <xsl:apply-templates mode="#current"/>
            <!--<xsl:text> </xsl:text>-->
        <!--</Shape>-->        
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern_Group">
        <xsl:comment>#470 TODO [patt]  [n][<xsl:value-of select="name()"/></xsl:comment>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern_Group[ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector]">
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes" required="yes"/>
        
        <xsl:comment>#544 [generate ][TOOODO] [n][<xsl:value-of select="name()"/>]  [ptn:debug=[<xsl:copy-of select="@ptn:debug"></xsl:copy-of>]]  [DEB]#C[@DEF[<xsl:value-of select="count(ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF])"/>]]</xsl:comment>
        
        <xsl:for-each-group select="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" group-by="@DEF">
            <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator" select="."/>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" group-by="@DEF">
            <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__Shape" select="."/>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" group-by="@DEF">
            <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__ROUTE" select="."/>
        </xsl:for-each-group>
        
        <!--<LineSet  ><!-\- vertexCount="{count(ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector) + 1}" -\->
            <Coordinate DEF="A__{$ptn:Simulation__x3A__DEF__x3A__elements__x3A__group}_LineSet">
                <xsl:attribute name="point">
                    <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__Lineset"/>
                </xsl:attribute>
                <xsl:text> </xsl:text>
            </Coordinate>
            <xsl:text> </xsl:text>
        </LineSet>-->
        <!--<Transform 
            translation="{ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[1]/ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X} {ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[1]/ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Y} {ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[1]/ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Z}"
            rotation="{ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[1]/ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_X} {ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[1]/ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Y} {ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[1]/ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Z} 0">
            <Shape>
                <Cylinder height="8" radius=".02"></Cylinder>
                <Appearance USE="DARK_GRAY"></Appearance>
            </Shape>
        </Transform>-->
        
            <xsl:text> </xsl:text>                
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
        <xsl:comment>#604 [SCENE][BYPASSED??] [n][<xsl:value-of select="name()"/>]</xsl:comment>
        <!--<xsl:apply-templates mode="#current"/>-->
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern__x3A__Appearance">
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes" required="yes"/>
        <Appearance>
            <xsl:apply-templates mode="#current"/>
            <xsl:text> </xsl:text>
        </Appearance>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern__x3A__Material">
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes" required="yes"/>
        <Material>
            <xsl:attribute name="DEF">
                <xsl:call-template name="ptn:Simulation__x3A__DEF_target">
                    <xsl:with-param name="ptn:Label__x3A__analyze" select="$ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" select="'emissiveColor'" tunnel="yes"/>
                    <xsl:with-param name="ptn:Output_Node__x3A__analyze" tunnel="yes">Material</xsl:with-param>
                    <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" tunnel="yes">set_emissiveColor</xsl:with-param>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="emissiveColor">
                <xsl:call-template name="ptn:MFColor__x3A__sequence">
                    <xsl:with-param name="ptn:MFColor__x3A__R"  select="1"/>
                    <xsl:with-param name="ptn:MFColor__x3A__G"  select="1"/>
                    <xsl:with-param name="ptn:MFColor__x3A__B"  select="0"/>
                    <xsl:with-param name="ptn:MFColor__x3A__sequence__x3A__last" select="true()"/>
                </xsl:call-template>
            </xsl:attribute><xsl:text> </xsl:text>
        </Material>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern__x3A__LineProperties">
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes" required="yes"/>
        <LineProperties>
            <xsl:copy-of select="@*"/>
            <xsl:text> </xsl:text>
        </LineProperties>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern__Receptor__emmit__Interpolator__x3A__vector">
        <xsl:comment>#85 [pattern generate]  unantended[n][<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector[@ptn:Coordinate_X__x3A__vector][@ptn:Coordinate_Y__x3A__vector][@ptn:Coordinate_Z__x3A__vector]">
        <xsl:comment>#85 [pattern generate]  unantended[n][<xsl:value-of select="name()"/>]</xsl:comment>
        <xsl:apply-templates mode="#current">
            <xsl:with-param name="ptn:Coordinate_X__x3A__vector" select="@ptn:Coordinate_X__x3A__vector" tunnel="yes"/>
            <xsl:with-param name="ptn:Coordinate_Y__x3A__vector" select="@ptn:Coordinate_Y__x3A__vector" tunnel="yes"/>
            <xsl:with-param name="ptn:Coordinate_Z__x3A__vector" select="@ptn:Coordinate_Z__x3A__vector" tunnel="yes"/>
            
        </xsl:apply-templates>
   </xsl:template>
    
    
    <!--<xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="Group|Shape|LineSet|Coordinate|Appearance|Material|LineProperties|CoordinateInterpolator|ROUTE">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:text> </xsl:text>
        </xsl:copy>        
    </xsl:template>-->
    
    
</xsl:stylesheet>