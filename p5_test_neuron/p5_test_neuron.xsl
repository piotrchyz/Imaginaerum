<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:math="http://exslt.org/math"
    exclude-result-prefixes="xs math"
    xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    <!--<xsl:param name="ptn:Config" required="yes"/>
    <xsl:param name="ptn:Simulation_ticks" required="yes"/>
    
    <xsl:param name="ptn:Simulation.dir" required="yes"/>
    <xsl:param name="ptn:basedir" required="yes"/>
    <xsl:param name="ptn:Inputs" required="yes"/>
    <xsl:param name="basedir" required="yes"/>
    
    <xsl:param name="ptn:xsl" required="yes"/>
    
    <xsl:param name="ptn:xsd" required="yes"/>-->
    
    <xsl:include href="p5_test_neuron.param.xsl"/>
    
    <xsl:include href="sqrt.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.analys.xml.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.attract.xml.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.model.xml.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.model.model.stats.xml.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.analys.xml.Input__x3A__generate.xsl"/>
    
    <xsl:include href="p5_test_neuron.Simulation.analyze_simulation.x3d.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.analyze_simulation.xml.xsl"/>
    
    <xsl:include href="p5_test_neuron.Input__x3A__attract__x3A__vectors.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.overwiev.dita.xsl"/>
    
    
    <xsl:template mode="ptn:Simulation.build.analys.xml" match="ptn:Config">
        <xsl:message>#16 will 
                $ptn:Simulation_ticks[<xsl:value-of select="$ptn:Simulation_ticks"/>] 
                $ptn:Simulation.dir[<xsl:value-of select="$ptn:Simulation.dir"/>]
        </xsl:message>
        
        <!--<ptn:Simulation.build.analys.xml>-->
            <xsl:apply-templates mode="#current"/>
                
        <!--</ptn:Simulation.build.analys.xml>-->
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.build.analys.xml" match="ptn:Simulation.analys.xml[@ptn:Simulation_body_time__x3A__last]">
        <xsl:message>#16 will [TRY][CONTINUE]
            $ptn:Simulation_ticks[<xsl:value-of select="$ptn:Simulation_ticks"/>] 
            $ptn:Simulation.dir[<xsl:value-of select="$ptn:Simulation.dir"/>]
        </xsl:message>
        
        <!--<ptn:Simulation.build.analys.xml>-->
        <xsl:call-template name="ptn:Simulation.build.analys.xml">
            <xsl:with-param name="ptn:Simulation_ticks" select="@ptn:Simulation_body_time__x3A__last" tunnel="yes"/>
        </xsl:call-template>
        
        <!--</ptn:Simulation.build.analys.xml>-->
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.build.analys.xml" match="*">
        <xsl:message terminate="yes">#15 error - expected ptn:Config or another error schema [unantented/n][<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.build.analys.xml" match="ptn:Defaults|ptn:Receptors|ptn:Inputs|ptn:Receptor__x3A__generate">
        <xsl:comment>#34 bypassed <xsl:value-of select="name()"/></xsl:comment>
    </xsl:template>
    
    <xsl:template name="ptn:Simulation.build.analys.xml" mode="ptn:Simulation.build.analys.xml" match="ptn:Simulation[ptn:Simulation_ticks][ptn:Simulator_tick]">
        <xsl:param name="ptn:Simulation_ticks" select="ptn:Simulation_ticks" tunnel="yes"/>
        <xsl:comment>#35 analyzing <xsl:value-of select="name()"/></xsl:comment>
        <project basedir="{$basedir}" name="Simulation.build.analys.xml" default="Simulation.build.analys.xml.{$ptn:Simulation_ticks}">
            
            <xsl:if test="$ptn:p5suis"><property name="p5suis" value="{$ptn:p5suis}"/></xsl:if>
            <xsl:comment>#84 
                $ptn:p5suis = [<xsl:value-of select="$ptn:p5suis"/>]
                $ptn:debug__x3A__flag = [<xsl:value-of select="$ptn:debug__x3A__flag"/>]
            </xsl:comment>    
            
            <target name="Simulation.build.analys.xml.0">
                <echo>Initial simulation</echo>
                
                <!-- Receptor__x3A__generate -->
                <!--<parallel threadcount="2">-->
                    <sequential>
                        <xslt out="{$ptn:Simulation.dir}/Receptor__x3A__generate.0.xml"
                            style="{$ptn:xsl}"
                            in="{$ptn:Config}" 
                            force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                            <factory name="net.sf.saxon.TransformerFactoryImpl">
                                <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                                <attribute name="http://saxon.sf.net/feature/initialMode">
                                    <xsl:attribute name="value">{p5_test_neuron}Simulation.analys.xml__x3A__Receptor__x3A__generate</xsl:attribute>
                                </attribute>
                                <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                                <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                            </factory>
                            
                            <param  expression="{$ptn:Config}">
                                <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                            </param>
                            <param  expression="{$ptn:Inputs}">
                                <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                            </param>
                            <param  expression="{$ptn:xsl}">
                                <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                            </param>
                            <param  expression="{$ptn:xsd}">
                                <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                    </sequential>
                    <xsl:if test="$ptn:debug__x3A__flag and $ptn:p5suis" >
                        <sequential>
                            <ant  inheritall="false" antfile="{$ptn:p5suis}" target="p5suis.say_to_queue.copy_file.drop_overflow">
                                <property name="p5suis.say_to_queue.copy_file" value="{$ptn:Simulation.dir}/Receptor__x3A__generate.0.xml"/>
                            </ant>
                            <!--<ant   inheritall="false" antfile="{$ptn:p5suis}" target="p5suis:say_from_queue.task.run.immediate"/>-->
                        </sequential>    
                    </xsl:if>
                <!--</parallel>-->
                <!-- ptn:Input__x3A__generate -->
                
                <xslt out="{$ptn:Simulation.dir}/Input__x3A__generate.0.xml"
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Receptor__x3A__generate.0.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Input__x3A__generate</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                <!--ptn:Simulation.analys.xml__x3A__Receptor__x3A__generate.xml-->
                
                
                <xslt out="{$ptn:Simulation.dir}/Input__x3A__generate__x3A__pattern.0.xml"
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Input__x3A__generate.0.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Input__x3A__generate__x3A__pattern</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                
                <xslt out="{$ptn:Simulation.dir}/Input__x3A__generate__x3A__pattern__x3A__apply.0.xml"
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Input__x3A__generate__x3A__pattern.0.xml"
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Input__x3A__generate__x3A__pattern__x3A__apply</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                <xslt out="{$ptn:Simulation.dir}/Input__x3A__generate__x3A__pattern__x3A__apply_match.0.xml"
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Input__x3A__generate__x3A__pattern__x3A__apply.0.xml"
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Input__x3A__generate__x3A__pattern__x3A__apply_match</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                
                <xslt out="{$ptn:Simulation.dir}/Simulation.analys.xml.0.xml" 
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Input__x3A__generate__x3A__pattern__x3A__apply_match.0.xml"
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.analys.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.analys.xml.0.xml"
                    out="{$ptn:Simulation.dir}/Simulation.attract.xml.0.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.attract.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                <xsl:if test="$ptn:debug__x3A__flag and $ptn:p5suis" >
                    <sequential>
                        <ant  inheritall="false" antfile="{$ptn:p5suis}" target="p5suis.say_to_queue.copy_file.drop_overflow">
                            <property name="p5suis.say_to_queue.copy_file" value="{$ptn:Simulation.dir}/Simulation.attract.xml.0.xml"/>
                        </ant>
                        <!--<ant   inheritall="false" antfile="{$ptn:p5suis}" target="p5suis:say_from_queue.task.run.immediate"/>-->
                    </sequential>    
                </xsl:if>
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.attract.xml.0.xml"
                    out="{$ptn:Simulation.dir}/Simulation.model.xml.0.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.model.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                <xslt  
                    out="{$ptn:Simulation.dir}/Simulation.model.stats.xml.0.xml"
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.model.xml.0.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.model.stats.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                <xslt  
                    out="{$ptn:Simulation.dir}/Simulation.model.validate.xml.0.xml"
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.model.stats.xml.0.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.model.validate.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                <xslt  
                    out="{$ptn:Simulation.dir}/Simulation.model.apply.xml.0.xml"
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.model.validate.xml.0.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.model.apply.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                    </factory>
                    
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
            
            <xsl:for-each select="1 to $ptn:Simulation_ticks">
            <target name="Simulation.build.analys.xml.{.}">
              <xsl:attribute name="depends">Simulation.build.analys.xml.<xsl:value-of select=". - 1"/></xsl:attribute>
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.model.apply.xml.{. - 1}.xml"
                    out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.analys.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml"
                    out="{$ptn:Simulation.dir}/Simulation.attract.xml.{.}.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.attract.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                <xsl:if test="$ptn:debug__x3A__flag and $ptn:p5suis" >
                    <sequential>
                        <ant  inheritall="false" antfile="{$ptn:p5suis}" target="p5suis.say_to_queue.copy_file.drop_overflow">
                            <property name="p5suis.say_to_queue.copy_file" value="{$ptn:Simulation.dir}/Simulation.attract.xml.{.}.xml"/>
                        </ant>
                        <!--<ant   inheritall="false" antfile="{$ptn:p5suis}" target="p5suis:say_from_queue.task.run.immediate"/>-->
                    </sequential>    
                </xsl:if>
                
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.attract.xml.{.}.xml"
                    out="{$ptn:Simulation.dir}/Simulation.model.xml.{.}.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.model.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
              
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.model.xml.{.}.xml"
                    out="{$ptn:Simulation.dir}/Simulation.model.stats.xml.{.}.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.model.stats.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
              
              
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.model.stats.xml.{.}.xml"
                    out="{$ptn:Simulation.dir}/Simulation.model.validate.xml.{.}.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.model.validate.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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
                
                <xslt  
                    style="{$ptn:xsl}"
                    in="{$ptn:Simulation.dir}/Simulation.model.validate.xml.{.}.xml"
                    out="{$ptn:Simulation.dir}/Simulation.model.apply.xml.{.}.xml" 
                    force="false"><!-- in="{$ptn:Simulation.dir}/Simulation.analys.xml.{. - 1}.xml" --><!-- out="{$ptn:Simulation.dir}/Simulation.analys.xml.{.}.xml" -->
                    <factory name="net.sf.saxon.TransformerFactoryImpl">
                        <attribute name="http://saxon.sf.net/feature/xinclude-aware" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/initialMode">
                            <xsl:attribute name="value">{p5_test_neuron}Simulation.model.apply.xml</xsl:attribute>
                        </attribute>
                        <attribute name="http://saxon.sf.net/feature/dtd-validation-recoverable" value="true"/>
                        <attribute name="http://saxon.sf.net/feature/validation" value="off"/>
                    </factory>
                    <param  expression="{$ptn:Config}">
                        <xsl:attribute name="name">{p5_test_neuron}Config</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:Inputs}">
                        <xsl:attribute name="name">{p5_test_neuron}Inputs</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsl}">
                        <xsl:attribute name="name">{p5_test_neuron}xsl</xsl:attribute>
                    </param>
                    <param  expression="{$ptn:xsd}">
                        <xsl:attribute name="name">{p5_test_neuron}xsd</xsl:attribute>
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