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
    
    <xsl:include href="p5_test_neuron.Simulation.analyze_simulation.x3d.generate__x3A__pattern__x3A__apply_match.xsl"/>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Input__x3A__generate__x3A__pattern.xml[ptn:Receptors][@ptn:Simulation_ticks][@ptn:Simulator_tick]">
        <ptn:Input__x3A__generate__x3A__pattern__x3A__apply.xml>
            <xsl:copy-of select="@*"/>
            <xsl:comment>#20 todo ptn:Input__x3A__generate__x3A__pattern__x3A__apply</xsl:comment>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulator_tick" select="@ptn:Simulator_tick" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_ticks" select="@ptn:Simulation_ticks" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation_ticks__x3A__real" select="@ptn:Simulation_ticks + 1" tunnel="yes"/>
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
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Input">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="ptn:Input_exec_time|ptn:Input_exec_receptor|ptn:Input_exec_Time_constant|ptn:Input_exec_Maximum_current">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply" match="*">
        <xsl:message terminate="yes">#28 [ptn:Input__x3A__generate__x3A__pattern__x3A__apply]  unantended/n[<xsl:value-of select="name()"/>]  </xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="*">
        <xsl:message terminate="yes">#81A unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:Input__x3A__generate__x3A__pattern_Group">
        <xsl:param name="ptn:Simulation_ticks__x3A__real" tunnel="yes" required="yes"/>
        <!--<xsl:variable name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" select="."/>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Input__x3A__generate__x3A__pattern_Group" select="." tunnel="yes"/>
            </xsl:apply-templates>
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
        <xsl:message>#139 [DEBUG] [@ptn:Label__x3A__fieldOfView__x3A__ray[<xsl:value-of select="IndexedFaceSet/@ptn:Label__x3A__fieldOfView__x3A__ray"/>]]</xsl:message>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="IndexedFaceSet|Coordinate">
        <!--<xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>-->
        <xsl:copy-of select="."></xsl:copy-of>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
        <xsl:param name="ptn:Simulation_ticks__x3A__real" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_Group" required="yes" tunnel="yes"/>
        <xsl:copy>
          <xsl:copy-of select="@*"/>
            <xsl:variable name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" select="."/>
          <xsl:for-each select="1 to xs:integer($ptn:Simulation_ticks__x3A__real)">
              <xsl:message>#162 debug [APPLY][1 to [<xsl:value-of select="."/>]] [@DEF[<xsl:value-of select="$ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector/@DEF"/>]] [@ptn:Simulator_tick__x3A__context][<xsl:value-of select="$ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector/@ptn:Simulator_tick__x3A__context"/>]</xsl:message>
              <xsl:variable name="ptn:Simulation_tick__x3A__context__step" select="1 div last() * ."/>
                <xsl:call-template name="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector">
                    <xsl:with-param name="ptn:Simulation_tick__x3A__context__step" select="$ptn:Simulation_tick__x3A__context__step" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulation_tick__x3A__context" select="." tunnel="yes"/>
                    <!--<xsl:with-param name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" select="$ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" tunnel="yes"/>-->
                </xsl:call-template>
            </xsl:for-each>
          <xsl:apply-templates mode="#current"/>
      </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template name="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector">
        <xsl:param name="ptn:Simulation_tick__x3A__context__step"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation_tick__x3A__context"  tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_Group"  tunnel="yes" required="yes"/>
        <ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector
            ptn:debug="#166 "
            ptn:Simulation_tick__x3A__context__step="{$ptn:Simulation_tick__x3A__context__step}"
            ptn:Simulation_tick__x3A__context="{$ptn:Simulation_tick__x3A__context}"
            >
            
            <!--<apply-templates 
                mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector"
                aselect="ptn:Input__x3A__generate__x3A__pattern_Group//ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector"
                where="@ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step"
                where_lt="1"
                filter_lt="{$ptn:Simulation_tick__x3A__context__step}"
                >
            </apply-templates>-->
            <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" select="$ptn:Input__x3A__generate__x3A__pattern_Group//ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[number(@ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step) &lt;= number($ptn:Simulation_tick__x3A__context__step)]">
                <xsl:with-param name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" select="$ptn:Input__x3A__generate__x3A__pattern_Group//ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[number(@ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_step) &lt;= number($ptn:Simulation_tick__x3A__context__step)]" tunnel="yes"/>
            </xsl:apply-templates><!-- ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[number(@ptn:MFVec3f__x3A__distance__x3A__percent) &gt;= number($ptn:Simulation_tick__x3A__context__step)] --><!-- /ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[number(@ptn:MFVec3f__x3A__distance__x3A__percent) &gt;= number($ptn:Simulation_tick__x3A__context__step)] -->
        </ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector">
        <xsl:apply-templates mode="#current" select="ptn:keyValue__generate__basepoint__x3A__calculations[1]/@*">
            <!-- preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector|following-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector|. -->
            </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="ptn:keyValue__generate__basepoint__x3A__calculations">
        <keyValue__generate__basepoint__x3A__calculations__x3A__generated>
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </keyValue__generate__basepoint__x3A__calculations__x3A__generated>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="@ptn:Coordinate_X">
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" required="yes" tunnel="yes"/>
        <xsl:attribute name="{name()}__generated" select=". + sum($ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_X__x3A__vector)"/>
        <xsl:attribute name="{name()}__generated.debug_test_240" select=". + sum(parent::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_X__x3A__vector)"/>
        <!--<xsl:attribute name="{name()}__generated_debug">
            <xsl:for-each select="$ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_X__x3A__vector"><xsl:value-of select="."/><xsl:text>, </xsl:text></xsl:for-each>
        </xsl:attribute>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="@ptn:Coordinate_Y">
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" required="yes" tunnel="yes"/>
        <xsl:attribute name="{name()}__generated" select=". + sum($ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_Y__x3A__vector)"/>
        <xsl:attribute name="{name()}__generated.debug_test_240" select=". + sum(ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_Y__x3A__vector)"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="@ptn:Coordinate_Z">
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" required="yes" tunnel="yes"/>
        <xsl:attribute name="{name()}__generated" select=". + sum($ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_Z__x3A__vector)"/>
        <xsl:attribute name="{name()}__generated.debug_test_240" select=". + sum(ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_Z__x3A__vector)"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="@ptn:Coordinate_X__x3A__remote">
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" required="yes" tunnel="yes"/>
        <xsl:attribute name="{name()}__generated" select=". + sum($ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_X__x3A__vector)"/>
        <xsl:attribute name="{name()}__generated.debug_test_240" select=". + sum(ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_X__x3A__vector)"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="@ptn:Coordinate_Y__x3A__remote">
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" required="yes" tunnel="yes"/>
        <xsl:attribute name="{name()}__generated" select=". + sum($ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_Y__x3A__vector)"/>
        <xsl:attribute name="{name()}__generated.debug_test_240" select=". + sum(ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_Y__x3A__vector)"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="@ptn:Coordinate_Z__x3A__remote">
        <xsl:param name="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector" required="yes" tunnel="yes"/>
        <xsl:attribute name="{name()}__generated" select=". + sum($ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_Z__x3A__vector)"/>
        <xsl:attribute name="{name()}__generated.debug_test_240" select=". + sum(ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector//@ptn:Coordinate_Z__x3A__vector)"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="@*"/>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="Coordinate"/>
        
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__x3A__apply__x3A__calculate_LineSet__x3A__vector" match="*">
        <xsl:message terminate="yes">#168 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
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