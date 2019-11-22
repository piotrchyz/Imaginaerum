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
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Shape" match="*">
        <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
        <xsl:message terminate="yes">#475 unantended n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Shape" match="ptn:Current_synapse__x3A__analyze">
        <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Output_Node__x3A__analyze" select="@ptn:Output_Node__x3A__analyze"/>
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:comment>#480 n[<xsl:value-of select="name()"/>]  ON[<xsl:value-of select="$ptn:Output_Node__x3A__analyze"/>]</xsl:comment>
        <xsl:if test="string-length($ptn:Label__x3A__analyze) = 0"><xsl:message terminate="yes">empty[$ptn:Label__x3A__analyze]</xsl:message></xsl:if>
        <Shape>
            <LineSet vertexCount='2'>
                <Coordinate DEF="{$ptn:Label__x3A__analyze}_to_{@ptn:Output_Node__x3A__analyze}_Current_synapse_LineSet"  ><!-- point='5 0 0 1 5 0' -->
                    <xsl:attribute name="point">
                        <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text>
                        <xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                        <xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                        <!--<xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_X"/><xsl:text> </xsl:text>
                        <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_Y"/><xsl:text> 0</xsl:text>-->
                        <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_X"/><xsl:text> </xsl:text>
                        <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_Y][@ptn:Coordinate_Y][1]/@ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                        <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_Z][@ptn:Coordinate_Z][1]/@ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                    </xsl:attribute>
                    <xsl:text> </xsl:text></Coordinate>
            </LineSet>
            <Appearance>
                <Material emissiveColor='1 0 0' DEF="{$ptn:Label__x3A__analyze}_to_{@ptn:Output_Node__x3A__analyze}_Current_synapse_emissiveColor"><xsl:text> </xsl:text></Material>
                <LineProperties linewidthScaleFactor='5'><xsl:text> </xsl:text></LineProperties>
            </Appearance>
        </Shape>
    </xsl:template>
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Group" match="*">
        <xsl:message terminate="yes">#257 ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Group /n [<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Group" match="ptn:Current_synapse__x3A__analyze">
        <xsl:param name="ptn:Label__x3A__analyze" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation_body_tick" select="parent::*/parent::*/@ptn:Simulation_body_tick"/>
        <xsl:param name="ptn:Output_Node__x3A__analyze" select="@ptn:Output_Node__x3A__analyze"/>
        <xsl:param name="ptn:Attract__x3A__flag" select="parent::*/@ptn:Attract__x3A__flag"/>
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml" tunnel="yes" required="yes"/>
        <!--<xsl:param name="current-group" tunnel="yes" required="yes"/>-->
        <xsl:variable name="current-group" select="current-group()"/>
        <xsl:comment>#206S DEF.ROUTE match[<xsl:value-of select="name()"/>] AF[<xsl:value-of select="$ptn:Attract__x3A__flag"/>] @tick[<xsl:value-of select="$ptn:Simulation_body_tick"/>] $L[<xsl:value-of select="$ptn:Label__x3A__analyze"/>]  CGK[<xsl:value-of select="current-grouping-key()"/>] ON[<xsl:value-of select="$ptn:Output_Node__x3A__analyze"/>]  X[<xsl:value-of select="$ptn:Coordinate_X"/>] Z[<xsl:value-of select="$ptn:Coordinate_Z"/>]</xsl:comment>
        <!--<xsl:apply-templates mode="#current" select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:apply-templates>-->
        <xsl:if test="string-length($ptn:Label__x3A__analyze) = 0"><xsl:message terminate="yes">#296 empty[$ptn:Label__x3A__analyze]</xsl:message></xsl:if>
        <!--<xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:copy-of>-->
        
        <CoordinateInterpolator DEF="{$ptn:Label__x3A__analyze}_to_{@ptn:Output_Node__x3A__analyze}_Current_synapse_CoordinateInterpolator" 
            current-group.n="{$current-group/name()}" cgo="{$current-group/@ptn:Output_Node__x3A__analyze}"><!-- key="0, 0.2, 0.4, 0.6, 0.8, 1" -->
            <xsl:attribute name="keyValue">
                <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation_body__x3A__analyze">
                    <xsl:choose>
                        <xsl:when test="$current-group[parent::*/parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]][@ptn:Output_Node__x3A__analyze = $ptn:Output_Node__x3A__analyze]"><!-- test="$current-group/parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]" -->
                            <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text><xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text><xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_X"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_Y][@ptn:Coordinate_Y][1]/@ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Output_Node__x3A__analyze][@ptn:Coordinate_Z][@ptn:Coordinate_Z][1]/@ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                        </xsl:when>
                        <!-- attract show -->
                        <xsl:when test="$ptn:Attract__x3A__flag = true()"><!-- test="$current-group/parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]" -->
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Label__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_X"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Label__x3A__analyze][@ptn:Coordinate_Y][@ptn:Coordinate_Y][1]/@ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Label__x3A__analyze][@ptn:Coordinate_Z][@ptn:Coordinate_Z][1]/@ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Label__x3A__analyze][@ptn:Coordinate_X][@ptn:Coordinate_X][1]/@ptn:Coordinate_X"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Label__x3A__analyze][@ptn:Coordinate_Y][@ptn:Coordinate_Y][1]/@ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Simulation.analyze_simulation.xml/descendant-or-self::*[@ptn:Label__x3A__analyze = $ptn:Label__x3A__analyze][@ptn:Coordinate_Z][@ptn:Coordinate_Z][1]/@ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text><xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text><xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                            <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text><xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text><xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="position() = last()"/>
                        <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:attribute>
            <xsl:attribute name="key">
                <xsl:for-each select="1 to count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation_body__x3A__analyze)">
                    <xsl:choose>
                        <xsl:when test="position() = last()">
                            <xsl:value-of select="1"/>
                        </xsl:when>
                        <xsl:when test="position() = 1">
                            <xsl:value-of select="0"/><xsl:text>, </xsl:text>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="format-number(1 div count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation_body__x3A__analyze) * position(), '0.00')"/><xsl:text>, </xsl:text></xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:attribute><xsl:text> </xsl:text>
        </CoordinateInterpolator>
        <!--<ColorInterpolator DEF="{$ptn:Label__x3A__analyze}_to_{@ptn:Output_Node__x3A__analyze}_Current_synapse_ColorInterpolator" ><!-\- key="0, 0.2, 0.4, 0.6, 0.8, 1" -\->
            <xsl:attribute name="keyValue">
                <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation_body__x3A__analyze">
                    <xsl:choose>
                        <xsl:when test="$current-group/parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]">
                            <xsl:value-of select="format-number(abs(($current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/@ptn:Simulated_potential + abs($ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage)) div $ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage), '0.00')"/><xsl:text> 0</xsl:text><!-\- <xsl:value-of select="($current-group/parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]//@ptn:Simulated_potential + 200) div 400"/> -\-><!-\- <xsl:value-of select="$current-group/@ptn:Simulated_potential"/> -\->
                            <xsl:choose>
                                <xsl:when test="$current-group[parent::*[@ptn:Simulation_body_tick = current()/@ptn:Simulation_body_tick]]/(@ptn:Attract__x3A__flag='true' and @ptn:Outputs__x3A__count = '0')"><xsl:text> 1 </xsl:text></xsl:when>
                                <xsl:otherwise> 0 </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>1 1 1 </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="position() = last()"/>
                        <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:attribute>
            <xsl:attribute name="key">
                <xsl:for-each select="1 to count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation_body__x3A__analyze)">
                    <xsl:choose>
                        <xsl:when test="position() = last()">
                            <xsl:value-of select="1"/>
                        </xsl:when>
                        <xsl:when test="position() = 1">
                            <xsl:value-of select="0"/><xsl:text>, </xsl:text>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="format-number(1 div count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation_body__x3A__analyze) * position(), '0.00')"/><xsl:text>, </xsl:text></xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:attribute><xsl:text> </xsl:text>
        </ColorInterpolator>-->
        
    </xsl:template>
    
    
</xsl:stylesheet>