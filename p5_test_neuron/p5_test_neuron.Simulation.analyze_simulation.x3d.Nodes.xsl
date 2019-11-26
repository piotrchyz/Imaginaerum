<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes" method="xml" />
    <xsl:strip-space elements="*"/>
    
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Group" match="*">
        <xsl:comment>#200 DEF.ROUTE match[<xsl:value-of select="name()"/>]</xsl:comment>
        <xsl:message>#200 DEF.ROUTE match[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Group" match="ptn:Leaky_neuron_inhibitor__X3A__AA__x3A__analyze|ptn:Leaky_neuron_inhibitor__x3A__AB__x3A__analyze|ptn:Receptor__x3A__analyze|ptn:Leaky_neuron_standard__x3A__analyze">
        <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage" tunnel="yes" required="yes"/>
        <xsl:comment>#204 DEF.ROUTE match[<xsl:value-of select="name()"/>] @tick[<xsl:value-of select="parent::*/@ptn:Simulation_body_tic"/>] $n[<xsl:value-of select="$ptn:Label__x3A__analyze"/>]</xsl:comment>
        <!--<xsl:apply-templates mode="#current" select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:apply-templates>-->
        <xsl:variable name="current-group" select="current-group()"/>
        <xsl:variable name="current" select="current()"/>
        <!--<xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:copy-of>-->
        <xsl:result-document href="{$ptn:Simulation.dir}/debug/Nodes/{$ptn:Label__x3A__analyze}_EmissiveColorInterpolator.xml">
            <ColorInterpolator DEF="{$ptn:Label__x3A__analyze}_EmissiveColorInterpolator" ><!-- key="0, 0.2, 0.4, 0.6, 0.8, 1" -->
                
                    <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!-- ptn:Simulation_body__x3A__analyze -->
                        
                        <keyValue>
                        <xsl:choose>
                               
                                <xsl:when test="$current-group/parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]">
                                    <current>
                                        <xsl:copy-of select="."/>
                                    </current>
                                    <current-group ptn:Simulation_body_tick="{@ptn:Simulation_body_tick}">
                                        <xsl:copy-of select="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]"/>
                                    </current-group>
                                    <xsl:message>#35 DEB  @tick[<xsl:value-of select="@ptn:Simulation_body_tick"/>]
                                        @@ptn:Simulated_potential[label][<xsl:value-of select="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/@ptn:Label__x3A__analyze "/>]  @@ptn:Simulated_potential[<xsl:value-of select="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential "/>]
                                        @@ptn:min[<xsl:value-of select="min($current-group[parent::*]/@ptn:Simulated_potential)"/>]  @@ptn:max[<xsl:value-of select="max($current-group[parent::*]/@ptn:Simulated_potential)"/>]  abs[V][<xsl:value-of select="abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)"/>] MX[V][<xsl:value-of select="$ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage"/>]
                                    </xsl:message>
                                    <!--<xsl:value-of select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/>--><xsl:text> </xsl:text><!-- <xsl:value-of select="($current-group/parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]//@ptn:Simulated_potential + 200) div 400"/> --><!-- <xsl:value-of select="$current-group/@ptn:Simulated_potential"/> -->
                                    <!--<xsl:value-of select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/><xsl:text> </xsl:text>-->
                                    <!--<xsl:choose>
                                    <xsl:when test="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/(@ptn:Attract__x3A__flag='true' and @ptn:Outputs__x3A__count = '0')"><xsl:text> 1 </xsl:text></xsl:when>
                                    <xsl:otherwise> 0 </xsl:otherwise>
                                </xsl:choose>-->
                                    <xsl:choose>
                                        <xsl:when test="count($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]) &gt; 1">
                                            <xsl:message>#53 [ERROR][MORE ROWS][@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]] [LABEL[<xsl:value-of select="$ptn:Label__x3A__analyze"/>]]  =#[<xsl:value-of select="count($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential)"/>]</xsl:message>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:call-template name="ptn:MFColor__x3A__sequence__x3A__dynamic">
                                        <xsl:with-param name="ptn:MFColor__x3A__R" select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/>
                                        <xsl:with-param name="ptn:MFColor__x3A__G" select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/>
                                        <xsl:with-param name="ptn:MFColor__x3A__B" select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/>
                                        <xsl:with-param name="ptn:Simulated_potential__x3A__min" select="min($current-group[parent::*]/@ptn:Simulated_potential)"/>
                                        <xsl:with-param name="ptn:Simulated_potential__x3A__max" select="max($current-group[parent::*]/@ptn:Simulated_potential)"/>
                                        <xsl:with-param name="ptn:Simulated_potential__x3A__current" select="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential"/>
                                        <xsl:with-param name="ptn:MFColor__x3A__sequence__x3A__last" select="position() = last()"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!--<xsl:text>1 1 1 </xsl:text>-->
                                    <xsl:call-template name="ptn:MFColor__x3A__sequence">
                                        <xsl:with-param name="ptn:MFColor__x3A__R" select="1"/>
                                        <xsl:with-param name="ptn:MFColor__x3A__G" select="1"/>
                                        <xsl:with-param name="ptn:MFColor__x3A__B" select="1"/>
                                        
                                        <xsl:with-param name="ptn:MFColor__x3A__sequence__x3A__last" select="position() = last()"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </keyValue>
                        
                    </xsl:for-each>
                
             
                    <xsl:for-each select="1 to count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze)"><!-- ptn:Simulation_body__x3A__analyze -->
                            <key>
                                <xsl:choose>
                                    <xsl:when test="position() = last()">
                                        <xsl:value-of select="1"/>
                                    </xsl:when>
                                    <xsl:when test="position() = 1">
                                        <xsl:value-of select="0"/><xsl:text>, </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise><xsl:value-of select="format-number(1 div count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze) * position(), '0.00')"/><xsl:text>, </xsl:text></xsl:otherwise><!-- ptn:Simulation_body__x3A__analyze -->
                                </xsl:choose>
                            </key>
                    </xsl:for-each>
                <xsl:text> </xsl:text>
            </ColorInterpolator>
        </xsl:result-document>
        <ColorInterpolator DEF="{$ptn:Label__x3A__analyze}_EmissiveColorInterpolator" ><!-- key="0, 0.2, 0.4, 0.6, 0.8, 1" -->
            <xsl:attribute name="keyValue">
                <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze"><!-- ptn:Simulation_body__x3A__analyze -->
                    <xsl:choose>
                        <xsl:when test="$current-group/parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]">
                            <xsl:message>#35 DEB  @tick[<xsl:value-of select="@ptn:Simulation_body_tick"/>]
                                @@ptn:Simulated_potential[label][<xsl:value-of select="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/@ptn:Label__x3A__analyze "/>]  @@ptn:Simulated_potential[<xsl:value-of select="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential "/>]
                                @@ptn:min[<xsl:value-of select="min($current-group[parent::*]/@ptn:Simulated_potential)"/>]  @@ptn:max[<xsl:value-of select="max($current-group[parent::*]/@ptn:Simulated_potential)"/>]  abs[V][<xsl:value-of select="abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)"/>] MX[V][<xsl:value-of select="$ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage"/>]
                                </xsl:message>
                            <!--<xsl:value-of select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/>--><xsl:text> </xsl:text><!-- <xsl:value-of select="($current-group/parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]//@ptn:Simulated_potential + 200) div 400"/> --><!-- <xsl:value-of select="$current-group/@ptn:Simulated_potential"/> -->
                            <!--<xsl:value-of select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/><xsl:text> </xsl:text>-->
                            <!--<xsl:choose>
                                <xsl:when test="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/(@ptn:Attract__x3A__flag='true' and @ptn:Outputs__x3A__count = '0')"><xsl:text> 1 </xsl:text></xsl:when>
                                <xsl:otherwise> 0 </xsl:otherwise>
                            </xsl:choose>-->
                            <xsl:call-template name="ptn:MFColor__x3A__sequence__x3A__dynamic">
                                <xsl:with-param name="ptn:MFColor__x3A__R" select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/>
                                <xsl:with-param name="ptn:MFColor__x3A__G" select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/>
                                <xsl:with-param name="ptn:MFColor__x3A__B" select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/>
                                <xsl:with-param name="ptn:Simulated_potential__x3A__min" select="min($current-group[parent::*]/@ptn:Simulated_potential)"/>
                                <xsl:with-param name="ptn:Simulated_potential__x3A__max" select="max($current-group[parent::*]/@ptn:Simulated_potential)"/>
                                <xsl:with-param name="ptn:Simulated_potential__x3A__current" select="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][1]/@ptn:Simulated_potential"/>
                                <xsl:with-param name="ptn:MFColor__x3A__sequence__x3A__last" select="position() = last()"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <!--<xsl:text>1 1 1 </xsl:text>-->
                            <xsl:call-template name="ptn:MFColor__x3A__sequence">
                                <xsl:with-param name="ptn:MFColor__x3A__R" select="1"/>
                                <xsl:with-param name="ptn:MFColor__x3A__G" select="1"/>
                                <xsl:with-param name="ptn:MFColor__x3A__B" select="1"/>
                                
                                <xsl:with-param name="ptn:MFColor__x3A__sequence__x3A__last" select="position() = last()"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--<xsl:choose>
                        <xsl:when test="position() = last()"/>
                        <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
                    </xsl:choose>-->
                    
                    
                    
                </xsl:for-each>
            </xsl:attribute>
            <xsl:attribute name="key">
                <xsl:for-each select="1 to count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze)"><!-- ptn:Simulation_body__x3A__analyze -->
                    <xsl:choose>
                        <xsl:when test="position() = last()">
                            <xsl:value-of select="1"/>
                        </xsl:when>
                        <xsl:when test="position() = 1">
                            <xsl:value-of select="0"/><xsl:text>, </xsl:text>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="format-number(1 div count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze) * position(), '0.00')"/><xsl:text>, </xsl:text></xsl:otherwise><!-- ptn:Simulation_body__x3A__analyze -->
                    </xsl:choose>
                </xsl:for-each>
            </xsl:attribute><xsl:text> </xsl:text>
        </ColorInterpolator>
        <!-- <ROUTE fromNode="{$ptn:Label__x3A__analyze}_ColorInterpolator"
            fromField="fraction_changed"
            toNode="{$ptn:Label__x3A__analyze}_EmissiveColorInterpolator"
            toField="set_fraction"><xsl:text> </xsl:text></ROUTE>
        <ROUTE fromNode="{$ptn:Label__x3A__analyze}_EmissiveColorInterpolator"
            fromField="value_changed"
            toNode="{$ptn:Label__x3A__analyze}_Material"
            toField="set_emissiveColor"><xsl:text> </xsl:text></ROUTE>-->
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.ROUTE" match="*">
        <xsl:message terminate="yes">#444 unantended[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.ROUTE" match="ptn:Current_synapse__x3A__analyze">
        <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Output_Node__x3A__analyze" select="@ptn:Output_Node__x3A__analyze"/>
        <xsl:comment>#451 SYNPS DEF.ROUTE match[<xsl:value-of select="name()"/>] @tick[<xsl:value-of select="parent::*/@ptn:Simulation_body_tic"/>] $n[<xsl:value-of select="$ptn:Label__x3A__analyze"/>]</xsl:comment>
        <!--<xsl:apply-templates mode="#current" select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:apply-templates>-->
        <xsl:variable name="current-group" select="current-group()"/>
        <!--<xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:copy-of>-->
        <xsl:if test="string-length($ptn:Label__x3A__analyze) = 0"><xsl:message terminate="yes">#489 empty[$ptn:Label__x3A__analyze]</xsl:message></xsl:if>
        <ROUTE fromNode="ColorAnimationTimer"
            fromField="fraction_changed"
            toNode="{$ptn:Label__x3A__analyze}_to_{@ptn:Output_Node__x3A__analyze}_Current_synapse_CoordinateInterpolator"
            toField="set_fraction"><xsl:text> </xsl:text></ROUTE><!-- CoordAnimation_Clock -->
        <ROUTE fromNode="{$ptn:Label__x3A__analyze}_to_{@ptn:Output_Node__x3A__analyze}_Current_synapse_CoordinateInterpolator"
            fromField="value_changed"
            toNode="{$ptn:Label__x3A__analyze}_to_{@ptn:Output_Node__x3A__analyze}_Current_synapse_LineSet"
            toField="point"><xsl:text> </xsl:text></ROUTE>
    </xsl:template>
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.ROUTE" match="ptn:Leaky_neuron_inhibitor__X3A__AA__x3A__analyze|ptn:Leaky_neuron_inhibitor__x3A__AB__x3A__analyze|ptn:Receptor__x3A__analyze|ptn:Leaky_neuron_standard__x3A__analyze">
        <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
        <xsl:comment>#204 DEF.ROUTE match[<xsl:value-of select="name()"/>] @tick[<xsl:value-of select="parent::*/@ptn:Simulation_body_tic"/>] $n[<xsl:value-of select="$ptn:Label__x3A__analyze"/>]</xsl:comment>
        <!--<xsl:apply-templates mode="#current" select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:apply-templates>-->
        <xsl:variable name="current-group" select="current-group()"/>
        <!--<xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:copy-of>-->
        <xsl:if test="string-length($ptn:Label__x3A__analyze) = 0"><xsl:message terminate="yes">#478 empty[$ptn:Label__x3A__analyze]</xsl:message></xsl:if>
        <ROUTE fromNode="ColorAnimationTimer"
            fromField="fraction_changed"
            toNode="{$ptn:Label__x3A__analyze}_EmissiveColorInterpolator"
            toField="set_fraction"><xsl:text> </xsl:text></ROUTE>
        <ROUTE fromNode="{$ptn:Label__x3A__analyze}_EmissiveColorInterpolator"
            fromField="value_changed"
            toNode="{$ptn:Label__x3A__analyze}_Material"
            toField="set_emissiveColor"><xsl:text> </xsl:text></ROUTE>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform" match="ptn:Receptor__x3A__analyze">
        <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
        <shape xsl:use-attribute-sets="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape">
            <appearance xsl:use-attribute-sets="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape.appearance">
                <material DEF="{$ptn:Label__x3A__analyze}_Material"
                    emissiveColor="1 0 0"
                    ><xsl:text> </xsl:text></material><!-- diffuseColor="1 0 0" -->
            </appearance>
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape__x3A__element"/>
        </shape>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform" match="ptn:Leaky_neuron_standard__x3A__analyze">
        <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
        <shape xsl:use-attribute-sets="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape">
            <appearance xsl:use-attribute-sets="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape.appearance">
                <material DEF="{$ptn:Label__x3A__analyze}_Material"
                    diffuseColor="0 1 0" emissiveColor="0 1 0"><xsl:text> </xsl:text></material>
            </appearance>
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape__x3A__element"/>
        </shape>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform" match="ptn:Leaky_neuron_inhibitor__x3A__AB__x3A__analyze|ptn:Leaky_neuron_inhibitor__X3A__AA__x3A__analyze">
        <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
        <shape xsl:use-attribute-sets="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape">
            <appearance xsl:use-attribute-sets="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape.appearance">
                <material DEF="{$ptn:Label__x3A__analyze}_Material"
                    diffuseColor="0 0 1" emissiveColor="0 0 1"><xsl:text> </xsl:text></material>
            </appearance>
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape__x3A__element"/>
        </shape>
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape__x3A__element">
        <sphere solid="true" ccw="true" usegeocache="true" lit="true" radius="1" subdivision="24,24"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform" match="*">
        <xsl:message>#173 [TOODO][ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform][/n[<xsl:value-of select="name()"/>]]</xsl:message>
        <ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform name="{name()}"/>      
    </xsl:template>
    
    
</xsl:stylesheet>