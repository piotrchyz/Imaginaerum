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
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Input__x3A__generate__x3A__pattern.xml[ptn:Receptors][@ptn:Simulation_ticks][@ptn:Simulator_tick]">
        <ptn:Input__x3A__generate__x3A__pattern__x3A__apply.xml>
            <xsl:copy-of select="@*"/>
            <xsl:comment>#20 todo ptn:Input__x3A__generate__x3A__pattern__x3A__apply</xsl:comment>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulator_tick" select="@ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_ticks" select="@ptn:Simulation_ticks" tunnel="yes"/>
            </xsl:apply-templates>
        </ptn:Input__x3A__generate__x3A__pattern__x3A__apply.xml>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Defaults|ptn:Receptors|ptn:Receptor">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Adaptation_conductance|ptn:Adaptation_time_constant">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Refactory_period|ptn:Maximum_current|ptn:Time_constant|ptn:Delay|ptn:Attract_min">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|ptn:Is_inhibitor">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Outputs|ptn:Input__x3A__nodes|ptn:Simulated_potential|ptn:Receptor_regex_filter|ptn:Inputs|ptn:Simulation">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Simulator_tick|ptn:Simulation_ticks">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:copy>
            <xsl:attribute name="ptn:debug">#78 applying mode ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate</xsl:attribute>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate"/>    
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="*">
        <xsl:message terminate="yes">#28 [ptn:Input__x3A__generate__x3A__pattern__x3A__apply]  unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="*">
        <xsl:message terminate="yes">#81A unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:Input__x3A__generate__x3A__pattern_Group">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:Group__x3A__generate__x3A__pattern_Group">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:Input__x3A__generate__x3A__Shape">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:Input__x3A__generate__x3A__fieldOfView__x3A__ray">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="IndexedFaceSet|Coordinate">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:keyValue__generate__basepoint_1|ptn:keyValue__generate__basepoint_2">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:keyValue__generate__basepoint__x3A__calculations">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
</xsl:stylesheet>