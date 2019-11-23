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
    
    <!-- {p5_test_neuron}Simulation.model.stats.xml -->
    
    <xsl:template mode="ptn:Simulation.model.stats.xml" match="ptn:Simulation.model.xml">
        <xsl:message>#16VV [ptn:Simulation.model.validate.xml] - just validate</xsl:message>
        <ptn:Simulation.model.stats.xml>
            <xsl:copy-of select="namespace::*"/>
            <xsl:copy-of select="@*"/>
            <xsl:call-template name="ptn:Simulation.model.validate.xml__x3A__stats"/>
            <!--<xsl:copy-of select="$ptn:Simulation.model.validate.xml__x3A__stats"/>-->
            <!--<xsl:copy-of select="*"/>-->
            <xsl:apply-templates mode="ptn:Simulation.model.stats.xml__x3A__generate-id"/>
        </ptn:Simulation.model.stats.xml>
        
    </xsl:template>
    
    
    
    <xsl:template name="ptn:Simulation.model.validate.xml__x3A__stats">
        <ptn:Simulation.model.validate.xml__x3A__stats>
            <xsl:for-each-group select="descendant-or-self::*[ptn:Label]" group-by="ptn:Label">
                <xsl:for-each select="current-group()">
                    <ptn:Node ptn:Label__x3A__stats="{ptn:Label}"
                        ptn:Label__x3A__count="{count(current-group())}"
                        ptn:Label__x3A__count__x3A__Nodes="{count(current-group()[current-group()/parent::*/name() = 'ptn:Nodes'])}"
                        ptn:Node__x3A__type="{name()}" 
                        id="{generate-id(.)}" 
                        ptn:Node__x3A__position="{position()}"
                        
                        >
                        
                        
                        <xsl:choose>
                            <xsl:when test="current-group()/parent::*/name() = 'ptn:Nodes'">
                                <xsl:attribute name="ptn:Nodes" select="true()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="ptn:Nodes" select="false()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:copy-of select="@ptn:Label__x3A__context"/>
                        <xsl:copy-of select="@ptn:Simulated_potential__x3A__diff"/>
                        <xsl:copy-of select="@ptn:Simulated_potential__x3A__more_charged_node"/>
                        <xsl:copy-of select="@ptn:Simulated_potential__x3A__less_charged_node"/>
                        <xsl:for-each select="descendant-or-self::ptn:Current_synapse">
                            <ptn:Output__x3A__stats ptn:Output_Node__x3A__stats="{ptn:Output_Node}" ptn:Node__x3A__position="{position()}" id="{generate-id(.)}"/>
                        </xsl:for-each>
                        <xsl:for-each select="descendant-or-self::ptn:Input__x3A__node">
                            <ptn:Input__x3A__stats ptn:Input__x3A__node__x3A__stats="{.}" ptn:Node__x3A__position="{position()}" id="{generate-id(.)}"/>
                        </xsl:for-each>
                    </ptn:Node>
                </xsl:for-each>
            </xsl:for-each-group>
        </ptn:Simulation.model.validate.xml__x3A__stats>
    </xsl:template>
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.model.stats.xml__x3A__generate-id" match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.stats.xml__x3A__generate-id" match="ptn:Receptor|*[parent::ptn:Nodes]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="id" select="generate-id(.)"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.stats.xml__x3A__generate-id" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="id" select="generate-id(.)"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>