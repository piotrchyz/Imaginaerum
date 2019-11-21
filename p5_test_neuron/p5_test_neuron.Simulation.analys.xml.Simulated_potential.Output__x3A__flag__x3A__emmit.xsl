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
    
    <xsl:template name="ptn:Output__x3A__flag__x3A__emmit">
        <xsl:param name="ptn:Outputs" tunnel="yes" required="yes"/>
        <ptn:Output__x3A__flag__x3A__emmit>
            <xsl:apply-templates mode="ptn:Output__x3A__flag__x3A__emmit" select="$ptn:Outputs"/>
        </ptn:Output__x3A__flag__x3A__emmit>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Output__x3A__flag__x3A__emmit" match="ptn:Outputs">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Output__x3A__flag__x3A__emmit" match="ptn:Current_synapse[ptn:Output_Node][ptn:Delay]">
        <xsl:param name="ptn:Simulation_body_time" tunnel="yes" required="yes"/>
        <xsl:element name="ptn:Current_synapse__x3A__emmit">
            <xsl:attribute name="ptn:debug">#28E ptn:Input_exec_Time_constant[<xsl:value-of select="ptn:Input_exec_Time_constant"/>]</xsl:attribute>
            <xsl:message >#28E ptn:Input_exec_Time_constant[<xsl:value-of select="ptn:Input_exec_Time_constant"/>]</xsl:message>
            <xsl:attribute name="ptn:Output_Node" select="ptn:Output_Node"/>
            <xsl:call-template name="ptn:Simulation.analys.xml__x3A__divide_input">
                <xsl:with-param name="ptn:Current_synapse" select="." tunnel="yes"/>
                <xsl:with-param name="ptn:Input_time__x3A__attract" tunnel="yes" select="$ptn:Simulation_body_time"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>
    
    <xsl:template mode="ptn:Output__x3A__flag__x3A__emmit"  match="*">
        <xsl:message terminate="yes">#22 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
</xsl:stylesheet>