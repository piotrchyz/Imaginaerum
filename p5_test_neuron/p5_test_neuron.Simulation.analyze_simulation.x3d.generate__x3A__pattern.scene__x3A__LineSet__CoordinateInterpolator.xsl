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
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__Lineset" match="*"/>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__Lineset" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[ptn:keyValue__generate__basepoint_1[@ptn:Coordinate_X][@ptn:Coordinate_Y][@ptn:Coordinate_Z]][ptn:keyValue__generate__basepoint_1[@ptn:Coordinate_X][@ptn:Coordinate_Y][@ptn:Coordinate_Z]]">
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence">
            <xsl:with-param name="ptn:Coordinate_X" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X" tunnel="yes"/>
            <xsl:with-param name="ptn:Coordinate_Y" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Y" tunnel="yes"/>
            <xsl:with-param name="ptn:Coordinate_Z" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Z" tunnel="yes"/>
            <xsl:with-param name="ptn:Coordinate_X__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_X" tunnel="yes"/>
            <xsl:with-param name="ptn:Coordinate_Y__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Y" tunnel="yes"/>
            <xsl:with-param name="ptn:Coordinate_Z__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Z" tunnel="yes"/>
            <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="count(following-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector) = 0"/>
        </xsl:call-template>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator" match="*">
        <xsl:comment>#999 unantended [Colorinterporat]  [n][<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF]">
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__DEF" select="@DEF"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__current-group" select="current-group()"/>
        <xsl:comment>#999A  [Colorinterporat] [current-group] [n][<xsl:value-of select="name()"/>]</xsl:comment>
       
        
        
        
        <CoordinateInterpolator ptn:debug="{$ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__DEF}_scene__x3A__LineSet_CoordinateInterpolator">
            <xsl:attribute name="DEF">
                <xsl:call-template name="ptn:Simulation__x3A__DEF_Interpolator">
                    <xsl:with-param name="ptn:Label__x3A__analyze" select="$ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__DEF" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulation__x3A__TimeSensor" select="'ColorAnimationTimer'" tunnel="yes"/>
                    
                    <xsl:with-param name="ptn:Output_Node__x3A__analyze" select="'LineSet'" tunnel="yes"/><!-- remote tag -->
                    
                    <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__type" select="'CoordinateInterpolator'" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" select="'LineSet'" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" select="'point'" tunnel="yes"/>
                    
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="keyValue">
                <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group/descendant-or-self::ptn:Simulation.analys.xml__x3A__analyze">
                    <xsl:variable name="ptn:Simulator_tick" select="@ptn:Simulator_tick"/>
                    <xsl:variable name="ptn:Simulation_body_tick" select="@ptn:Simulation_body_tick"/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__position" select="position()"/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__last" select="last()"/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__step" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__position div $ptn:Simulator_tick__x3A__for-each-group__x3A__last"/>
                    <!--<ptn:CoordinateInterpolator__x3A__keyValue ptn:Simulator_tick__x3A__for-each-group__x3A__step="{$ptn:Simulator_tick__x3A__for-each-group__x3A__step}" ptn:Simulation_body_tick="{$ptn:Simulation_body_tick}" ptn:Simulator_tick="{$ptn:Simulator_tick}">-->
                    
                        <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__contextt" select="$ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__current-group">
                            <xsl:with-param name="ptn:Simulator_tick" select="$ptn:Simulator_tick" tunnel="yes"/>
                            <xsl:with-param name="ptn:Simulation_body_tick" select="$ptn:Simulation_body_tick" tunnel="yes"/>
                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__position" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__position" tunnel="yes"/>
                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__last" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__last" tunnel="yes"/>
                            <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__step" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__step" tunnel="yes"/>
                            <xsl:with-param name="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__attribute" tunnel="yes" select="'keyValue'"/>
                        </xsl:apply-templates>
                    
                    
                    <!--</ptn:CoordinateInterpolator__x3A__keyValue>-->
                </xsl:for-each>
            </xsl:attribute>
            <xsl:attribute name="key">
                <xsl:for-each select="$ptn:Simulator_tick__x3A__for-each-group/descendant-or-self::ptn:Simulation.analys.xml__x3A__analyze">
                    <xsl:variable name="ptn:Simulator_tick" select="@ptn:Simulator_tick"/>
                    <xsl:variable name="ptn:Simulation_body_tick" select="@ptn:Simulation_body_tick"/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__position" select="position()"/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__last" select="last()"/>
                    <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__step" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__position div $ptn:Simulator_tick__x3A__for-each-group__x3A__last"/>
                    <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__contextt" select="$ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__current-group">
                        <xsl:with-param name="ptn:Simulator_tick" select="$ptn:Simulator_tick" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulation_body_tick" select="$ptn:Simulation_body_tick" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__position" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__position" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__last" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__last" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group__x3A__step" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__step" tunnel="yes"/>
                        <xsl:with-param name="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__attribute" tunnel="yes" select="'key'"/>
                    </xsl:apply-templates>
                </xsl:for-each>
            </xsl:attribute>
            <xsl:text> </xsl:text>
        </CoordinateInterpolator>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__contextt
        ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__ROUTE
        ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__Shape" match="*">
        <!--<xsl:comment>#636 [Grouyp]  unantended [n][<xsl:value-of select="name()"/>]</xsl:comment>-->
    </xsl:template>
    
    <!--keyValue="1 1 1 , 1 1 1 , 1 1 1 , 1 1 1 , 1 1 1 , 1 1 1 , 1 1 1 , 1 1 1 , 1 1 1 , 1 1 1 ,  0.5 0.5 0.5 "-->
    <!-- key="0, 0.18, 0.27, 0.36, 0.45, 0.55, 0.64, 0.73, 0.82, 0.91, 1" -->
    <!--<xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__contextt" match="ptn:keyValue__generate__basepoint__x3A__calculations">
            <xsl:apply-templates mode="#current"/>    
    </xsl:template>-->
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__contextt" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__step" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__attribute" tunnel="yes" required="yes"/>
        <!--<xsl:message>#7878GG [ptn:keyValue__generate__basepoint__x3A__calculations]  [@ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step][<xsl:value-of select="@ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step"/>] </xsl:message>-->
        <xsl:choose>
            <xsl:when test="preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF = current()/@DEF]/number(@ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step) &gt; number($ptn:Simulator_tick__x3A__for-each-group__x3A__step)"/>
            <xsl:when test="number(@ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step) &gt; number($ptn:Simulator_tick__x3A__for-each-group__x3A__step)">
                <xsl:choose>
                    <xsl:when test="$ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__attribute = 'keyValue'">
                        <xsl:call-template name="ptn:MFVec3f__x3A__sequence">
                            <xsl:with-param name="ptn:Coordinate_X" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_X + sum(preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF = current()/@DEF]/ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_X__x3A__vector)" tunnel="yes"/>
                            <xsl:with-param name="ptn:Coordinate_Y" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Y + sum(preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF = current()/@DEF]/ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Y__x3A__vector)" tunnel="yes"/>
                            <xsl:with-param name="ptn:Coordinate_Z" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Z + sum(preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF = current()/@DEF]/ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Z__x3A__vector)" tunnel="yes"/>
                            
                            <xsl:with-param name="ptn:Coordinate_X__x3A__remote" tunnel="yes" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_X__x3A__remote + sum(preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF = current()/@DEF]/ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_X__x3A__vector)"/>
                            <xsl:with-param name="ptn:Coordinate_Y__x3A__remote" tunnel="yes" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Y__x3A__remote + sum(preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF = current()/@DEF]/ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Y__x3A__vector)"/>
                            <xsl:with-param name="ptn:Coordinate_Z__x3A__remote" tunnel="yes" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Z__x3A__remote + sum(preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF = current()/@DEF]/ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Z__x3A__vector)"/>
                            <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="not(following-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF = current()/@DEF])"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__attribute = 'key'">
                        <xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__step"/>
                        <xsl:if test="following-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF = current()/@DEF]"><xsl:text>, </xsl:text></xsl:if>
                    </xsl:when>
                </xsl:choose>
                
                
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:message>#7878GG[EEE]  [else]  [@ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step][<xsl:value-of select="@ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step"/>]</xsl:message>-->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__ROUTE" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@DEF]">
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__DEF" select="@DEF"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__x3A__current-group" select="current-group()"/>
        <xsl:comment>#999R  [ROUTE] [current-group] [n][<xsl:value-of select="name()"/>]</xsl:comment>
        
        <xsl:call-template name="ptn:Simulation__x3A__ROUTE">
            <xsl:with-param name="ptn:Simulation__x3A__TimeSensor" select="'ColorAnimationTimer'" tunnel="yes"/>
            <xsl:with-param name="ptn:Label__x3A__analyze" select="$ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__DEF" tunnel="yes"/><!-- main tag -->
            <xsl:with-param name="ptn:Output_Node__x3A__analyze" select="'LineSet'" tunnel="yes"/><!-- remote tag -->
            
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__type" select="'CoordinateInterpolator'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" select="'LineSet'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" select="'point'" tunnel="yes"/>
            
        </xsl:call-template>
       
            
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__Shape" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__DEF" select="@DEF"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" required="yes" tunnel="yes"/>
        <Shape>
            <LineSet vertexCount="2">
                <Coordinate>
                    <xsl:attribute name="DEF">
                        <xsl:call-template name="ptn:Simulation__x3A__DEF_Interpolator">
                            <xsl:with-param name="ptn:Label__x3A__analyze" select="$ptn:Input__x3A__generate__x3A__pattern__X3A__scene__x3A__LineSet__CoordinateInterpolator__DEF" tunnel="yes"/>
                            <xsl:with-param name="ptn:Simulation__x3A__TimeSensor" select="'ColorAnimationTimer'" tunnel="yes"/>
                            <xsl:with-param name="ptn:Output_Node__x3A__analyze" select="'LineSet'" tunnel="yes"/><!-- remote tag -->
                            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__type" select="'LineSet'" tunnel="yes"/>
                            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" select="'Coordinate'" tunnel="yes"/>
                            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" select="'point'" tunnel="yes"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:attribute name="point">
                        <xsl:call-template name="ptn:MFVec3f__x3A__sequence">
                            <xsl:with-param name="ptn:Coordinate_X" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_X" tunnel="yes"/>
                            <xsl:with-param name="ptn:Coordinate_Y" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Y" tunnel="yes"/>
                            <xsl:with-param name="ptn:Coordinate_Z" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Z" tunnel="yes"/>
                            <xsl:with-param name="ptn:Coordinate_X__x3A__remote" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_X__x3A__remote" tunnel="yes"/>
                            <xsl:with-param name="ptn:Coordinate_Y__x3A__remote" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Y__x3A__remote" tunnel="yes"/>
                            <xsl:with-param name="ptn:Coordinate_Z__x3A__remote" select="ptn:keyValue__generate__basepoint__x3A__calculations/@ptn:Coordinate_Z__x3A__remote" tunnel="yes"/>
                            <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="true()"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:text> </xsl:text>
                </Coordinate>
            </LineSet>
            <Appearance>
                <Material emissiveColor="1 0 0"><xsl:text> </xsl:text></Material>
                <LineProperties linewidthScaleFactor="1"><xsl:text> </xsl:text></LineProperties>
            </Appearance>
        </Shape>
        
    </xsl:template>
    
    
</xsl:stylesheet>