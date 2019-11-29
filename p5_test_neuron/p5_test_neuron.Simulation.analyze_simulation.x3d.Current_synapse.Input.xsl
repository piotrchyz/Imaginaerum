<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes" method="xml" /><!-- doctype-public="ISO//Web3D//DTD X3D 3.0//EN" doctype-system="http://www.web3d.org/specifications/x3d-3.0.dtd" -->
    <xsl:strip-space elements="*"/>
    
    <!-- ptn:Simulation.analys.xml__x3A__analyze FROM  ptn:Simulation_body__x3A__analyze -->
    
    <xsl:template  mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Route ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Shape ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Interpolator"
        match="ptn:Simulation.analyze_simulation.xml">
        <xsl:param name="ptn:Simulation.analyze_simulation.xml" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation__x3A__TimeSensor" tunnel="yes" required="yes"/>
        <xsl:choose>
            <xsl:when test="ptn:Simulation.analys.xml__x3A__analyze"/>
            <xsl:otherwise><xsl:message terminate="yes">#20 [MISSING][ptn:Simulation.analys.xml__x3A__analyze]   [UNANTENDED][<xsl:value-of select="name()"/>]</xsl:message></xsl:otherwise>
        </xsl:choose>
        <xsl:for-each-group select="descendant-or-self::*[@ptn:Label__x3A__analyze]" group-by="@ptn:Label__x3A__analyze">
                <xsl:comment>#18GG Current_synapse.Input.Shape [CGK[<xsl:value-of select="current-grouping-key()"/>]]</xsl:comment>
                <xsl:variable name="ptn:Label__x3A__analyze" select="@ptn:Label__x3A__analyze"/>
                <xsl:variable name="ptn:Coordinate_X"  select="current-group()[@ptn:Coordinate_X][1]/@ptn:Coordinate_X"/>
                <xsl:variable name="ptn:Coordinate_Y" select="current-group()[@ptn:Coordinate_Y][1]/@ptn:Coordinate_Y" />
                <xsl:variable name="ptn:Coordinate_Z"  select="current-group()[@ptn:Coordinate_Z][1]/@ptn:Coordinate_Z"/>
                <xsl:for-each-group select="current-group()/ptn:Output__x3A__flag__x3A__emmit__x3A__analyze/ptn:Current_synapse__x3A__emmit__x3A__analyze/ptn:Input__x3A__analyze" group-by="concat(@ptn:Input_exec_receptor__x3A__analyze,'-',@ptn:Input_exec_time__x3A__initial__x3A__analyze)">
                    <xsl:variable name="ptn:Input_exec_receptor__x3A__analyze" select="@ptn:Input_exec_receptor__x3A__analyze"/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active">
                        <xsl:call-template name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active">
                            <xsl:with-param name="current-group" select="current-group()" tunnel="yes"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" >
                        <xsl:call-template name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all">
                            <xsl:with-param name="current-group" select="current-group()" tunnel="yes"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:apply-templates mode="#current" select=".">
                        <xsl:with-param name="ptn:Label__x3A__analyze" select="$ptn:Label__x3A__analyze" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_X" select="$ptn:Coordinate_X" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Y" select="$ptn:Coordinate_Y" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Z" select="$ptn:Coordinate_Z" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_X__x3A__remote"  select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Input_exec_receptor__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_X" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Y__x3A__remote" select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Input_exec_receptor__x3A__analyze][@ptn:Coordinate_Y][@ptn:Coordinate_Y][1]/@ptn:Coordinate_Y" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Z__x3A__remote" select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Input_exec_receptor__x3A__analyze][@ptn:Coordinate_Z][@ptn:Coordinate_Z][1]/@ptn:Coordinate_Z" tunnel="yes"/>
                        
                        <xsl:with-param name="ptn:Input_exec_receptor__x3A__analyze" select="$ptn:Input_exec_receptor__x3A__analyze" tunnel="yes"/>
                        <xsl:with-param name="ptn:Input_exec_time__x3A__analyze" select="@ptn:Input_exec_time__x3A__analyze" tunnel="yes"/>
                        <xsl:with-param name="ptn:Input_exec_time__x3A__initial__x3A__analyze" select="@ptn:Input_exec_time__x3A__initial__x3A__analyze" tunnel="yes"/>
                        <xsl:with-param name="current-group" select="current-group()" tunnel="yes"/>
                        <xsl:with-param name="ptn:Output_Node__x3A__analyze" select="@ptn:Input_exec_receptor__x3A__analyze" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" tunnel="yes"/>
                        <xsl:with-param name="ptn:Input_exec_Maximum_current__x3A__analyze" select="@ptn:Input_exec_Maximum_current__x3A__analyze" tunnel="yes"/>
                        <!--<xsl:with-param name="ptn:Simulation__x3A__TimeSensor" tunnel="yes" select="$ptn:Simulation__x3A__TimeSensor"/>-->
                    </xsl:apply-templates>
                </xsl:for-each-group>
            </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Shape"  >
        <Group>
            <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Shape" select="."/>
        </Group>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Shape" match="*">
        <xsl:message terminate="yes">#36 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Shape" match="ptn:Input__x3A__analyze">
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Label__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input_exec_receptor__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input_exec_time__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input_exec_time__x3A__initial__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation__x3A__linewidthScaleFactor" select="20"/>
        <!-- <ptn:Simulator_tick__x3A__for-each-group name="ptn:Simulation.analyze_simulation.xml">
               <ptn:Simulation_body__x3A__analyze ptn:Simulation_body_time="1"
                                                  ptn:Simulation_body_tick="1"
                                                  ptn:Simulator_tick="1"/>
               <ptn:Simulation_body__x3A__analyze ptn:Simulation_body_time="2" -->
        <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input__x3A__validate"/>
        
        <Shape>
            <LineSet vertexCount='2'>
                <Coordinate DEF="{$ptn:Label__x3A__analyze}_to_{$ptn:Input_exec_receptor__x3A__analyze}_{$ptn:Input_exec_time__x3A__analyze}_Current_synapse_Input_LineSet"  ><!-- point='5 0 0 1 5 0' -->
                    <xsl:attribute name="DEF">
                        <xsl:call-template name="ptn:Simulation__x3A__DEF_target"/>
                    </xsl:attribute>
                    <xsl:attribute name="point">
                        <xsl:call-template name="ptn:MFVec3f__x3A__sequence">
                            <xsl:with-param name="ptn:MFVec3f__x3A__distance" select="0"/>
                            <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="true()"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:text> </xsl:text></Coordinate>
            </LineSet>
            <Appearance>
                <Material >
                    <xsl:attribute name="emissiveColor">
                        <xsl:call-template name="ptn:MFColor__x3A__sequence">
                            <xsl:with-param name="ptn:MFColor__x3A__R">1</xsl:with-param>
                            <xsl:with-param name="ptn:MFColor__x3A__G">1</xsl:with-param>
                            <xsl:with-param name="ptn:MFColor__x3A__B">0.5</xsl:with-param>
                            <xsl:with-param name="ptn:MFColor__x3A__sequence__x3A__last" select=" true()"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:attribute name="DEF">
                        <xsl:call-template name="ptn:Simulation__x3A__DEF_target">
                            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" tunnel="yes">emissiveColor</xsl:with-param>
                            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" tunnel="yes">Material</xsl:with-param>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:text> </xsl:text></Material>
                <LineProperties linewidthScaleFactor='{$ptn:Simulation__x3A__linewidthScaleFactor}'><xsl:text> </xsl:text></LineProperties>
            </Appearance>
        </Shape>
        
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input__x3A__validate">
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input_exec_receptor__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input_exec_time__x3A__initial__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:message>#134 [validate][ptn:Input_exec_receptor__x3A__analyze][<xsl:value-of select="$ptn:Input_exec_receptor__x3A__analyze"/>]</xsl:message>
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__local"/>
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__remote">
            <xsl:with-param name="ptn:Coordinate_X__x3A__remote" select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Input_exec_receptor__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_X" tunnel="yes"/>
            <xsl:with-param name="ptn:Coordinate_Y__x3A__remote" select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Input_exec_receptor__x3A__analyze][@ptn:Coordinate_Y][@ptn:Coordinate_Y][1]/@ptn:Coordinate_Y" tunnel="yes"/>
            <xsl:with-param name="ptn:Coordinate_Z__x3A__remote" select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Input_exec_receptor__x3A__analyze][@ptn:Coordinate_Z][@ptn:Coordinate_Z][1]/@ptn:Coordinate_Z" tunnel="yes"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Interpolator">
        <xsl:comment>#18-107II Current_synapse.Input.Interpolator [CGK[<xsl:value-of select="current-grouping-key()"/>]]   /n[<xsl:value-of select="name()"/>]</xsl:comment>
        <Group>
            <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Interpolator" select="."/>
        </Group>
    </xsl:template>
    
    <xsl:template name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys">
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" tunnel="yes" required="yes"/>
        <xsl:param name="current-group" tunnel="yes" required="yes"/>
        
        <ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>
            <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!--ptn:Simulation_body__x3A__analyze-->
                <xsl:choose>        
                    <xsl:when test="$current-group/ancestor-or-self::ptn:Simulation.analys.xml__x3A__analyze[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]">
                        <ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                            <xsl:value-of select="position()"/>
                        </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                    </xsl:when>
                    <xsl:otherwise>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Interpolator" match="ptn:Input__x3A__analyze">
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Label__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input_exec_receptor__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input_exec_time__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input_exec_time__x3A__initial__x3A__analyze" required="yes" tunnel="yes"/>
        <xsl:param name="current-group" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation__x3A__Interpolator__x3A__type" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Input_exec_Maximum_current__x3A__analyze" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__remote" required="yes" tunnel="yes"/>
        <!-- <ptn:Simulator_tick__x3A__for-each-group name="ptn:Simulation.analyze_simulation.xml">
               <ptn:Simulation_body__x3A__analyze ptn:Simulation_body_time="1"
                                                  ptn:Simulation_body_tick="1"
                                                  ptn:Simulator_tick="1"/>
               <ptn:Simulation_body__x3A__analyze ptn:Simulation_body_time="2" -->
        <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input__x3A__validate"/>
       <xsl:comment>#126 CSI $ptn:Input_exec_time__x3A__analyze[<xsl:value-of select="$ptn:Input_exec_time__x3A__analyze"/>]</xsl:comment>
        <xsl:element name="{$ptn:Simulation__x3A__Interpolator__x3A__type}">
            <xsl:attribute name="DEF">
                <xsl:call-template name="ptn:Simulation__x3A__DEF_Interpolator">
                    <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" tunnel="yes">Coordinate</xsl:with-param>
                    <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" tunnel="yes">point</xsl:with-param>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active"/>
            <xsl:attribute name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all"/>
                <!--<xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:for-each>-->
            <xsl:attribute name="base_cord">
                <xsl:call-template name="ptn:MFVec3f__x3A__sequence">
                    <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="true()"/>
                </xsl:call-template>
            </xsl:attribute>
                <xsl:call-template name="ptn:Simulator_tick__x3A__for-each-group__x3A__key"/>
            <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys">
                <!--<ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>
                    <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!-\-ptn:Simulation_body__x3A__analyze-\->
                        <xsl:choose>
                            <xsl:when test="$current-group/ancestor-or-self::ptn:Simulation_body__x3A__analyze[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]">
                                <ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                                    <xsl:value-of select="position()"/>
                                </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                            </xsl:when>
                            <xsl:otherwise>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>--> 
                <ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>
                    <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!--ptn:Simulation_body__x3A__analyze-->
                        <xsl:choose>        
                            <xsl:when test="$current-group/ancestor-or-self::ptn:Simulation.analys.xml__x3A__analyze[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]">
                                <ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                                    <xsl:value-of select="position()"/>
                                </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                            </xsl:when>
                            <xsl:otherwise>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>
            </xsl:variable>
                <xsl:attribute name="keyValue">
                    <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!-- ptn:Simulation_body__x3A__analyze -->
                        <xsl:choose>
                            <xsl:when test="$current-group/ancestor-or-self::ptn:Simulation.analys.xml__x3A__analyze[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]"><!-- ptn:Simulation_body__x3A__analyze -->
                                <xsl:call-template name="ptn:MFVec3f__x3A__section__x3A__sequence">
                                    <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="position() = last()"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" select="position()" tunnel="yes"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="last()" tunnel="yes"/><!-- $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active -->
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" tunnel="yes"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" tunnel="yes"/>
                                    <xsl:with-param name="ptn:MFVec3f__x3A__length" tunnel="yes" select="$ptn:Input_exec_Maximum_current__x3A__analyze"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" select="false()" tunnel="yes"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="ptn:MFVec3f__x3A__section__x3A__sequence">
                                    <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="position() = last()"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" select="position()" tunnel="yes"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="last()" tunnel="yes"/><!-- $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active -->
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" tunnel="yes"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" tunnel="yes"/>
                                    <xsl:with-param name="ptn:MFVec3f__x3A__length" tunnel="yes" select="$ptn:Input_exec_Maximum_current__x3A__analyze"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" select="true()" tunnel="yes"/>
                                </xsl:call-template>
                                <!--<xsl:call-template name="ptn:MFVec3f__x3A__sequence">
                                    <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="position() = last()"/>
                                    <xsl:with-param name="ptn:MFVec3f__x3A__distance" select="0"/>
                                </xsl:call-template>-->
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:attribute>
            <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys">
                <ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>
                    <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!--ptn:Simulation_body__x3A__analyze-->
                        <xsl:choose>        
                            <xsl:when test="$current-group/ancestor-or-self::ptn:Simulation.analys.xml__x3A__analyze[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]">
                                <ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                                    <xsl:value-of select="position()"/>
                                </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                            </xsl:when>
                            <xsl:otherwise>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>    
            </xsl:variable>
            <!--<xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys"/>-->
            <!--<xsl:element name="keyValue_DEBUG242">
                <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!-\- ptn:Simulation_body__x3A__analyze -\->
                    <position pos="{position()}">
                        <xsl:choose>
                            <xsl:when test="$current-group/ancestor-or-self::ptn:Simulation.analys.xml__x3A__analyze[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]"><!-\- ptn:Simulation_body__x3A__analyze -\->
                                <xsl:attribute name="true" select="true()"/>
                                <xsl:attribute name="ptn:MFVec3f__x3A__length" select="$ptn:Input_exec_Maximum_current__x3A__analyze"/>
                                <xsl:call-template name="ptn:MFVec3f__x3A__section__x3A__sequence_debug">
                                    <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="position() = last()"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" select="position()" tunnel="yes"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="last()" tunnel="yes"/><!-\- $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active -\->
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" tunnel="yes"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" tunnel="yes"/>
                                    <xsl:with-param name="ptn:MFVec3f__x3A__length" tunnel="yes" select="$ptn:Input_exec_Maximum_current__x3A__analyze"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" select="false()" tunnel="yes"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="true" select="false()"/>
                                
                                <!-\-<xsl:text></xsl:text>-\->
                                <xsl:value-of select="position()"/>
                                <xsl:call-template name="ptn:MFVec3f__x3A__section__x3A__sequence">
                                    <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="position() = last()"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" select="position()" tunnel="yes"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="last()" tunnel="yes"/><!-\- $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active -\->
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" tunnel="yes"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" tunnel="yes"/>
                                    <xsl:with-param name="ptn:MFVec3f__x3A__length" tunnel="yes" select="$ptn:Input_exec_Maximum_current__x3A__analyze"/>
                                    <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" select="true()" tunnel="yes"/>
                                </xsl:call-template>
                                <xsl:text> ;)</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </position>
                </xsl:for-each>
            </xsl:element>-->
                        <!--<xsl:attribute name="point">
                            <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Coordinate_Z + 1"/><xsl:text> </xsl:text>
                            <!-\-<xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_X"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_Y"/><xsl:text> 0</xsl:text>-\->
                            <!-\-<xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Input_exec_receptor__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_X"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Input_exec_receptor__x3A__analyze][@ptn:Coordinate_Y][@ptn:Coordinate_Y][1]/@ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Input_exec_receptor__x3A__analyze][@ptn:Coordinate_Z][@ptn:Coordinate_Z][1]/@ptn:Coordinate_Z"/><xsl:text> </xsl:text>-\->
                        </xsl:attribute>-->
                        <xsl:text> </xsl:text>
        </xsl:element>
        <xsl:variable name="DEF">
            <xsl:call-template name="ptn:Simulation__x3A__DEF_Interpolator">
                <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" tunnel="yes">Coordinate</xsl:with-param>
                <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" tunnel="yes">point</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:result-document href="{$ptn:Simulation.dir}/debug/Input/{$DEF}.xml">
            <xsl:element name="{$ptn:Simulation__x3A__Interpolator__x3A__type}__x3A__debug">
                <xsl:attribute name="ptn:Coordinate_X" select="$ptn:Coordinate_X"/>
                <xsl:attribute name="ptn:Coordinate_Y" select="$ptn:Coordinate_Y"/>
                <xsl:attribute name="ptn:Coordinate_Z" select="$ptn:Coordinate_Z"/>
                <xsl:attribute name="ptn:Coordinate_X__x3A__remote" select="$ptn:Coordinate_X__x3A__remote"/>
                <xsl:attribute name="ptn:Coordinate_Y__x3A__remote" select="$ptn:Coordinate_Y__x3A__remote"/>
                <xsl:attribute name="ptn:Coordinate_Z__x3A__remote" select="$ptn:Coordinate_Z__x3A__remote"/>
                <xsl:attribute name="DEF">
                    <xsl:call-template name="ptn:Simulation__x3A__DEF_Interpolator">
                        <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" tunnel="yes">Coordinate</xsl:with-param>
                        <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" tunnel="yes">point</xsl:with-param>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:attribute name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active"/>
                <xsl:attribute name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all"/>
                <!--<xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:for-each>-->
                <xsl:attribute name="base_cord">
                    <xsl:call-template name="ptn:MFVec3f__x3A__sequence">
                        <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="true()"/>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="ptn:Simulator_tick__x3A__for-each-group__x3A__key"/>
                <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys">
                    <ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>
                        <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!--ptn:Simulation_body__x3A__analyze-->
                            <xsl:choose>        
                                <xsl:when test="$current-group/ancestor-or-self::ptn:Simulation.analys.xml__x3A__analyze[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]">
                                    <ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                                        <xsl:value-of select="position()"/>
                                    </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position>
                                </xsl:when>
                                <xsl:otherwise>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys>
                </xsl:variable>
                    <keyValue>
                        <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!-- ptn:Simulation_body__x3A__analyze -->
                            <row>
                                <xsl:choose>
                                    <xsl:when test="$current-group/ancestor-or-self::ptn:Simulation.analys.xml__x3A__analyze[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]"><!-- ptn:Simulation_body__x3A__analyze -->
                                        <xsl:call-template name="ptn:MFVec3f__x3A__section__x3A__sequence">
                                            <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="position() = last()"/>
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" select="position()" tunnel="yes"/>
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="last()" tunnel="yes"/><!-- $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active -->
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" tunnel="yes"/>
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" tunnel="yes"/>
                                            <xsl:with-param name="ptn:MFVec3f__x3A__length" tunnel="yes" select="$ptn:Input_exec_Maximum_current__x3A__analyze"/>
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" select="false()" tunnel="yes"/>
                                            <xsl:with-param name="ptn:debug" select="true()"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name="ptn:MFVec3f__x3A__section__x3A__sequence">
                                            <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="position() = last()"/>
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" select="position()" tunnel="yes"/>
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" select="last()" tunnel="yes"/><!-- $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active -->
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" tunnel="yes"/>
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" tunnel="yes"/>
                                            <xsl:with-param name="ptn:MFVec3f__x3A__length" tunnel="yes" select="$ptn:Input_exec_Maximum_current__x3A__analyze"/>
                                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" select="true()" tunnel="yes"/>
                                            <xsl:with-param name="ptn:debug" select="true()"/>
                                        </xsl:call-template>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </row>
                        </xsl:for-each>
                    </keyValue>
                <xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys"/>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>
    
    
    
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Route">
        <xsl:comment>#174 SIR </xsl:comment>
        <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Route" select="."/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Route" match="ptn:Input__x3A__analyze">
            <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
            <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
            <xsl:comment>#204 DEF.ROUTE match[<xsl:value-of select="name()"/>] @tick[<xsl:value-of select="parent::*/@ptn:Simulation_body_tic"/>] $n[<xsl:value-of select="$ptn:Label__x3A__analyze"/>]</xsl:comment>
            <!--<xsl:apply-templates mode="#current" select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:apply-templates>-->
            <xsl:variable name="current-group" select="current-group()"/>
            <!--<xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:copy-of>-->
            <xsl:if test="string-length($ptn:Label__x3A__analyze) = 0"><xsl:message terminate="yes">#478 empty[$ptn:Label__x3A__analyze]</xsl:message></xsl:if>
            <xsl:call-template name="ptn:Simulation__x3A__ROUTE">
                <xsl:with-param name="ptn:Simulation__x3A__TimeSensor" tunnel="yes"/>
            </xsl:call-template>
            
        
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>