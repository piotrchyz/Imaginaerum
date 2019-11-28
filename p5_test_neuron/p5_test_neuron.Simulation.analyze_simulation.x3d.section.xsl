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
    
    
    
    <xsl:template name="ptn:MFVec3f__x3A__sequence">
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__sequence__x3A__last" required="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__distance" required="no" select="-1"/>
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__local"/>
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__remote"/>
        
        <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text>
        <xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text>
        <xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test="$ptn:MFVec3f__x3A__distance = -1">
                <xsl:value-of select="$ptn:Coordinate_X__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z__x3A__remote"/><xsl:text></xsl:text>
            </xsl:when>
            <xsl:when test="$ptn:MFVec3f__x3A__distance = 0">
                <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text></xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">#364 $ptn:MFVec3f__x3A__distance[ELSE]</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
        
        <xsl:choose>
            <xsl:when test="$ptn:MFVec3f__x3A__sequence__x3A__last = true()"></xsl:when>
            <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template name="ptn:MFVec3f__x3A__section__x3A__sequence">
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__sequence__x3A__last" required="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__distance__x3A__percent" required="no" tunnel="yes"/><!-- 0...1 -->
        <xsl:param name="ptn:MFVec3f__x3A__length" required="yes" tunnel="yes"/><!-- suma  ptn:Input_exec_Time_constant__x3A__analyze -->
        <!-- todo dlugosc -->
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:debug" select="false()"/>
        <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min" select="min($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys//ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position)"/>
        <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_max" select="max($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys//ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position)"/>
        <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count" select="count($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys//ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position)"/>
        
        
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__local"/>
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__remote"/>
        
       <!-- <xsl:variable name="x" select="- $ptn:Coordinate_X + $ptn:Coordinate_X__x3A__remote"/>
        <xsl:variable name="y" select="- $ptn:Coordinate_Y + $ptn:Coordinate_Y__x3A__remote"/>
        <xsl:variable name="z" select="- $ptn:Coordinate_Z + $ptn:Coordinate_Z__x3A__remote"/>-->
      <!--  <xsl:variable name="xt" select="$ptn:Coordinate_X - $x"/>
        <xsl:variable name="yt" select="$ptn:Coordinate_Y - $y"/>
        <xsl:variable name="zt" select="$ptn:Coordinate_Z - $z"/>-->
        <xsl:variable name="percent" select="($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position - $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min ) div   $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/>
        <xsl:variable name="percent_more" select="($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position - $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min + 0.5 ) div   $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/>
        <!--<xsl:text>xt:</xsl:text><xsl:value-of select="$xt"/><xsl:text>  </xsl:text>
        <xsl:text>yt:</xsl:text><xsl:value-of select="$yt"/><xsl:text>  </xsl:text>
        <xsl:text>zt:</xsl:text><xsl:value-of select="$zt"/><xsl:text>  </xsl:text>
        <xsl:text>%:</xsl:text><xsl:value-of select="$percent"/><xsl:text>  </xsl:text>-->
        
        
        <xsl:variable name="Xdiff" select="-$ptn:Coordinate_X + $ptn:Coordinate_X__x3A__remote"/>
        <xsl:variable name="Ydiff" select="-$ptn:Coordinate_Y + $ptn:Coordinate_Y__x3A__remote"/>
        <xsl:variable name="Zdiff" select="-$ptn:Coordinate_Z + $ptn:Coordinate_Z__x3A__remote"/>
        <xsl:variable name="StepDiff" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_max - $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min"/>
        <xsl:variable name="StepMinDiff" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position - $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min"/>
        <xsl:variable name="StepPercent" select="$StepMinDiff div $StepDiff"/>
        <xsl:variable name="StepPercentMore" >
            <xsl:choose>
                <xsl:when test="$StepPercent = 1">
                    <xsl:value-of select="1"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$StepPercent + 1 div $StepDiff"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        
        
        <xsl:if test="$ptn:debug = true() and $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position = 1">
           <!-- <xsl:attribute name="x" select="$x"/>
            <xsl:attribute name="y" select="$y"/>
            <xsl:attribute name="z" select="$z"/>
            <xsl:attribute name="xt" select="$xt"/>
            <xsl:attribute name="yt" select="$yt"/>-->
            <xsl:attribute name="percent" select="$percent"/>
            <xsl:attribute name="percent_more" select="$percent_more"/>
            <xsl:attribute name="Xdiff" select="$Xdiff"/>
            <xsl:attribute name="Ydiff" select="$Ydiff"/>
            <xsl:attribute name="Zdiff" select="$Zdiff"/>
            <xsl:attribute name="MIN" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min"/>
            <xsl:attribute name="MAX" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_max"/>
            <xsl:attribute name="StepDiff" select="$StepDiff"/>
        </xsl:if>
        
        
        <xsl:choose>
            <xsl:when test="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive = true()">
                <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
                
                <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$ptn:debug = true()">
                    <xsl:attribute name="xX1" select="$ptn:Coordinate_X + $Xdiff * $StepPercentMore"/>
                    <xsl:attribute name="xY1" select="$ptn:Coordinate_Y + $Ydiff * $StepPercentMore"/>
                    <xsl:attribute name="xZ1" select="$ptn:Coordinate_Z + $Zdiff * $StepPercentMore"/>
                    <xsl:attribute name="xX2" select="$ptn:Coordinate_X + $Xdiff * $StepPercent"/>
                    <xsl:attribute name="xY2" select="$ptn:Coordinate_Y + $Ydiff * $StepPercent"/>
                    <xsl:attribute name="xZ2" select="$ptn:Coordinate_Z + $Zdiff * $StepPercent"/>
                    <xsl:attribute name="step" select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position"/>
                    <xsl:attribute name="StepMinDiff" select="$StepMinDiff"/>
                    <xsl:attribute name="StepPercent" select="$StepPercent"/>
                    <xsl:attribute name="StepPercentMore" select="$StepPercentMore"/>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="string-length(xs:string($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min)) = 0">
                        <xsl:message terminate="yes">#502 [ERROR] incorrect data of $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys[MIN][<xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min"/>]  [count[<xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/>]]</xsl:message>
                        <xsl:text>#510 ERR POS(</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position"/><xsl:text>) </xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:value-of select="$ptn:Coordinate_X + $Xdiff * $StepPercent"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y + $Ydiff * $StepPercent"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z + $Zdiff * $StepPercent"/><xsl:text> </xsl:text>
                
                <xsl:value-of select="$ptn:Coordinate_X + $Xdiff * $StepPercentMore"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y + $Ydiff * $StepPercentMore"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z + $Zdiff * $StepPercentMore"/><xsl:text> </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
       
        <!--<xsl:text>(</xsl:text><xsl:value-of select="$percent"/><xsl:text>)[</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position"/><xsl:text>][</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active"/><xsl:text>]</xsl:text>
        <xsl:text>*{min:</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min"/><xsl:text>}{</xsl:text>
        <xsl:text>{max:</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_max"/><xsl:text>}{</xsl:text>
        <xsl:text>{cnt:</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/><xsl:text>}*  </xsl:text>-->
        <!-- 1,3,2 (to)..... -5,0,4 (t1)-->
        <!-- -6,-3,-2 -->
        <!-- r t 1,3,2) + t -6 -3 -2 -->
        <!-- tx = I -6t 
        y= 3-3t
        z = 2+2t
        -->
        
        <xsl:choose>
            <xsl:when test="$ptn:MFVec3f__x3A__sequence__x3A__last = true()"></xsl:when>
            <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="ptn:MFVec3f__x3A__section__x3A__sequence_debug">
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__sequence__x3A__last" required="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__distance__x3A__percent" required="no" tunnel="yes"/><!-- 0...1 -->
        <xsl:param name="ptn:MFVec3f__x3A__length" required="yes" tunnel="yes"/><!-- suma  ptn:Input_exec_Time_constant__x3A__analyze -->
        <!-- todo dlugosc -->
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" required="yes" tunnel="yes"/>
        <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min" select="min($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys//ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position)"/>
        <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_max" select="max($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys//ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position)"/>
        <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count" select="count($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys//ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position)"/>
        
        <xsl:choose>
            <xsl:when test="string-length(xs:string($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min)) = 0">
                <xsl:message terminate="no">#502 incorrect data of $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys[MIN][<xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min"/>]</xsl:message>
                <xsl:text>#510 ERR POS(</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position"/><xsl:text>) </xsl:text>
            </xsl:when>
        </xsl:choose>
        
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__local"/>
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__remote"/>
        
        <xsl:variable name="x" select="- $ptn:Coordinate_X + $ptn:Coordinate_X__x3A__remote"/>
        <xsl:variable name="y" select="- $ptn:Coordinate_Y + $ptn:Coordinate_Y__x3A__remote"/>
        <xsl:variable name="z" select="- $ptn:Coordinate_Z + $ptn:Coordinate_Z__x3A__remote"/>
        <xsl:variable name="xt" select="$ptn:Coordinate_X - $x"/>
        <xsl:variable name="yt" select="$ptn:Coordinate_Y - $y"/>
        <xsl:variable name="zt" select="$ptn:Coordinate_Z - $z"/>
        <xsl:variable name="percent" select="($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position - $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min ) div   $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/>
        <xsl:variable name="percent_more" select="($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position - $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min + 0.5 ) div   $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/>
        <xsl:text>xt:</xsl:text><xsl:value-of select="$xt"/><xsl:text>  </xsl:text>
        <xsl:text>yt:</xsl:text><xsl:value-of select="$yt"/><xsl:text>  </xsl:text>
        <xsl:text>zt:</xsl:text><xsl:value-of select="$zt"/><xsl:text>  </xsl:text>
        <xsl:text>%[(</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position"/><xsl:text>-</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min"/><xsl:text>) div </xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/><xsl:text>]</xsl:text>
        <xsl:text>%:</xsl:text><xsl:value-of select="$percent"/><xsl:text>  </xsl:text>
        <xsl:choose>
            <xsl:when test="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive = true()">
                <xsl:value-of select="$ptn:Coordinate_X__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z__x3A__remote"/><xsl:text> </xsl:text>
                
                <xsl:value-of select="$ptn:Coordinate_X__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z__x3A__remote"/><xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ptn:Coordinate_X - $xt * $percent"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y - $yt * $percent"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z - $zt * $percent"/><xsl:text> </xsl:text>
                
                <xsl:value-of select="$ptn:Coordinate_X - $xt * $percent_more"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y - $yt * $percent_more"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z - $zt * $percent_more"/><xsl:text> </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        
        <!--<xsl:text>(</xsl:text><xsl:value-of select="$percent"/><xsl:text>)[</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position"/><xsl:text>][</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active"/><xsl:text>]</xsl:text>
        <xsl:text>*{min:</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min"/><xsl:text>}{</xsl:text>
        <xsl:text>{max:</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_max"/><xsl:text>}{</xsl:text>
        <xsl:text>{cnt:</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/><xsl:text>}*  </xsl:text>-->
        <!-- 1,3,2 (to)..... -5,0,4 (t1)-->
        <!-- -6,-3,-2 -->
        <!-- r t 1,3,2) + t -6 -3 -2 -->
        <!-- tx = I -6t 
        y= 3-3t
        z = 2+2t
        -->
        
        <xsl:choose>
            <xsl:when test="$ptn:MFVec3f__x3A__sequence__x3A__last = true()"></xsl:when>
            <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template name="ptn:MFColor__x3A__sequence">
        <xsl:param name="ptn:MFColor__x3A__R" required="yes" />
        <xsl:param name="ptn:MFColor__x3A__G" required="yes" />
        <xsl:param name="ptn:MFColor__x3A__B" required="yes" />
        <xsl:param name="ptn:MFColor__x3A__sequence__x3A__last" required="yes"/>
        <xsl:param name="ptn:MFColor__x3A__sequence__x3A__debug" select="false()"/>
        
        <xsl:choose>
            <xsl:when test="$ptn:MFColor__x3A__sequence__x3A__debug = true()">
                <xsl:attribute name="ptn:MFColor__x3A__R" select="$ptn:MFColor__x3A__R"/>
                <xsl:attribute name="ptn:MFColor__x3A__G" select="$ptn:MFColor__x3A__G"/>
                <xsl:attribute name="ptn:MFColor__x3A__B" select="$ptn:MFColor__x3A__B"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ptn:MFColor__x3A__R"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:MFColor__x3A__G"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:MFColor__x3A__B"/><xsl:text> </xsl:text>
                <xsl:choose>
                    <xsl:when test="$ptn:MFColor__x3A__sequence__x3A__last = true()"></xsl:when>
                    <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    
    <xsl:template name="ptn:MFColor__x3A__sequence__x3A__dynamic">
        <xsl:param name="ptn:MFColor__x3A__R" required="yes" />
        <xsl:param name="ptn:MFColor__x3A__G" required="yes" />
        <xsl:param name="ptn:MFColor__x3A__B" required="yes" />
        <xsl:param name="ptn:MFColor__x3A__sequence__x3A__last" required="yes"/>
        <xsl:param name="ptn:Simulated_potential__x3A__min" required="yes"/>
        <xsl:param name="ptn:Simulated_potential__x3A__max" required="yes"/>
        <xsl:param name="ptn:Simulated_potential__x3A__current" required="yes"/>
        <xsl:param name="ptn:MFColor__x3A__sequence__x3A__dynamic__x3A__debug" select="false()"/>
        <xsl:choose>
            <xsl:when test="string-length(xs:string($ptn:Simulated_potential__x3A__min)) = 0 ">
                <xsl:message terminate="yes">#596 [ERROR][EMPTY][$ptn:Simulated_potential__x3A__min[<xsl:value-of select="$ptn:Simulated_potential__x3A__min"/>]]   [$ptn:Simulated_potential__x3A__current[<xsl:value-of select="$ptn:Simulated_potential__x3A__current"/>]]</xsl:message>
            </xsl:when>
        </xsl:choose>
        <xsl:variable name="ptn:Simulated_potential__x3A__diff_val"     select="$ptn:Simulated_potential__x3A__current - $ptn:Simulated_potential__x3A__min"/>
        <xsl:variable name="ptn:Simulated_potential__x3A__diff_min_max" select="$ptn:Simulated_potential__x3A__max - $ptn:Simulated_potential__x3A__min"/>
        <xsl:variable name="ptn:Simulated_potential__x3A__percent" >
            <xsl:choose>
                <xsl:when test="$ptn:Simulated_potential__x3A__diff_val = 0">
                    <xsl:value-of select="0.5"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="format-number(($ptn:Simulated_potential__x3A__diff_val div $ptn:Simulated_potential__x3A__diff_min_max),'0.00')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$ptn:MFColor__x3A__sequence__x3A__dynamic__x3A__debug = true()">
                <xsl:attribute name="ptn:MFColor__x3A__R" select="$ptn:Simulated_potential__x3A__percent"/>
                <xsl:attribute name="ptn:MFColor__x3A__G" select="$ptn:Simulated_potential__x3A__percent"/>
                <xsl:attribute name="ptn:MFColor__x3A__B" select="$ptn:Simulated_potential__x3A__percent"/>
                <xsl:attribute name="ptn:Simulated_potential__x3A__current" select="$ptn:Simulated_potential__x3A__current"/>
                <xsl:attribute name="ptn:Simulated_potential__x3A__min" select="$ptn:Simulated_potential__x3A__min"/>
                <xsl:attribute name="ptn:Simulated_potential__x3A__max" select="$ptn:Simulated_potential__x3A__max"/>
                <xsl:attribute name="ptn:Simulated_potential__x3A__diff_val" select="$ptn:Simulated_potential__x3A__diff_val"/>
                <xsl:attribute name="ptn:Simulated_potential__x3A__diff_min_max" select="$ptn:Simulated_potential__x3A__diff_min_max"/>
                <xsl:attribute name="ptn:Simulated_potential__x3A__percent" select="$ptn:Simulated_potential__x3A__percent"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ptn:Simulated_potential__x3A__percent"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Simulated_potential__x3A__percent"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Simulated_potential__x3A__percent"/><xsl:text> </xsl:text>
                <xsl:choose>
                    <xsl:when test="$ptn:MFColor__x3A__sequence__x3A__last = true()"></xsl:when>
                    <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
       
    </xsl:template>
    
    
    
    <xsl:template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__local">
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:if test="string-length($ptn:Coordinate_X) = 0"><xsl:message terminate="yes">#63X ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
        <xsl:if test="string-length($ptn:Coordinate_Y) = 0"><xsl:message terminate="yes">#63Y ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
        <xsl:if test="string-length($ptn:Coordinate_Z) = 0"><xsl:message terminate="yes">#63Z ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
    </xsl:template>
    
    <xsl:template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__remote">
        <xsl:param name="ptn:Coordinate_X" required="no" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="no" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="no" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:if test="string-length($ptn:Coordinate_X__x3A__remote) = 0"><xsl:message terminate="yes">#63XX ERROR Current_synapse.Input.Shape with data  [<xsl:value-of select="$ptn:Coordinate_X"/>][<xsl:value-of select="$ptn:Coordinate_Y"/>][<xsl:value-of select="$ptn:Coordinate_Z"/>]TO-[<xsl:value-of select="$ptn:Coordinate_X__x3A__remote"/>][<xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/>][<xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/>]</xsl:message></xsl:if>
        <xsl:if test="string-length($ptn:Coordinate_Y__x3A__remote) = 0"><xsl:message terminate="yes">#63YY ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
        <xsl:if test="string-length($ptn:Coordinate_Z__x3A__remote) = 0"><xsl:message terminate="yes">#63ZZ ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
    </xsl:template>
    
</xsl:stylesheet>