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
    
    
    <xsl:template name="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__output_node">
        <xsl:param name="ptn:Capacitance" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio" select="1.2" tunnel="yes"/>
        <ptn:Capacitance__x3A__calculate__x3A__empty/>
        <ptn:Capacitance__x3A__attract__x3A__calculate__x3A__output_node ptn:debug="#268A _give_own__x3A__ratio=[{$ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio}]"><xsl:value-of select="((ptn:Capacitance + $ptn:Capacitance)) div 2 * $ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio"/></ptn:Capacitance__x3A__attract__x3A__calculate__x3A__output_node>
        <ptn:Capacitance__x3A__attract__x3A__calculate__x3A__self_node ptn:debug="#268B_ _give_own__x3A__ratio=[{$ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio}]"><xsl:value-of select="((ptn:Capacitance + $ptn:Capacitance)) div 2 div $ptn:Capacitance__x3A__attract__x3A__give_own__x3A__ratio"/></ptn:Capacitance__x3A__attract__x3A__calculate__x3A__self_node>
    </xsl:template>
    
    
</xsl:stylesheet>