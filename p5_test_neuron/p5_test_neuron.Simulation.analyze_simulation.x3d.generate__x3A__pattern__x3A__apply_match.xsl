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
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input__x3A__generate__x3A__pattern__x3A__apply.xml">
        <ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match.xml>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match.xml>
    </xsl:template>
    
    
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Defaults|ptn:Receptor">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Receptors">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Adaptation_conductance|ptn:Adaptation_time_constant">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Refactory_period|ptn:Maximum_current|ptn:Time_constant|ptn:Delay|ptn:Attract_min">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|ptn:Is_inhibitor">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Outputs|ptn:Input__x3A__nodes|ptn:Simulated_potential|ptn:Receptor_regex_filter|ptn:Inputs|ptn:Simulation">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input_exec_time|ptn:Input_exec_receptor|ptn:Input_exec_Time_constant|ptn:Input_exec_Maximum_current">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Simulator_tick|ptn:Simulation_ticks">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Group__x3A__generate__x3A__pattern_Group">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input__x3A__generate__x3A__Shape">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray" select="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="IndexedFaceSet|Coordinate">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input__x3A__generate__x3A__pattern_Group">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[@ptn:Simulator_tick__x3A__context]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:debug">#153 @DEF?[<xsl:value-of select="@DEF"/>] [@ptn:Simulator_tick__x3A__context[<xsl:value-of select="@ptn:Simulator_tick__x3A__context"/>]];<xsl:value-of select="@ptn:debug"/></xsl:attribute>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulator_tick__x3A__context" select="@ptn:Simulator_tick__x3A__context" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:keyValue__generate__basepoint__x3A__calculations">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector[@ptn:Coordinate_X__generated][@ptn:Coordinate_Y__generated][@ptn:Coordinate_Z__generated][@ptn:Coordinate_X__x3A__remote__generated][@ptn:Coordinate_Y__x3A__remote__generated][@ptn:Coordinate_Z__x3A__remote__generated][@ptn:Simulation_tick__x3A__context]">
        <xsl:param name="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__context" tunnel="yes" required="yes"/>
        
        <xsl:choose>
            <xsl:when test="$ptn:Simulator_tick__x3A__context = @ptn:Simulation_tick__x3A__context">
                <ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector ptn:debug="">
                    <xsl:copy-of select="@*"/>
                    <xsl:attribute name="ptn:debug">#133A to calculate match triangles  [$ptn:Simulator_tick__x3A__context[<xsl:value-of select="$ptn:Simulator_tick__x3A__context"/>]] [@ptn:Simulation_tick__x3A__context[<xsl:value-of select="@ptn:Simulation_tick__x3A__context"/>]];<xsl:value-of select="@ptn:debug"/></xsl:attribute>
                    <xsl:apply-templates mode="#current"/>
                    <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray" select="$ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray">
                        <xsl:with-param name="ptn:Coordinate_X__generated" select="@ptn:Coordinate_X__generated" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Y__generated" select="@ptn:Coordinate_Y__generated" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Z__generated" select="@ptn:Coordinate_Z__generated" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_X__x3A__remote__generated" select="@ptn:Coordinate_X__x3A__remote__generated" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Y__x3A__remote__generated" select="@ptn:Coordinate_Y__x3A__remote__generated" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Z__x3A__remote__generated" select="@ptn:Coordinate_Z__x3A__remote__generated" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulation_tick__x3A__context" select="@ptn:Simulation_tick__x3A__context" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulation_tick__x3A__context__step" select="@ptn:Simulation_tick__x3A__context__step" tunnel="yes"/>
                        
                    </xsl:apply-templates>
                </ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>#133B [TODO][BYPASSED][MISMATCH_TIME] to calculate match triangles  [$ptn:Simulator_tick__x3A__context[<xsl:value-of select="$ptn:Simulator_tick__x3A__context"/>]] [@ptn:Simulation_tick__x3A__context[<xsl:value-of select="@ptn:Simulation_tick__x3A__context"/>]];<xsl:value-of select="@ptn:debug"/></xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray" match="*">
        <xsl:message terminate="yes">#146 unantended[ray match][n][<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray" match="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray">
       <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    
    <xsl:function name="ptn:rayTriangleIntersect_area">
        <xsl:param name="x1"/>
        <xsl:param name="y1"/>
        <xsl:param name="x2"/>
        <xsl:param name="y2"/>
        <xsl:param name="x3"/>
        <xsl:param name="y3"/>
        <xsl:value-of select="abs(($x1 * ($y2 - $y3) +  $x2 * ($y3 - $y1) + $x3 * ($y1 - $y2)) / 2.0)"/>
    </xsl:function>
    
    
    <xsl:function name="ptn:ray_line_intersection_test">
        <xsl:param name="p0_x"/>
        <xsl:param name="p0_y"/>
        <xsl:param name="p1_x"/>
        <xsl:param name="p1_y"/>
        <xsl:param name="p2_x"/>
        <xsl:param name="p2_y"/>
        <xsl:param name="p3_x"/>
        <xsl:param name="p3_y"/>
        <!--s1_x = float(p1_x - p0_x)-->
        <xsl:variable name="s1_x" select="$p1_x - $p0_x"/>
        
        <!--s1_y = float(p1_y - p0_y)-->
        <xsl:variable name="s1_y" select="$p1_y - $p0_y"/>
        <!--s2_x = float(p3_x - p2_x)-->
        <xsl:variable name="s2_x" select="$p3_x - $p2_x"/>
        <!--s2_y = float(p3_y - p2_y)-->
        <xsl:variable name="s2_y" select="$p3_y - $p2_y"/>
        <!--outcome = 0-->
        <xsl:variable name="outcome" select="0"/>
        <!--s = float (-s1_y * (p0_x - p2_x) + s1_x * (p0_y - p2_y)) / (-s2_x * s1_y + s1_x * s2_y)-->
        <xsl:variable name="s" select="(-$s1_y * ($p0_x - $p2_x) + $s1_x * ($p0_y - $p2_y)) div (-$s2_x * $s1_y + $s1_x * $s2_y)"/>
        <!--t = float ( s2_x * (p0_y - p2_y) - s2_y * (p0_x - p2_x)) / (-s2_x * s1_y + s1_x * s2_y)-->
        <xsl:variable name="t" select="( $s2_x * ($p0_y - $p2_y) - $s2_y * ($p0_x - $p2_x)) div (-$s2_x * $s1_y + $s1_x * $s2_y)"/>
       <!-- if (s >= 0 and s <= 1 and t >= 0 and t <= 1):
        
        outcome = 1-->
        <xsl:variable name="outcome">
            <xsl:choose>
                <xsl:when test="($s &gt;= 0 and $s &lt;= 1 and $t &gt;= 0 and $t &lt;= 1)">
                    <xsl:value-of select="1"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$outcome"/>
        
        
        
    </xsl:function>
    
    <xsl:template name="ptn:ray_triangle_intersection_test">
        <xsl:param name="vecX1"/>
        <xsl:param name="vecY1"/>
        <xsl:param name="vecX2"/>
        <xsl:param name="vecY2"/>
        <xsl:param name="triX1"/>
        <xsl:param name="triY1"/>
        <xsl:param name="triX2"/>
        <xsl:param name="triY2"/>
        <xsl:param name="triX3"/>
        <xsl:param name="triY3"/>
        <!--<xsl:message>#232 ptn:ray_triangle_intersection_test=[$vecX1[<xsl:value-of select="$vecX1"/>]]</xsl:message>-->
        <ptn:ray_triangle_intersection_test>
        <!--side_1_test = line_intersection_test(vecX1, vecY1, vecX2, vecY2, triX1, triY1, triX2, triY2)-->
        <xsl:variable name="side_1_test" select="ptn:ray_line_intersection_test($vecX1, $vecY1, $vecX2, $vecY2, $triX1, $triY1, $triX2, $triY2)"/>
        <!--side_2_test = line_intersection_test(vecX1, vecY1, vecX2, vecY2, triX2, triY2, triX3, triY3)-->
        <xsl:variable name="side_2_test" select="ptn:ray_line_intersection_test($vecX1, $vecY1, $vecX2, $vecY2, $triX2, $triY2, $triX3, $triY3)"/>
        <!--side_3_test = line_intersection_test(vecX1, vecY1, vecX2, vecY2, triX1, triY1, triX3, triY3)-->
        <xsl:variable name="side_3_test" select="ptn:ray_line_intersection_test($vecX1, $vecY1, $vecX2, $vecY2, $triX1, $triY1, $triX3, $triY3)"/>
        
        
        <!--result = side_1_test + side_2_test + side_3_test-->
        <!--<xsl:message>#232 ptn:ray_triangle_intersection_test=[$side_1_test[<xsl:value-of select="$side_1_test"/>]][$side_2_test[<xsl:value-of select="$side_2_test"/>]][$side_3_test[<xsl:value-of select="$side_3_test"/>]]</xsl:message>-->
        
        <xsl:variable name="result" select="$side_1_test + $side_2_test + $side_3_test"/>
        <xsl:message>#234 $result=[<xsl:value-of select="$result"/>]</xsl:message>
        
            <xsl:choose>
                <xsl:when test="$result &gt; 0">
                    <xsl:attribute name="ptn:ray_triangle_intersection_test.detected">
                        <xsl:text>#240A motion detected(</xsl:text><xsl:value-of select="$vecX1"/>,<xsl:value-of select="$vecY1"/> to <xsl:value-of select="$vecX2"/>,<xsl:value-of select="$vecY2"/><xsl:text>)</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="ptn:ray_triangle_intersection_test.not_detected">
                            <xsl:text>#240B motion not_detected(</xsl:text><xsl:value-of select="$vecX1"/>,<xsl:value-of select="$vecY1"/> to <xsl:value-of select="$vecX2"/>,<xsl:value-of select="$vecY2"/><xsl:text>)</xsl:text>
                        </xsl:attribute>
                    </xsl:otherwise>
            </xsl:choose>
        </ptn:ray_triangle_intersection_test>
    </xsl:template>
    
    <xsl:template name="ptn:ray_triangle_intersection_test_debug">
        <xsl:param name="vecX1"/>
        <xsl:param name="vecY1"/>
        <xsl:param name="vecX2"/>
        <xsl:param name="vecY2"/>
        <xsl:param name="triX1"/>
        <xsl:param name="triY1"/>
        <xsl:param name="triX2"/>
        <xsl:param name="triY2"/>
        <xsl:param name="triX3"/>
        <xsl:param name="triY3"/>
       
       
        <xsl:attribute name="vecX1" select="$vecX1"/>
        <xsl:attribute name="vecY1" select="$vecY1"/>
        <xsl:attribute name="vecX2" select="$vecX2"/>
        <xsl:attribute name="vecY2" select="$vecY2"/>
        <xsl:attribute name="triX1" select="$triX1"/>
        <xsl:attribute name="triY1" select="$triY1"/>
        <xsl:attribute name="triX2" select="$triX2"/>
        <xsl:attribute name="triY2" select="$triY2"/>
        <xsl:attribute name="triX3" select="$triX3"/>
        <xsl:attribute name="triY3" select="$triY3"/>
        
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray" match="IndexedFaceSet[@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less[not(.='')]][@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less[not(.='')]]"><!-- [@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less='67.5'][@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less='37.5'] -->
        <xsl:param name="ptn:Coordinate_X__generated"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_Y__generated"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_Z__generated"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__remote__generated"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__remote__generated"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__remote__generated"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation_tick__x3A__context"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation_tick__x3A__context__step" tunnel="yes" required="yes"/>
        <xsl:message>#238 [DEBUG][@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less[<xsl:value-of select="@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less"/>]]</xsl:message>
        <xsl:choose>
            <xsl:when test="$ptn:Coordinate_Z__generated = $ptn:Coordinate_Z__x3A__remote__generated"></xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">#168 [FEATURE][TO_IMPLEMENT][NOT_AVIALABLE[$ptn:Coordinate_Z__generated[<xsl:value-of select="$ptn:Coordinate_Z__generated"/>] not(=) $ptn:Coordinate_Z__x3A__remote__generated[<xsl:value-of select="$ptn:Coordinate_Z__x3A__remote__generated"/>]]]</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
        <!--<xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView_diff" select="-$ptn:Coordinate_X + $ptn:Coordinate_X__x3A__remote"/>-->
       
        
        <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff" select="- @ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context + @ptn:Coordinate_X__x3A__fieldOfView "/>
        <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_D" select="@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context "/>
        
        <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff" select="- @ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less + @ptn:Coordinate_X__x3A__fieldOfView  "/>
        <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_D" select="@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less "/>
        
        <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff" select="- @ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context + @ptn:Coordinate_Y__x3A__fieldOfView  "/>
        <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_D" select="@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context "/>
        
        <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff" select="- @ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less + @ptn:Coordinate_Y__x3A__fieldOfView  "/>
        <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_D" select="@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less   "/>
        
        <xsl:variable name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff" select="- @ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context + @ptn:Coordinate_Z__x3A__fieldOfView  "/>
        <xsl:variable name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_D" select="@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context   "/>
        
        
        <xsl:variable name="Tz" select="$ptn:Coordinate_Z__generated div $ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff"/>
        <xsl:variable name="Tz" select="$ptn:Coordinate_Z__generated div $ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff - $ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_D div $ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff"/><!--  -  $ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff div $ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_D -->
      
        <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz" select="$Tz * $ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff"/>
        <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV" select="$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz + $ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_D"/>
      
        <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_Tz" select="$Tz * $ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff"/>
        <xsl:variable name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV" select="$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_Tz + $ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_D"/>
      
        <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz" select="$Tz * $ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff"/>
        <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV" select="$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz + $ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_D"/>
        
        <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_Tz" select="$Tz * $ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff"/>
        <xsl:variable name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV" select="$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_Tz + $ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_D "/>
      
        <xsl:variable name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz" select="$Tz * $ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff"/>
        <xsl:variable name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV" select="$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz + $ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_D"/>
      
      
        
        <!-- x = 2.5t -->
        <!-- y = 7.5t -->
        <!--z = -50 + 60t |60-->
        <!--z/60 = -50/60 + t  -->
        <!--z/60 = -0,833333333333333 + t  |+0,833333333333333-->
        <!--z/60 + 0,833333333333333 =  + t  -->
        <!-- 0,3 +  -->
        <xsl:variable name="ptn:ray_triangle_intersection_test">
            <xsl:call-template name="ptn:ray_triangle_intersection_test">
                <xsl:with-param name="triX1" select="$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV"/>
                <xsl:with-param name="triY1" select="$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV"/>
                <xsl:with-param name="triX2" select="$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV"/>
                <xsl:with-param name="triY2" select="$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV"/>
                <xsl:with-param name="triX3" select="$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV"/>
                <xsl:with-param name="triY3" select="$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV"/>
                <xsl:with-param name="vecX1" select="$ptn:Coordinate_X__generated"/>
                <xsl:with-param name="vecY1" select="$ptn:Coordinate_Y__generated"/>
                <xsl:with-param name="vecX2" select="$ptn:Coordinate_X__x3A__remote__generated"/>
                <xsl:with-param name="vecY2" select="$ptn:Coordinate_Y__x3A__remote__generated"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$ptn:ray_triangle_intersection_test//@ptn:ray_triangle_intersection_test.detected">
                <ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray>
                    <xsl:attribute name="ptn:Simulation_tick__x3A__context" select="$ptn:Simulation_tick__x3A__context"/>
                    <xsl:attribute name="ptn:Simulation_tick__x3A__context__step" select="$ptn:Simulation_tick__x3A__context__step"/>
                    <xsl:attribute name="ptn:Label__x3A__fieldOfView__x3A__ray" select="@ptn:Label__x3A__fieldOfView__x3A__ray"/>
                    <xsl:copy-of select="$ptn:ray_triangle_intersection_test//@*"/>
                    <!--<X_D Xcontext_diff_D="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_D}"
                X_less_diff_D="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_D}"
                Ycontext_diff_D="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_D}"
                Y_less_diff_D="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_D}"
                Zcontext_diff_D="{$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_D}"
                
            />-->
                    <!--  XCd="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff}"
            XLd="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff}"
            YCD="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff}" 
            YLD="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff}"
            ZCD="{$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff}" -->
                    <!--<XT XO1="{@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context}" Y01="{@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context}" Z01="{@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}"
                XO2="{@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context}" Y02="{@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less}" Z02="{@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}"
                XO3="{@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less}" Y03="{@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context}" Z03="{@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}"
                XOW="{@ptn:Coordinate_X__x3A__fieldOfView}" Y0W="{@ptn:Coordinate_Y__x3A__fieldOfView}" Z0W="{@ptn:Coordinate_Z__x3A__fieldOfView}"
            />-->
                    <!--<X12 X1="{$ptn:Coordinate_X__generated}" Y1="{$ptn:Coordinate_Y__generated}" Z1="{$ptn:Coordinate_Z__generated}" X2="{$ptn:Coordinate_X__x3A__remote__generated}"
                Y2="{$ptn:Coordinate_Y__x3A__remote__generated}" Z2="{$ptn:Coordinate_Z__x3A__remote__generated}"
            />-->
                    <!--<Tz Tz="{$Tz}">-->
                    <!--<xsl:attribute name="Tz" select="$Tz"/>-->
                    
                    <xsl:attribute name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV" select="$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV"/>
                    <!--<XC
                    ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context="{@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context}"
                    ptn:Coordinate_X__x3A__fieldOfView="{@ptn:Coordinate_X__x3A__fieldOfView}"
                    ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff}"
                    ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz}"
                    ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_D="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_D}"
                    ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV}"
                />-->
                    <xsl:attribute name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV" select="$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV"/>
                    <!--<YC ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context="{@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context}"
                    ptn:Coordinate_Y__x3A__fieldOfView="{@ptn:Coordinate_Y__x3A__fieldOfView}"
                    ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff}"
                    ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz}"
                    ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_D="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_D}"
                    ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV}"
                />-->
                    <xsl:attribute name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV" select="$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV"/>
                    <!--<XL ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less="{@ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less}"
                    ptn:Coordinate_X__x3A__fieldOfView="{@ptn:Coordinate_X__x3A__fieldOfView}"
                    ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff}"
                    ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_Tz="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_Tz}"
                    ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_D="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_D}"
                    ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV="{$ptn:Coordinate_X__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV}"
                />-->
                    
                    <xsl:attribute name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV" select="$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV"/>
                    <!--<YL ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less="{@ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less}"
                    ptn:Coordinate_Y__x3A__fieldOfView="{@ptn:Coordinate_Y__x3A__fieldOfView}"
                    ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff}"
                    ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_Tz="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_Tz}"
                    ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_D="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_D}"
                    ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV="{$ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray__x3A__less_diff_TzV}"
                />-->
                    <!--<ZC ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context="{@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context}"
                    ptn:Coordinate_Z__x3A__fieldOfView="{@ptn:Coordinate_Z__x3A__fieldOfView}"
                    ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff="{$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff}"
                    ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz="{$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_Tz}"
                    ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_D='{$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_D}'
                    ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV="{$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV}"
                />-->
                    <xsl:attribute name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV" select="$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray__x3A__context_diff_TzV"/>
                    <xsl:attribute name="ptn:Coordinate_X__x3A__fieldOfView" select="@ptn:Coordinate_X__x3A__fieldOfView"/>
                    <xsl:attribute name="ptn:Coordinate_Y__x3A__fieldOfView" select="@ptn:Coordinate_Y__x3A__fieldOfView"/>
                    <xsl:attribute name="ptn:Coordinate_Z__x3A__fieldOfView" select="@ptn:Coordinate_Z__x3A__fieldOfView"/>
                    <!--</Tz>-->
                    
                    
                </ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray>
            </xsl:when>
        </xsl:choose>
        
        
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match_ray" match="IndexedFaceSet"/>
      
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="ptn:Simulated_potential__x3A__vectors|ptn:Simulated_potential__x3A__vectors.sum|ptn:Current_synapse|ptn:Nodes">
        <xsl:message terminate="no">#23X [TODO[MIGRATE]] unantended[n][<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:comment >#23X [TODO[MIGRATE]] unantended[n][<xsl:value-of select="name()"/>]</xsl:comment>
        <!--<xsl:copy-of select="."/>-->
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply_match" match="*">
        <xsl:message terminate="yes">#23 unantended[n][<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
</xsl:stylesheet>