<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Simulation_body">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:variable name="ptn:Simulation.attract__x3A__calculate.best.unique">
                <xsl:call-template name="ptn:Simulation.attract__x3A__calculate.best.unique"/>
            </xsl:variable>
            <xsl:copy-of select="$ptn:Simulation.attract__x3A__calculate.best.unique"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulation.attract__x3A__calculate.best.unique" select="$ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes"/>
                <!-- todo choose best only attracts  -->
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="*">
        <xsl:message terminate="yes">#29M unintended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Receptors|ptn:Nodes">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Receptor[ptn:Label]">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Simulated_potential|ptn:Receptor_regex_filter|ptn:Output_Node|ptn:Current_synapse">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Outputs">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <!--<xsl:param name="ptn:Label" tunnel="yes" required="yes"/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" select="$ptn:Simulation.attract__x3A__calculate.best.unique"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Attract__x3A__flag">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:comment>#59 TODO handle this flag when created model stale flag that was used</xsl:comment>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Simulation.attract__x3A__calculate">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:comment>#58M bypassed/n[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="text()">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    
    <xsl:template name="ptn:Simulation.attract__x3A__calculate.best.unique">
        <xsl:variable name="ptn:Simulation.attract__x3A__calculate.best.unique">
            <ptn:Simulation.attract__x3A__calculate.best.unique>
                <xsl:for-each-group select="descendant-or-self::ptn:Simulation.attract__x3A__calculate[number(@ptn:Simulated_potential__x3A__diff) &gt; 0 ]" group-by="@ptn:Label">
                    <xsl:sort select="@ptn:Distance" data-type="number" order="ascending"/>
                    <xsl:copy>
                        <xsl:attribute name="ptn:Simulation.attract__x3A__calculate.best.unique.position" select="position()"/>
                        <!--<xsl:attribute name="prec_silb" select="current()/preceding-sibling::ptn:Simulation.attract__x3A__calculate/@ptn:Label"/>--><!-- and not(current()/preceding-sibling::ptn:Simulation.attract__x3A__calculate/@ptn:Label__x3A__context = current()/@ptn:Label) -->
                        <xsl:copy-of select="@*"/>
                    </xsl:copy>
                </xsl:for-each-group>
            </ptn:Simulation.attract__x3A__calculate.best.unique>
        </xsl:variable>
        <ptn:Simulation.attract__x3A__calculate.best.unique>
            <xsl:for-each select="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/*">
                <xsl:variable name="ptn:Simulation.attract__x3A__calculate.best.unique.position" select="@ptn:Simulation.attract__x3A__calculate.best.unique.position"/>
                <xsl:choose>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/*[@ptn:Label__x3A__context = current()/@ptn:Label and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <xsl:comment>#67 ignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </ptn:Simulation.attract__x3A__calculate.best.unique>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate.best.unique">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="ptn:Simulation.attract__x3A__calculate">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:choose>
            <xsl:when test="$ptn:Label = @ptn:Label__x3A__context">
                <ptn:Current_synapse>
                    <ptn:Output_Node><xsl:value-of select="@ptn:Label"/></ptn:Output_Node>
                </ptn:Current_synapse>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="*">
        <xsl:message terminate="yes">#123M unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
</xsl:stylesheet>