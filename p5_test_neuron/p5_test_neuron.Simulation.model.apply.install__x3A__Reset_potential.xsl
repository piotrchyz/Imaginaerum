<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    
    <xsl:template name="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential">
        <xsl:param name="ptn:Simulated_potential__x3A__current" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation.attract__x3A__aggregate__x3A__validated" tunnel="yes" required="yes"/>
        <xsl:variable name="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential">
            <ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential>
                <xsl:apply-templates mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" select="$ptn:Simulation.attract__x3A__aggregate__x3A__validated"/>
            </ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential/ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential/ptn:Simulated_potential[@ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential__x3A__installed]">
                <xsl:copy-of select="$ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential/ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential/ptn:Simulated_potential[1][@ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential__x3A__installed]"/>
                <xsl:choose>
                    <xsl:when test="$ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential/ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential/ptn:Simulated_potential[2][@ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential__x3A__installed]">
                        <xsl:message>#167GG [install__x3A__Reset_potential][TODO][TOO MANY NODES NOT UNIQE]</xsl:message>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$ptn:Simulated_potential__x3A__current"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="*">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:comment>#167A[install__x3A__Reset_potential][n][<xsl:value-of select="name()"/>]    [ptn:Label[<xsl:value-of select="$ptn:Label"/>]]</xsl:comment>
        <xsl:message terminate="yes">#167A[install__x3A__Reset_potential] [unantended[n][<xsl:value-of select="name()"/>][ptn:Label[<xsl:value-of select="$ptn:Label"/>]]</xsl:message>
    </xsl:template>
    
    
    
    
                                                                                                   
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Simulation.attract__x3A__aggregate__x3A__validated">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
                                                                                                   
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Simulation.attract__x3A__calculate__x3A__validated[@ptn:Output_Node__x3A__attract][@ptn:Label__x3A__context]|ptn:Simulation.Stress__x3A__calculate__x3A__validated[@ptn:Output_Node__x3A__attract][@ptn:Label__x3A__context]">
        <xsl:param name="ptn:Simulation.model.validate.xml__x3A__stats" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>
        <xsl:choose>
            <xsl:when test="number(@ptn:Simulated_potential__x3A__diff) &lt; 0">
                <xsl:comment>#167D [Reset_potential] bypassed due to number(@ptn:Simulated_potential__x3A__diff) &lt; 0 [<xsl:value-of select="@ptn:Label__x3A__context"/>]</xsl:comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>
                    #167F [Reset_potential] number(@ptn:Simulated_potential__x3A__diff) &lt; 0 [<xsl:value-of select="@ptn:Label__x3A__context"/>]
                    n[<xsl:value-of select="*/name()"/>]
                </xsl:comment>
                <xsl:apply-templates mode="#current">
                    <xsl:with-param name="ptn:Output_Node__x3A__attract" select="@ptn:Output_Node__x3A__attract" tunnel="yes"/>
                    <xsl:with-param name="ptn:Label__x3A__context" tunnel="yes" select="@ptn:Label__x3A__context"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!--<xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[ptn:Label]">
        <xsl:param name="ptn:Simulation.model.validate.xml__x3A__stats" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:comment>#167B[install__x3A__Reset_potential][n][<xsl:value-of select="name()"/>][ptn:Label[<xsl:value-of select="$ptn:Label"/>]]</xsl:comment>
    </xsl:template>-->
    
    
    
    
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential"
        match="ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated[ptn:Label][ptn:Reset_potential][ptn:Input__x3A__nodes]|ptn:Simulation.Stress__x3A__calculate__x3A__output_node__x3A__validated">
        <xsl:param name="ptn:Simulation.model.validate.xml__x3A__stats" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <!--<xsl:param name="ptn:Defaults" tunnel="yes" required="yes"/>-->
        <xsl:comment>#167B[install__x3A__Reset_potential][n][<xsl:value-of select="name()"/>][ptn:Label[<xsl:value-of select="$ptn:Label"/>]]</xsl:comment>
        <!--<xsl:message>#112[m][<xsl:value-of select="name()"/>]</xsl:message>-->
        <xsl:apply-templates mode="#current"  >
            <xsl:with-param name="ptn:Reset_potential"  select="ptn:Reset_potential"  tunnel="yes"/>
        </xsl:apply-templates>
        
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Input__x3A__nodes">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Input__x3A__node">
        <xsl:param name="ptn:Label"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Reset_potential"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Label__x3A__context" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulated_potential__x3A__current" required="yes" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="text() = $ptn:Label">
                <ptn:Simulated_potential ptn:Simulated_potential__x3A__current="{$ptn:Simulated_potential__x3A__current}"  ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential__x3A__installed="{true()}">
                    <xsl:value-of select="$ptn:Reset_potential"/>
                </ptn:Simulated_potential>
            </xsl:when>
            <xsl:otherwise>
                
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z"/>
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage"/>
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Maximum_voltage|ptn:Resting_potential"/>
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Reset_potential|ptn:Firing_threshold|ptn:Input__x3A__nodes__x3A__prohibit"/>
    <xsl:template mode="ptn:Simulation.model.apply.xml__x3A__install__x3A__Reset_potential" match="ptn:Refactory_period|ptn:Is_inhibitor|ptn:Outputs|ptn:Simulated_potential"/>
   
    
    
    
</xsl:stylesheet>