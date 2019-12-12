<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    xmlns:p5suis="http://biuro.biall-net.pl/xmlschema_procesy5/WPS_Functions/system_ui_info_speech/system_ui_info_speech.xsd"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    
    <xsl:template name="ptn:Input__x3A__attract__x3A__vectors__x3A__calculate">
        <xsl:param name="ptn:Input__x3A__nodes" required="yes" tunnel="yes"/><!-- input nodes to calculate exit vector -->
        <xsl:param name="ptn:Stress__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Attract__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment" tunnel="yes" select="0"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio" tunnel="yes" select="1"/>
        <xsl:param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.offset" select="0" tunnel="yes"/>
        <xsl:param name="ptn:Leaky_neuron_inhibitor__x3A__AB" tunnel="yes" select="false()"/>
        <xsl:param name="ptn:Leaky_neuron_inhibitor__X3A__AA" tunnel="yes" select="false()"/>
        <xsl:param name="ptn:Leaky_neuron_standard" tunnel="yes" select="false()"/>
        <xsl:param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ignore_null" tunnel="yes" select="false()"/>
        <xsl:param name="ptn:Simulation.Stress__x3A__calculate" select="false()" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.attract__x3A__calculate" select="false()" tunnel="yes"/>
        <ptn:Input__x3A__attract__x3A__vectors__x3A__calculate 
            ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio="{$ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio}">
            <xsl:choose><!-- p5suis:say.PL="Tworzę obliczenia pozycji dla węzła zależnego od {$ptn:Input__x3A__nodes//ptn:Input__x3A__node}" -->
                <xsl:when test="count($ptn:Input__x3A__nodes//ptn:Input__x3A__node) = 1 and not($ptn:Leaky_neuron_inhibitor__x3A__AB) and not($ptn:Leaky_neuron_inhibitor__X3A__AA) and $ptn:Leaky_neuron_standard and not($ptn:Simulation.attract__x3A__calculate)">
                              <!--<xsl:call-template name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/>
                              <xsl:call-template name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/>
                              <xsl:call-template name="ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/>-->
                                <xsl:call-template name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
                                    <xsl:with-param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.offset" select="0.4" tunnel="yes"/>
                                </xsl:call-template>
                              <!--<ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate><xsl:value-of select="$ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector"/></ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>-->
                                <xsl:call-template name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
                                    <xsl:with-param name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment" select="10" tunnel="yes"/>
                                </xsl:call-template>
                            <xsl:call-template name="ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/>
                              <!--<ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate><xsl:value-of select="$ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector"/></ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>-->
                              <!--<ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment>10</ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment>-->
                              <!--<ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate><xsl:value-of select="$ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector"/></ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>-->
                          </xsl:when>
                <xsl:when test="count($ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]) = 2 and not($ptn:Leaky_neuron_inhibitor__x3A__AB) and not($ptn:Leaky_neuron_inhibitor__X3A__AA) and $ptn:Leaky_neuron_standard and $ptn:Simulation.attract__x3A__calculate">
                            <xsl:comment>#39 [cnt[<xsl:value-of select="count($ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ])"/>]]   cnt2[<xsl:value-of select="count($ptn:Attract__x3A__flag.nodes//*[ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]])"/>]</xsl:comment>
                            <xsl:call-template name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
                                <xsl:with-param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.offset" select="0.5" tunnel="yes"/>
                                <xsl:with-param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ignore_null" select="true()" tunnel="yes"/>
                            </xsl:call-template>
                            <xsl:call-template name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
                                <xsl:with-param name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment" select="9" tunnel="yes"/>
                            </xsl:call-template>
                            <xsl:call-template name="ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/>
                            <!--<ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate ptn:debug="#42 todo attract vectors #cnt[{count($ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ])}]  Attract[Labels][{$ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]}]"><xsl:value-of select="$ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector"/></ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                            <ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate><xsl:value-of select="$ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector"/></ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                            <ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate><xsl:value-of select="$ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector"/></ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>-->
                </xsl:when>
                        <xsl:when test="count($ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]) = 1 and $ptn:Leaky_neuron_inhibitor__x3A__AB">
                            <xsl:comment>#39 [cnt[<xsl:value-of select="count($ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ])"/>]]   cnt2[<xsl:value-of select="count($ptn:Attract__x3A__flag.nodes//*[ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]])"/>]</xsl:comment>
                            <xsl:call-template name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
                                <xsl:with-param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.offset" select="0.866" tunnel="yes"/>
                                <xsl:with-param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ignore_null" select="true()" tunnel="yes"/>
                            </xsl:call-template>
                            <xsl:call-template name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
                                <xsl:with-param name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment" select="10" tunnel="yes"/>
                            </xsl:call-template>
                            <xsl:call-template name="ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/>
                        </xsl:when>
                <xsl:when test="count($ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]) = 1 and $ptn:Leaky_neuron_inhibitor__X3A__AA">
                    <xsl:comment>#39 [cnt[<xsl:value-of select="count($ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ])"/>]]   cnt2[<xsl:value-of select="count($ptn:Attract__x3A__flag.nodes//*[ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]])"/>]</xsl:comment>
                    <xsl:call-template name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
                        <xsl:with-param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.offset" select="0.2" tunnel="yes"/>
                    </xsl:call-template>
                    <xsl:call-template name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
                        <xsl:with-param name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment" select="11" tunnel="yes"/>
                    </xsl:call-template>
                    <xsl:call-template name="ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/>
                </xsl:when>
                          <xsl:otherwise>
                              <xsl:message terminate="yes">#20 [Not implemented] only signle input now</xsl:message>
                          </xsl:otherwise>
                      </xsl:choose>
                      <!-- wektor XYZ z inputow przeciwny lub  -->
                     <!-- ze stress tez attract -->
                     <!-- else attract vector  -->
               </ptn:Input__x3A__attract__x3A__vectors__x3A__calculate>
    </xsl:template>
    
    
    <xsl:template name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
        <xsl:param name="ptn:Stress__x3A__flag.nodes" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Attract__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input__x3A__nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Label"/>
        <xsl:param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.offset" select="0" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ignore_null" tunnel="yes" select="false()"/>
        <xsl:param name="ptn:Simulation.Stress__x3A__calculate" tunnel="yes" select="false()"/>
        <xsl:param name="ptn:Simulation.attract__x3A__calculate" tunnel="yes" select="false()"/>
        
        <xsl:choose>
            <xsl:when test="$ptn:Simulation.Stress__x3A__calculate">
                <xsl:for-each select="$ptn:Stress__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]">
                    <xsl:choose>
                        <xsl:when test="$ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ignore_null and following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector = 0"/>
                        <xsl:otherwise>
                            <ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                                <xsl:value-of select="following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector"/>
                            </ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$ptn:Simulation.attract__x3A__calculate">
                <xsl:for-each select="$ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]">
                    <xsl:choose>
                        <xsl:when test="$ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ignore_null and following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector = 0"/>
                        <xsl:otherwise>
                            <ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                                <xsl:value-of select="following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector"/>
                            </ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">#134 [unantended]</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
                
        <xsl:if test="$ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.offset">
            <ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                <xsl:value-of select="$ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.offset"/>
            </ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
        <xsl:param name="ptn:Stress__x3A__flag.nodes" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Attract__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input__x3A__nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.Stress__x3A__calculate" tunnel="yes" select="false()"/>
        <xsl:param name="ptn:Simulation.attract__x3A__calculate" tunnel="yes" select="false()"/>
        <xsl:choose>
            <xsl:when test="$ptn:Simulation.Stress__x3A__calculate">
                <xsl:for-each select="$ptn:Stress__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]">
                    <ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                        <xsl:value-of select="following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector"/>
                    </ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$ptn:Simulation.attract__x3A__calculate">
                <xsl:for-each select="$ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]">
                    <ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                        <xsl:value-of select="following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector"/>
                    </ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">#135 [unantended]</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment">
            <ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment>
                <xsl:value-of select="$ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment"/>
            </ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate">
        <xsl:param name="ptn:Stress__x3A__flag.nodes" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Attract__x3A__flag.nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input__x3A__nodes" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.Stress__x3A__calculate" tunnel="yes" select="false()"/>
        <xsl:param name="ptn:Simulation.attract__x3A__calculate" tunnel="yes" select="false()"/>
        <xsl:choose>
            <xsl:when test="$ptn:Simulation.Stress__x3A__calculate">
                <xsl:for-each select="$ptn:Stress__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]">
                    <ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                        <xsl:value-of select="following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector"/>
                    </ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$ptn:Simulation.attract__x3A__calculate">
                <xsl:for-each select="$ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]">
                    <ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                        <xsl:value-of select="following-sibling::ptn:Input__x3A__attract__x3A__vectors/ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector"/>
                    </ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">#136 [unantended]</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
        
        
        <!--<xsl:for-each select="$ptn:Attract__x3A__flag.nodes//ptn:Input__x3A__node">
            <ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
                <xsl:value-of select="$ptn:Stress__x3A__flag.nodes//ptn:Input__x3A__attract__x3A__vectors[preceding-sibling::ptn:Label = .]/ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector"/>
            </ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate>
        </xsl:for-each>-->
        
    </xsl:template>
    
</xsl:stylesheet>