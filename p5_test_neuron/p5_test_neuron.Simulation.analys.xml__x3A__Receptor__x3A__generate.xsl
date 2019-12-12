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
    
    
    
    
    
    <xsl:template match="ptn:Config" mode="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate">
        <ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate.xml>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="xsi:schemaLocation">p5_test_neuron file:<xsl:value-of select="$ptn:xsd"/></xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate.xml>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
    <xsl:template name="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" >
        <!--<xsl:param name="ptn:Receptors" tunnel="yes" required="yes"/>-->
        <xsl:apply-templates mode="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" select="descendant-or-self::ptn:Receptor__x3A__generate"/>
    </xsl:template>
    
    <xsl:template match="ptn:Input__x3A__generate" mode="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    <xsl:template name="ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio_ray">
        <xsl:param name="ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio"  select="0.9"/>
        <xsl:param name="ptn:Coordinate_X__x3A__max" required="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__min" required="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__generated" required="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__generated__separator" required="no"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__max" required="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__min" required="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__generated" required="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__generated__separator" required="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray" select="-10"/>
        <xsl:param name="ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio_ray__X3A__debug" select="false()"/>
        <xsl:attribute name="ptn:Coordinate_X__x3A__min" select="$ptn:Coordinate_X__x3A__min"/>
        <xsl:attribute name="ptn:Coordinate_X__x3A__max" select="$ptn:Coordinate_X__x3A__max"/>
        <xsl:attribute name="ptn:Coordinate_Y__x3A__min" select="$ptn:Coordinate_Y__x3A__min"/>
        <xsl:attribute name="ptn:Coordinate_Y__x3A__max" select="$ptn:Coordinate_Y__x3A__max"/>
        
        <xsl:attribute name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray"  select="$ptn:Coordinate_X__x3A__generated__separator - $ptn:Coordinate_X__x3A__min  -  (( $ptn:Coordinate_X__x3A__max - $ptn:Coordinate_X__x3A__min ) div 2 ) + $ptn:Coordinate_X__x3A__generated__separator"/>
        <xsl:attribute name="ptn:Coordinate_X__x3A__fieldOfView__x3A__ray.diff"  select="$ptn:Coordinate_X__x3A__generated__separator - $ptn:Coordinate_X__x3A__min  -  (( $ptn:Coordinate_X__x3A__max - $ptn:Coordinate_X__x3A__min ) div 2 ) "/>
       
        <xsl:attribute name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray"  select="$ptn:Coordinate_Y__x3A__generated__separator - $ptn:Coordinate_Y__x3A__min  -  (( $ptn:Coordinate_Y__x3A__max - $ptn:Coordinate_Y__x3A__min ) div 2 ) + $ptn:Coordinate_Y__x3A__generated__separator "/>
        <xsl:attribute name="ptn:Coordinate_Y__x3A__fieldOfView__x3A__ray.diff"  select="$ptn:Coordinate_Y__x3A__generated__separator - $ptn:Coordinate_Y__x3A__min  -  (( $ptn:Coordinate_Y__x3A__max - $ptn:Coordinate_Y__x3A__min ) div 2 )  "/>
        
        
        
        
        <xsl:attribute name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray" select="$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate" match="ptn:Receptor__x3A__generate[@ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio][ptn:Coordinate_X[@ptn:Coordinate_X__x3A__generate__min]][ptn:Coordinate_X[@ptn:Coordinate_X__x3A__generate__separator]]" >
        <xsl:param name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray" select="@ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray"/>
        <xsl:param name="ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio" select="@ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio"/>
        <xsl:variable name="ptn:Receptor__x3A__generate" select="."/>
        <xsl:variable name="ptn:Coordinate_X__x3A__generate__min" select="ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__min"/>
        <xsl:variable name="ptn:Coordinate_X__x3A__generate__max" select="ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__max"/>
        <xsl:variable name="ptn:Coordinate_X__x3A__generate__separator" select="ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__separator"/>
        <xsl:message>#85AGG [ptn:Receptor__x3A__generate]  </xsl:message>
        <xsl:comment>#85AGG [ptn:Receptor__x3A__generate] [<xsl:value-of select="$ptn:Coordinate_X__x3A__generate__min"/>][to][<xsl:value-of select="$ptn:Coordinate_X__x3A__generate__max"/>]</xsl:comment>
        <xsl:for-each select="$ptn:Coordinate_X__x3A__generate__min to $ptn:Coordinate_X__x3A__generate__max">
            <xsl:variable name="ptn:Coordinate_X__x3A__generated" select="."/>
            <xsl:variable name="ptn:Coordinate_X__x3A__generated.position" select="position()"/>
            <xsl:variable name="ptn:Coordinate_X__x3A__generated__separator" select=". * $ptn:Coordinate_X__x3A__generate__separator"/>
            
            <!--<xsl:comment>#90 ptn:Coordinate_X__x3A__generated[<xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>] </xsl:comment>-->
            <xsl:for-each select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__min to $ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__max">
                <xsl:variable name="ptn:Coordinate_Y__x3A__generated" select="."/>
                <xsl:variable name="ptn:Coordinate_Y__x3A__generated__separator" select=". * $ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__separator"/>
                
                <!--<xsl:comment>#90 ptn:Coordinate_X__x3A__generated[<xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>] </xsl:comment>-->
                <xsl:message>#90 ptn:Coordinate_X__x3A__generated[<xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>][<xsl:value-of select="$ptn:Coordinate_Y__x3A__generated"/>] </xsl:message>
                <ptn:Receptor
                    ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio="{$ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio}"
                    
                    ptn:Coordinate_X__x3A__generated="{$ptn:Coordinate_X__x3A__generated}"
                    ptn:Coordinate_X__x3A__generated__separator="{$ptn:Coordinate_X__x3A__generated__separator}"
                    ptn:Coordinate_Y__x3A__generated__separator="{$ptn:Coordinate_Y__x3A__generated__separator}"
                    ptn:Coordinate_Y__x3A__generated="{$ptn:Coordinate_Y__x3A__generated}">
                    <xsl:if test="$ptn:Coordinate_X__x3A__generated.position = 1 and position() = 1">
                        <xsl:attribute name="p5suis:say.PL">Konfiguracja matrycy receptorów o wymiarach X <xsl:value-of select="$ptn:Coordinate_X__x3A__generate__max - $ptn:Coordinate_X__x3A__generate__min"/> , Y <xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__max - $ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__min"/> </xsl:attribute>
                    </xsl:if>
                    <xsl:call-template name="ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio_ray">
                        <xsl:with-param name="ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio"  select="$ptn:Receptor__x3A__generate__fieldOfView__x3A__ratio"/>
                        <xsl:with-param name="ptn:Coordinate_X__x3A__max" select="$ptn:Receptor__x3A__generate/ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__max * $ptn:Receptor__x3A__generate/ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__separator"/>
                        <xsl:with-param name="ptn:Coordinate_X__x3A__min" select="$ptn:Receptor__x3A__generate/ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__min * $ptn:Receptor__x3A__generate/ptn:Coordinate_X/@ptn:Coordinate_X__x3A__generate__separator"/>
                        <xsl:with-param name="ptn:Coordinate_X__x3A__generated__separator" select="$ptn:Coordinate_X__x3A__generated__separator"/>
                        <xsl:with-param name="ptn:Coordinate_X__x3A__generated" select="$ptn:Coordinate_X__x3A__generated"/>
                        <xsl:with-param name="ptn:Coordinate_Y__x3A__max" select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__max * $ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__separator"/>
                        <xsl:with-param name="ptn:Coordinate_Y__x3A__min" select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__min * $ptn:Receptor__x3A__generate/ptn:Coordinate_Y/@ptn:Coordinate_Y__x3A__generate__separator"/>
                        <xsl:with-param name="ptn:Coordinate_Y__x3A__generated" select="$ptn:Coordinate_Y__x3A__generated"/>
                        <xsl:with-param name="ptn:Coordinate_Y__x3A__generated__separator" select="$ptn:Coordinate_Y__x3A__generated__separator"/>
                        <xsl:with-param name="ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray" select="$ptn:Coordinate_Z__x3A__fieldOfView__x3A__ray"/>
                    </xsl:call-template>
                    <ptn:Label><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Label/@ptn:Label__x3A__generate__x3A__prefix"/><xsl:text>_X</xsl:text><xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>_Y<xsl:value-of select="$ptn:Coordinate_Y__x3A__generated"/>_Z<xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Z/@ptn:Coordinate_Z__x3A__generate__min"/></ptn:Label>
                    <ptn:Coordinate_X><xsl:value-of select="$ptn:Coordinate_X__x3A__generated__separator"/></ptn:Coordinate_X>
                    <ptn:Coordinate_Y><xsl:value-of select="$ptn:Coordinate_Y__x3A__generated__separator"/></ptn:Coordinate_Y>
                    <ptn:Coordinate_Z><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Z/@ptn:Coordinate_Z__x3A__generate__min"/></ptn:Coordinate_Z>
                    <ptn:Capacitance><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Capacitance"/></ptn:Capacitance>
                    <ptn:Resistance><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Resistance"/></ptn:Resistance>
                    <ptn:Minimum_voltage><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Minimum_voltage"/></ptn:Minimum_voltage>
                    <ptn:Maximum_voltage><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Maximum_voltage"/></ptn:Maximum_voltage>
                    <ptn:Resting_potential><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Resting_potential"/></ptn:Resting_potential>
                    <ptn:Reset_potential><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Reset_potential"/></ptn:Reset_potential>
                    <ptn:Firing_threshold><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Firing_threshold"/></ptn:Firing_threshold>
                    <ptn:Refactory_period><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Refactory_period"/></ptn:Refactory_period>
                    <ptn:Is_inhibitor><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Is_inhibitor"/></ptn:Is_inhibitor>
                    <ptn:Outputs/>
                    <ptn:Input__x3A__nodes/>
                    <ptn:Simulated_potential><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Simulated_potential"/></ptn:Simulated_potential>
                    <xsl:copy-of select="$ptn:Receptor__x3A__generate/ptn:Input__x3A__attract__x3A__vectors"/>
                    <ptn:Receptor_regex_filter><xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Label/@ptn:Label__x3A__generate__x3A__prefix"/><xsl:text>_X</xsl:text><xsl:value-of select="$ptn:Coordinate_X__x3A__generated"/>_Y<xsl:value-of select="$ptn:Coordinate_Y__x3A__generated"/>_Z<xsl:value-of select="$ptn:Receptor__x3A__generate/ptn:Coordinate_Z/@ptn:Coordinate_Z__x3A__generate__min"/></ptn:Receptor_regex_filter>
                </ptn:Receptor>
                
                
            </xsl:for-each>
            
        </xsl:for-each>
        
    </xsl:template>
    
    
</xsl:stylesheet>