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
    
    
    <xsl:template mode="ptn:Simulation.overwiev.dita" match="*">
        <xsl:message terminate="yes">#15 unantended [n][<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.overwiev.ditamap">
        <xsl:param name="ptn:Simulation_ticks" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulator_tick" tunnel="yes" required="yes"/>
        <xsl:if test="$ptn:Simulation.overwiev.ditamap">
            <xsl:result-document href="{$ptn:Simulation.overwiev.ditamap}">
            <map xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:noNamespaceSchemaLocation="urn:oasis:names:tc:dita:xsd:map.xsd">
                <!--<title>Analiza zdarzeń symulacji sieci  w jednostce czasu <codeph><xsl:value-of select="$ptn:Simulator_tick"/></codeph><parmname>[ms]</parmname> i długości <codeph><xsl:value-of select="$ptn:Simulation_ticks"/></codeph> <parmname>[scen]</parmname> </title>-->
                <title>Analiza zdarzeń symulacji sieci  w jednostce czasu <xsl:value-of select="$ptn:Simulator_tick"/>[ms] i długości <xsl:value-of select="$ptn:Simulation_ticks"/> [scen] </title>
                <topicmeta>
                    <navtitle>Analiza zdarzeń symulacji sieci  w jednostce czasu </navtitle>
                </topicmeta>
                <topicref href="{$ptn:Simulation.overwiev.ditamap}" format="dita"/>
            </map>
            </xsl:result-document>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.overwiev.dita" match="ptn:Simulation.analyze_simulation.xml[@ptn:Simulation_ticks][@ptn:Simulator_tick]">
        <xsl:param name="ptn:Simulation_ticks" select="@ptn:Simulation_ticks"/>
        <xsl:param name="ptn:Simulator_tick" select="@ptn:Simulator_tick"/>
        <xsl:param name="ptn:Simulation.analyze_simulation.xml" select="."/>
        <xsl:param name="ptn:Config" select="doc($ptn:Config)//ptn:Config"/>
        <xsl:call-template name="ptn:Simulation.overwiev.ditamap">
            <xsl:with-param name="ptn:Simulation_ticks" tunnel="yes" select="$ptn:Simulation_ticks"/>
            <xsl:with-param name="ptn:Simulator_tick" tunnel="yes" select="$ptn:Simulator_tick"/>
        </xsl:call-template>
        
        
        <topic id="ptn.Simulation.overwiev.dita" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:noNamespaceSchemaLocation="urn:oasis:names:tc:dita:xsd:topic.xsd">
            <title>Analiza zdarzeń symulacji sieci  w jednostce czasu <codeph><xsl:value-of select="$ptn:Simulator_tick"/></codeph><parmname>[ms]</parmname> i długości <codeph><xsl:value-of select="$ptn:Simulation_ticks"/></codeph> <parmname>[scen]</parmname> </title>
            <body>
                <p>
                    
                    <simpletable frame="all" relcolwidth="1* 1* 1* 1* 1*" id="simpletable_neurony">
                        <sthead>
                            <stentry>Czas</stentry>
                            <stentry>Wejscie</stentry>
                            <stentry>Nazwa</stentry>
                            <stentry>Wyjscie</stentry>
                            <stentry>Poziom[V]</stentry>
                        </sthead>
                                            
                    
                            <xsl:for-each-group select="ptn:Simulation.analys.xml__x3A__analyze/*[@ptn:Label__x3A__analyze]" group-by="@ptn:Label__x3A__analyze">
                                <xsl:variable name="ptn:Simulation_body_time" select="parent::ptn:Simulation.analys.xml__x3A__analyze/@ptn:Simulation_body_time"/>
                                <strow>
                                    <stentry><xsl:value-of select="$ptn:Simulation_body_time"/></stentry>
                                    <stentry>
                                        <xsl:for-each select="$ptn:Simulation.analyze_simulation.xml//ptn:Simulation.analys.xml__x3A__analyze/*[ptn:Current_synapse__x3A__analyze[@ptn:Output_Node__x3A__analyze = current()/@ptn:Label__x3A__analyze]]">
                                            <xsl:if test="position() = 1"><xsl:value-of select="@ptn:Label__x3A__analyze"/></xsl:if>
                                        </xsl:for-each>
                                    </stentry>
                                    <stentry id="Simulation_body_time_{@ptn:Label__x3A__analyze}"><xsl:value-of select="@ptn:Label__x3A__analyze"/></stentry>
                                    <stentry><xsl:value-of select="ptn:Current_synapse__x3A__analyze/@ptn:Output_Node__x3A__analyze"/></stentry>
                                    <stentry><xsl:value-of select="@ptn:Simulated_potential"/></stentry>
                                </strow>
                            </xsl:for-each-group>
                    </simpletable>
                </p>
                
                <section id="section_aktywnosci_na_synapsach">
                    <title>Aktywności na synapsach</title>
                    <p>
                        
                        <simpletable frame="all" relcolwidth="1* 1* 1* 1* 1* 1* 1* 1*" id="simpletable_synapsy">
                            <sthead>
                                <stentry>Czas</stentry>
                                <stentry>Źródło</stentry>
                                <stentry>Poziom[Vloc]</stentry>
                                <stentry>[ms]</stentry>
                                <stentry>[mA]</stentry>
                                <stentry>Delay</stentry>
                                <stentry>Cel</stentry>
                                <stentry>Poziom[Vdest]</stentry>
                            </sthead>
                            <xsl:for-each-group select="ptn:Simulation.analys.xml__x3A__analyze" group-by="@ptn:Simulation_body_time">
                                <xsl:comment>#71 cnt[<xsl:value-of select="count(current())"/>] [<xsl:value-of select="current-grouping-key()"/>]</xsl:comment>
                                <xsl:variable name="ptn:Simulation_body_time" select="@ptn:Simulation_body_time"/>
                                <xsl:for-each-group select="*[@ptn:Label__x3A__analyze]" group-by="@ptn:Label__x3A__analyze">
                                    <xsl:comment>#72 cnt[<xsl:value-of select="count(current())"/>]  [<xsl:value-of select="current-grouping-key()"/>]</xsl:comment>
                                    <xsl:variable name="ptn:Label__x3A__analyze" select="@ptn:Label__x3A__analyze"/>
                                    <xsl:for-each select="descendant-or-self::ptn:Input__x3A__analyze">
                                        <strow>
                                            <stentry id="simpletable_synapsy_{$ptn:Simulation_body_time}_{$ptn:Label__x3A__analyze}_{@ptn:Input_exec_time__x3A__analyze}_{@ptn:Input_exec_receptor__x3A__analyze}"><xsl:value-of select="$ptn:Simulation_body_time"/></stentry>
                                            <stentry ><xsl:value-of select="$ptn:Label__x3A__analyze"/></stentry>
                                            
                                            <stentry><xsl:value-of select="current-group()/@ptn:Simulated_potential"/>[mV]</stentry>
                                            <stentry><xsl:value-of select="@ptn:Input_exec_Time_constant__x3A__analyze"/>[ms]</stentry>
                                            <stentry><xsl:value-of select="@ptn:Input_exec_Maximum_current__x3A__analyze"/>[mA]</stentry>
                                            <stentry>  <xsl:value-of select="parent::ptn:Current_synapse__x3A__emmit__x3A__analyze/@ptn:Current_synapse__x3A__emmit__x3A__time__x3A__min - $ptn:Simulation_body_time"/> [Delay]</stentry>
                                            <stentry><xsl:value-of select="@ptn:Input_exec_receptor__x3A__analyze"/></stentry>
                                            <stentry>
                                                <xsl:for-each select="$ptn:Simulation.analyze_simulation.xml//ptn:Simulation.analys.xml__x3A__analyze[@ptn:Simulation_body_time = current()/@ptn:Input_exec_time__x3A__analyze ]/*[@ptn:Label__x3A__analyze = current()/@ptn:Input_exec_receptor__x3A__analyze]">
                                                    <xsl:value-of select="@ptn:Simulated_potential"/>
                                                </xsl:for-each>
                                                
                                            </stentry>
                                        </strow>
                                    </xsl:for-each>
                                    
                                    
                                    
                                </xsl:for-each-group>
                                
                                
                            </xsl:for-each-group>
                        </simpletable>
                    </p>
                </section>
                
                <xsl:apply-templates mode="#current" select="$ptn:Config"/>
                
                
                
            </body>
            <related-links>
                <linklist>
                    <linkinfo>Autor Arkadiusz Binder Procesy5</linkinfo>
                </linklist>
            </related-links>
        </topic>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.overwiev.dita" match="ptn:Config">
        <section id="section_config_{local-name()}">
            <title>Cechy środowiska</title>
            <p>
                
            </p>
        </section>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.overwiev.dita" match="ptn:Defaults">
        <section id="section_config_{local-name()}">
            <title>Domyślne wartości</title>
            <p>
                <simpletable frame="all" relcolwidth="1* 1* 1*" id="simpletable_synapsy_{local-name()}">
                    <sthead>
                        <stentry>Lp</stentry>
                        <stentry>Parametr</stentry>
                        <stentry>Wartość</stentry>
                    </sthead>
                    <xsl:for-each select="*">
                        <strow>
                            <stentry><xsl:value-of select="position()"/></stentry>
                            <stentry><xsl:value-of select="local-name()"/></stentry>
                            <stentry><xsl:value-of select="."/></stentry>
                        </strow>
                    </xsl:for-each>
                </simpletable>
            </p>
        </section>
        
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.overwiev.dita" match="ptn:Receptors">
        <section id="section_config_{local-name()}">
            <title>Domyślne receptory</title>
            
        </section>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.overwiev.dita" match="ptn:Receptor">
        <section id="section_config_{local-name()}_{ptn:Label}">
            <title>Parametry receptora</title>
            <p>
                <simpletable frame="all" relcolwidth="1* 1* 1*" >
                    <sthead>
                        <stentry>Lp</stentry>
                        <stentry>Parametr</stentry>
                        <stentry>Wartość</stentry>
                    </sthead>
                    <xsl:for-each select="descendant-or-self::*">
                        <strow>
                            <stentry><xsl:value-of select="position()"/></stentry>
                            <stentry><xsl:value-of select="local-name()"/></stentry>
                            <stentry><xsl:value-of select="."/></stentry>
                        </strow>
                    </xsl:for-each>
                </simpletable>
            </p>
        </section>
        
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.overwiev.dita" match="ptn:Inputs">
        <section id="section_config_{local-name()}">
            <title>Domyślne zadane wzbudzenia</title>
            
        </section>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.overwiev.dita" match="ptn:Input">
        <section id="section_config_{local-name()}_{ptn:Input_exec_time}_{count(preceding-sibling::ptn:Input)}">
            <title>Parametry receptora</title>
            <p>
                <simpletable frame="all" relcolwidth="1* 1* 1*" >
                    <sthead>
                        <stentry>Lp</stentry>
                        <stentry>Parametr</stentry>
                        <stentry>Wartość</stentry>
                    </sthead>
                    <xsl:for-each select="descendant-or-self::*">
                        <strow>
                            <stentry><xsl:value-of select="position()"/></stentry>
                            <stentry><xsl:value-of select="local-name()"/></stentry>
                            <stentry><xsl:value-of select="."/></stentry>
                        </strow>
                    </xsl:for-each>
                </simpletable>
            </p>
        </section>
        
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.overwiev.dita" match="ptn:Simulation">
        <section id="section_config_{local-name()}">
            <title>Granice czasowe symulacji</title>
            <p>
                <simpletable frame="all" relcolwidth="1* 1* 1*" >
                    <sthead>
                        <stentry>Lp</stentry>
                        <stentry>Parametr</stentry>
                        <stentry>Wartość</stentry>
                    </sthead>
                    <xsl:for-each select="descendant-or-self::*">
                        <strow>
                            <stentry><xsl:value-of select="position()"/></stentry>
                            <stentry><xsl:value-of select="local-name()"/></stentry>
                            <stentry><xsl:value-of select="."/></stentry>
                        </strow>
                    </xsl:for-each>
                </simpletable>
            </p>
        </section>
        
    </xsl:template>
    
    
</xsl:stylesheet>