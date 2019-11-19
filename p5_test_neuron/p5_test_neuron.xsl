<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    <xsl:param name="ptn:Config" required="yes"/>
    <xsl:param name="ptn:Simulation_ticks" required="yes"/>
    
    <xsl:param name="ptn:Simulation.dir" required="yes"/>
    <xsl:param name="ptn:basedir" required="yes"/>
    <xsl:param name="basedir" required="yes"/>
    
    <xsl:param name="ptn:xsl" required="yes"/>
    
    <xsl:include href="p5_test_neuron.Simulation.analys.xml.xsl"/>
    
    <xsl:template mode="ptn:Simulation.build.analys.xml" match="ptn:Config">
        <xsl:message>#16 will 
                $ptn:Simulation_ticks[<xsl:value-of select="$ptn:Simulation_ticks"/>]
                $ptn:Simulation.dir[<xsl:value-of select="$ptn:Simulation.dir"/>]
        </xsl:message>
        
        <!--<ptn:Simulation.build.analys.xml>-->
            <xsl:apply-templates mode="#current"/>
        <!--</ptn:Simulation.build.analys.xml>-->
        
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.build.analys.xml" match="*">
        <xsl:message terminate="yes">#15 error - expected ptn:Config or another error schema</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.build.analys.xml" match="ptn:Defaults|ptn:Receptors|ptn:Inputs">
        <xsl:comment>#34 bypassed <xsl:value-of select="name()"/></xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.build.analys.xml" match="ptn:Simulation[ptn:Simulation_ticks][ptn:Simulator_tick]">
        <xsl:comment>#35 analyzing <xsl:value-of select="name()"/></xsl:comment>
        <project basedir="{$basedir}" name="Simulation.build.analys.xml" default="Simulation.build.analys.xml.{ptn:Simulation_ticks}">
            
            <target name="Simulation.build.analys.xml.0">
                <echo>Initial simulation</echo>
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Config}"
                    out="{$ptn:Simulation.dir}/Simulation.analys.xml.0.xml" 
                    force="true"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.analys.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Simulation_ticks}">
                        <xsl:attribute name="name">{p5_test_neuron}Simulation_ticks</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Simulation.dir}">
                        <xsl:attribute name="name">{p5_test_neuron}Simulation.dir</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:basedir}">
                        <xsl:attribute name="name">{p5_test_neuron}basedir</xsl:attribute>
                    </param>
                    <param name="basedir" expression="{$basedir}"/>
                    
                    <classpath location="/opt/local/share/java/saxon9he.jar"/>
                </xslt>
            </target>
            
        <xsl:for-each select="1 to ptn:Simulation_ticks">
            <target name="Simulation.build.analys.xml.{.}">
              <xsl:attribute name="depends">Simulation.build.analys.xml.<xsl:value-of select=". - 1"/></xsl:attribute>
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml"
                    out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" 
                    force="true"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.analys.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                    </factory>
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Simulation_ticks}">
                        <xsl:attribute name="name">{p5_test_neuron}Simulation_ticks</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Simulation.dir}">
                        <xsl:attribute name="name">{p5_test_neuron}Simulation.dir</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:basedir}">
                        <xsl:attribute name="name">{p5_test_neuron}basedir</xsl:attribute>
                    </param>
                    <param name="basedir" expression="{$basedir}"/>
                    
                    <classpath location="/opt/local/share/java/saxon9he.jar"/>
                </xslt>
            </target>
        </xsl:for-each>
        </project>
    </xsl:template>
    
</xsl:stylesheet>