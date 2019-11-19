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
                <xsl:with-param name="ptn:Defaults" select="doc($ptn:Config)//ptn:Defaults" tunnel="yes"/>
                <!-- todo choose best only attracts  -->
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="*">
        <xsl:message terminate="yes">#29M unintended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Receptors">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Nodes">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" select="$ptn:Simulation.attract__x3A__calculate.best.unique"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Receptor[ptn:Label]|ptn:Leaky_neuron_standard[ptn:Label]">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Simulated_potential|ptn:Receptor_regex_filter|ptn:Current_synapse">
        <xsl:param name="ptn:Simulation.attract__x3A__calculate.best.unique" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.xml" match="ptn:Output_Node|ptn:Maximum_current|ptn:Time_constant|ptn:Delay">
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
            <xsl:for-each select="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate">
                <xsl:variable name="ptn:Simulation.attract__x3A__calculate.best.unique.position" select="@ptn:Simulation.attract__x3A__calculate.best.unique.position"/>
                
                <xsl:choose>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context = current()/@ptn:Label and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <xsl:comment>#67Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>
                        <xsl:message>#67Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:message>
                    </xsl:when>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context = current()/@ptn:Label__x3A__context and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <xsl:comment>#111Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>
                        <xsl:message>#111Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:message>
                    </xsl:when>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context = current()/@ptn:Label__x3A__context and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <xsl:comment>#131Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>
                        <xsl:message>#131Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:message>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:copy-of select="@*"/>
                            <xsl:attribute name="debug128" select="concat(@ptn:Label__x3A__context,'to',@ptn:Label)"/>
                            <!--<xsl:attribute name="debug.Output_Node" select="$ptn:Output_Node"/>-->
                            <xsl:copy-of select="text()"/>
                            <xsl:copy-of select="*"/>
                        </xsl:copy>
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
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <xsl:choose>
            <xsl:when test="$ptn:Label = @ptn:Label__x3A__context">
                <ptn:Current_synapse>
                    <ptn:Maximum_current><xsl:value-of select="$ptn:Defaults/ptn:Maximum_current"/></ptn:Maximum_current>
                    <ptn:Time_constant><xsl:value-of select="$ptn:Defaults/ptn:Time_constant"/></ptn:Time_constant>
                    <ptn:Delay><xsl:value-of select="$ptn:Defaults/ptn:Delay"/></ptn:Delay>
                    <!--<ptn:Output_Node><xsl:value-of select="@ptn:Label"/></ptn:Output_Node>-->
                    <xsl:call-template name="ptn:Output_Node"/>
                </ptn:Current_synapse>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
  
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Current_synapse__x3A__install" match="*">
        <xsl:message terminate="yes">#123M unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template name="ptn:Output_Node">
        <ptn:Output_Node>
            <xsl:apply-templates mode="ptn:Output_Node" select="."/>
        </ptn:Output_Node>
    </xsl:template>
    
    <xsl:template mode="ptn:Output_Node" match="*">
        <xsl:message terminate="yes">#161M unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Output_Node" match="ptn:Simulation.attract__x3A__calculate[@ptn:Label]">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:value-of select="@ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="$ptn:Label"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Output_Node" match="ptn:Receptor[ptn:Label]">
        <xsl:param name="ptn:Label" tunnel="yes" required="yes"/>
        <xsl:value-of select="ptn:Label"/><xsl:text>-to-</xsl:text><xsl:value-of select="$ptn:Label"/>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="*">
        <xsl:message terminate="yes">#209M Unantended[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate.best.unique">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__calculate.best.unique__x3A__Nodes__x3A__install" match="ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context][@ptn:Label]">
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <xsl:variable name="ptn:Output_Node">
            <xsl:call-template name="ptn:Output_Node">
                <xsl:with-param name="ptn:Label" select="@ptn:Label__x3A__context" tunnel="yes"/>
            </xsl:call-template>            
        </xsl:variable>
        <xsl:copy>
            <xsl:attribute name="debug.222.Output_Node" select="$ptn:Output_Node"/>
            <xsl:copy-of select="text()"/>
            <xsl:copy-of select="*"></xsl:copy-of>
        </xsl:copy>
        <ptn:Leaky_neuron_standard debug.todo="another context than default">
            <ptn:Label><xsl:value-of select="$ptn:Output_Node"/></ptn:Label>
            <ptn:Coordinate_X>/2</ptn:Coordinate_X>
            <ptn:Coordinate_Y>+10</ptn:Coordinate_Y>
            <ptn:Capacitance>0.8</ptn:Capacitance>
        </ptn:Leaky_neuron_standard>
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>