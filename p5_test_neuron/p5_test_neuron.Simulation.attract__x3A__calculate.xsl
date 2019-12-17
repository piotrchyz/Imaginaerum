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
    
    
    <xsl:template name="ptn:Capacitance__x3A__attract__x3A__calculate">
        <!--<xsl:param name="ptn:Self_Node__x3A__attract" select="ptn:Label" tunnel="yes"/>-->
        <xsl:param name="ptn:Output_Node__x3A__attract" required="yes" tunnel="yes"/><!-- attracted new node -->
        <xsl:param name="ptn:Capacitance" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio" select="1.2" tunnel="yes"/>
        <xsl:param name="ptn:Input__x3A__nodes" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Leaky_neuron_standard" tunnel="yes" select="false()"/>
        <xsl:param name="ptn:Stress__x3A__flag.nodes" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Attract__x3A__flag.nodes" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation.attract__x3A__calculate" required="no" select="false()" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.Stress__x3A__calculate" required="no" select="false()" tunnel="yes"/>
        <ptn:Capacitance__x3A__calculate__x3A__empty/>
        <ptn:Capacitance__x3A__attract__x3A__calculate>
            <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node__x3A__attract"/>
            <!--<xsl:attribute name="ptn:Self_Node__x3A__attract" select="$ptn:Self_Node__x3A__attract"/>-->                
            <!--<ptn:Capacitance__x3A__attract__x3A__calculate__x3A__output_node ptn:debug="#268A _give_own__x3A__ratio=[{$ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio}]">
                <xsl:value-of select="((ptn:Capacitance + $ptn:Capacitance)) div 2 * $ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio"/></ptn:Capacitance__x3A__attract__x3A__calculate__x3A__output_node>-->
            <xsl:choose>
                <xsl:when test="$ptn:Simulation.Stress__x3A__calculate">
                    <xsl:apply-templates mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__input_node" select="$ptn:Stress__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]">
                        <xsl:with-param name="ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio" select="$ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="$ptn:Simulation.attract__x3A__calculate">
                    <xsl:apply-templates mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__input_node" select="$ptn:Attract__x3A__flag.nodes//ptn:Label[ text() =  $ptn:Input__x3A__nodes//ptn:Input__x3A__node/text() ]">
                        <xsl:with-param name="ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio" select="$ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes">#134X [unantended]</xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </ptn:Capacitance__x3A__attract__x3A__calculate>
        
        
        <!--<ptn:Capacitance__x3A__attract__x3A__calculate__x3A__self_node ptn:debug="#268B_ _give_own__x3A__ratio=[{$ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio}]">
            <xsl:attribute name="ptn:Output_Node__x3A__attract" select="$ptn:Output_Node__x3A__attract"/>
            <xsl:attribute name="ptn:Self_Node__x3A__attract" select="$ptn:Self_Node__x3A__attract"/>
            <xsl:value-of select="((ptn:Capacitance + $ptn:Capacitance)) div 2 div $ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio"/>
        </ptn:Capacitance__x3A__attract__x3A__calculate__x3A__self_node>-->
        
    </xsl:template>
    
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__input_node" match="ptn:Label[following-sibling::ptn:Capacitance]">
        <xsl:param name="ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio" required="yes" tunnel="yes"/>
        <ptn:Capacitance__x3A__attract__x3A__calculate__x3A__input_node>
            <xsl:attribute name="ptn:Label__x3A__context" select="."/>
            <xsl:attribute name="ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio" select="$ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio"/>
            <xsl:value-of select="following-sibling::ptn:Capacitance"/>
        </ptn:Capacitance__x3A__attract__x3A__calculate__x3A__input_node>
    </xsl:template>
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__input_node" match="*">
        <xsl:message terminate="yes">#62 unantended[n][<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template name="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert">
        <xsl:apply-templates mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" match="ptn:Capacitance[following-sibling::ptn:Simulation.attract__x3A__calculate[ptn:Simulation.attract__x3A__calculate__x3A__output_node[ptn:Capacitance__x3A__attract__x3A__calculate]]]">
        <xsl:apply-templates mode="#current" select="following-sibling::ptn:Simulation.attract__x3A__calculate"/>
    </xsl:template>
                                                                                                           
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" match="ptn:Capacitance[following-sibling::ptn:Simulation.Stress__x3A__calculate[ptn:Simulation.Stress__x3A__calculate__x3A__output_node[ptn:Capacitance__x3A__attract__x3A__calculate]]]">
        <xsl:message terminate="no">#81 testomg [<xsl:value-of select="name()"/>]  [ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert[stress]]</xsl:message>
        <xsl:apply-templates mode="#current" select="following-sibling::ptn:Simulation.Stress__x3A__calculate"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" match="ptn:Simulation.attract__x3A__calculate|ptn:Simulation.Stress__x3A__calculate">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node|ptn:Simulation.Stress__x3A__calculate__x3A__output_node">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" match="ptn:Capacitance__x3A__attract__x3A__calculate">
        <!--<xsl:apply-templates mode="#current"/>-->
        <ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:debug">#86 mdoe ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert on [n][<xsl:value-of select="name()"/>]</xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert>
    </xsl:template>
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" match="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__input_node">
        <xsl:param name="ptn:Label" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" match="ptn:Capacitance">
        <xsl:comment>100 todo implement [ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert] [on][<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" match="ptn:Label|
        ptn:Coordinate_X__calculate__x3A__empty|
        Coordinate_Y__calculate__x3A__empty|
        Coordinate_Z__calculate__x3A__empty|
        ptn:Coordinate_Y__calculate__x3A__empty|ptn:Coordinate_Z__calculate__x3A__empty|
        ptn:Capacitance__x3A__calculate__x3A__empty|ptn:Resistance|ptn:Minimum_voltage|
        ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|
        ptn:Refactory_period|ptn:Is_inhibitor|ptn:Outputs|ptn:Input__x3A__nodes|
        ptn:Simulated_potential|ptn:Input__x3A__attract__x3A__vectors__x3A__calculate|
        ptn:Input__x3A__attract__x3A__vectors__calculate__x3A__empty|
        ptn:Input__x3A__nodes__x3A__prohibit|ptn:Input__x3A__attract__x3A__vectors__x3A__calculate"/>
        
    
    
    <xsl:template mode="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert" match="*">
        <xsl:message terminate="yes">#99X unantended[n][<xsl:value-of select="name()"/>]   [following[<xsl:value-of select="following-sibling::*[position() &lt; 3]/name()"/>]]</xsl:message>
    </xsl:template>
    
    
</xsl:stylesheet>