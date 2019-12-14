<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- {p5_test_neuron}Simulation.model.validate.xml -->
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Simulation.model.stats.xml[ptn:Simulation.model.validate.xml__x3A__stats]">
        <xsl:message>#16VV [ptn:Simulation.model.validate.xml] - just validate</xsl:message>
        <ptn:Simulation.model.validate.xml>
            <xsl:copy-of select="namespace::*"/>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Receptors" select="ptn:Receptors" tunnel="yes"/>
                <xsl:with-param name="ptn:Nodes" select="ptn:Nodes" tunnel="yes"/>
                <xsl:with-param name="ptn:Simulation.model.validate.xml__x3A__stats" select="ptn:Simulation.model.validate.xml__x3A__stats" tunnel="yes"/>
            </xsl:apply-templates>
        </ptn:Simulation.model.validate.xml>
        
    </xsl:template>
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="*">
        <xsl:message terminate="yes">#33 unantended/n[<xsl:value-of select="name()"/>]    [followings[<xsl:value-of select="following-sibling::*[position() &lt; 5]/name()"/>]]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Simulation.model.validate.xml__x3A__stats">
        <xsl:comment>#33AA unantended/n[<xsl:value-of select="name()"/>]     </xsl:comment>
        <!--<xsl:apply-templates mode="#current"/>-->
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Simulation.attract__x3A__aggregate">
        <ptn:Simulation.attract__x3A__aggregate__x3A__validated>
            <xsl:apply-templates mode="ptn:Simulation.model.validate.xml__x3A__apply"/>
        </ptn:Simulation.attract__x3A__aggregate__x3A__validated>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Receptors|ptn:Nodes">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Input|ptn:Input_exec_time|
        ptn:Input_exec_time__x3A__initial|ptn:Input_exec_receptor|ptn:Input_exec_Time_constant|ptn:Input_exec_Maximum_current|ptn:Input__x3A__Is_inhibitor">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z|
        ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|
        ptn:Firing_threshold|ptn:Refactory_period|ptn:Is_inhibitor|ptn:Outputs|ptn:Input__x3A__nodes|
        ptn:Simulated_potential|ptn:Receptor_regex_filter|
        ptn:Current_synapse|ptn:Maximum_current|ptn:Time_constant|ptn:Delay|ptn:Output_Node|
        ptn:Output__x3A__flag__x3A__emmit|ptn:Refactory_period__x3A__flag|
        ptn:Refactory_period__x3A__flag__x3A__until|ptn:Input__x3A__node|
        ptn:Current_synapse__x3A__emmit|ptn:Stress__x3A__flag|ptn:Attract__x3A__flag">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Input__x3A__nodes__x3A__prohibit|ptn:Input__x3A__node__x3A__prohibit">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Capacitance">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="ptn:debug">#71 [todo] validate capacitance</xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert">
        <xsl:comment>#68 bypassed[ptn:Simulation.model.validate.xml]    [n][<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Receptor[ptn:Label]|ptn:Leaky_neuron_standard[ptn:Label]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Input__x3A__attract__x3A__vectors__x3A__calculate">
        <xsl:comment >#66AT bypassed/n[<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    <!--<xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__self_node__x3A__assert">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="*">
        <xsl:message terminate="yes">#661 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Capacitance__x3A__attract__x3A__calculate__x3A__assert|
        ptn:Capacitance__x3A__calculate__x3A__empty|ptn:Capacitance__x3A__attract__x3A__calculate__x3A__input_node__x3A__assert">
        <xsl:comment>#84 bypassed [n][<xsl:value-of select="name()"/>]</xsl:comment>
        <!--<xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>-->
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Refactory_period__x3A__flag|ptn:Refactory_period__x3A__flag__x3A__until">
        <xsl:comment>#156 [bypassed][n][<xsl:value-of select="name()"/>]</xsl:comment>
        <!--<xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>-->
    </xsl:template>
    
    
    
        
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Coordinate_X__calculate__x3A__empty[@ptn:Coordinate_X__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <!--<ptn:Coordinate_X><xsl:value-of select="@ptn:Coordinate_X__x3A__more_charged_node + following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/></ptn:Coordinate_X>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Coordinate_Y__calculate__x3A__empty[@ptn:Coordinate_Y__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <!--<ptn:Coordinate_Y><xsl:value-of select="@ptn:Coordinate_Y__x3A__more_charged_node + following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/></ptn:Coordinate_Y>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Coordinate_Z__calculate__x3A__empty[@ptn:Coordinate_Z__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <!--<ptn:Coordinate_Z><xsl:value-of select="@ptn:Coordinate_Z__x3A__more_charged_node + following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/></ptn:Coordinate_Z>-->
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Input__x3A__attract__x3A__vectors__calculate__x3A__empty[preceding-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate][ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate][ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <!--<ptn:Input__x3A__attract__x3A__vectors ptn:debug="#124 to implement more than stress">
            <ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector><xsl:value-of select="preceding-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/></ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector>
            <ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector><xsl:value-of select="preceding-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/></ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector>
            <ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector><xsl:value-of select="preceding-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate"/></ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector>
        </ptn:Input__x3A__attract__x3A__vectors>-->
    </xsl:template>
    
    
    <!-- ptn:Simulation.Stress__x3A__calculate -->
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulation.Stress__x3A__calculate">
        <ptn:Simulation.Stress__x3A__calculate__x3A__validated ptn:debug="#67 TODO[VALIDATION]">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </ptn:Simulation.Stress__x3A__calculate__x3A__validated>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulation.attract__x3A__calculate[number(@ptn:Simulated_potential__x3A__diff) &gt; 0 ]"><!-- [@ptn:Simulated_potential__x3A__less_charged_node = @ptn:Label__x3A__context] -->
                <ptn:Simulation.attract__x3A__calculate__x3A__validated>
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates mode="#current"/>
                </ptn:Simulation.attract__x3A__calculate__x3A__validated>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulation.attract__x3A__calculate">
        <xsl:comment>#82 INVALIDATED[@ptn:Label__x3A__context][<xsl:value-of select="@ptn:Label__x3A__context"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[ptn:Label][root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id][@ptn:Label__x3A__count__x3A__Nodes = '0'][@ptn:Node__x3A__position = '1']]" priority="9">
        <xsl:message terminate="no">#83-0 [VALIDATED][XPATH][]validate relation for[<xsl:value-of select="ptn:Label"/>][@id[<xsl:value-of select="@id"/>]] #[<xsl:value-of select="root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id]/@ptn:Label__x3A__count__x3A__Nodes"/>] </xsl:message>
        <ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated ptn:debug=" "> <!-- #87 done to validate [ptn:Label__x3A__count?][{count($ptn:Simulation.model.validate.xml__x3A__stats//ptn:Nod[@ptn:Label__x3A__stats='_B-to-A'])}] -->
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[ptn:Label][root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id][@ptn:Label__x3A__count__x3A__Nodes = '0'][number(@ptn:Label__x3A__count) &gt; 1][number(@ptn:Node__x3A__position) &gt; 1]]" priority="9">
        <xsl:message terminate="no">#83-0-1 [NOT][VALIDATED][XPATH][@ptn:Node__x3A__position gt 1][]validate relation for[<xsl:value-of select="ptn:Label"/>][@id[<xsl:value-of select="@id"/>]] #[<xsl:value-of select="root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id]/@ptn:Label__x3A__count__x3A__Nodes"/>] </xsl:message>
        <xsl:comment>#83-0-1 matched xpath validate relation for[<xsl:value-of select="ptn:Label"/>][@id[<xsl:value-of select="@id"/>]] #[<xsl:value-of select="root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id]/@ptn:Label__x3A__count__x3A__Nodes"/>] </xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[ptn:Label][root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id][not(@ptn:Label__x3A__count__x3A__Nodes = '0')]]" priority="9">
        <xsl:message terminate="no">#83-1 matched xpath validate relation for[<xsl:value-of select="ptn:Label"/>][@id[<xsl:value-of select="@id"/>]] #[<xsl:value-of select="root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id]/@ptn:Label__x3A__count__x3A__Nodes"/>] </xsl:message>
        <xsl:comment>#83-1 matched xpath validate relation for[<xsl:value-of select="ptn:Label"/>][@id[<xsl:value-of select="@id"/>]] #[<xsl:value-of select="root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id]/@ptn:Label__x3A__count__x3A__Nodes"/>] </xsl:comment>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[ptn:Label]">
        <xsl:param name="ptn:Simulation.model.validate.xml__x3A__stats" tunnel="yes" required="yes"/>    
        <!-- czy juz nie ma go w secie -->
        <xsl:comment>#100 will decide.[<xsl:value-of select="count($ptn:Simulation.model.validate.xml__x3A__stats//ptn:Nod[@ptn:Label__x3A__stats='_B-to-A'])"/>].</xsl:comment>
        <xsl:choose>
            <!-- jak jest juz node to nie robimy -->
            <xsl:when test="$ptn:Simulation.model.validate.xml__x3A__stats//ptn:Node[@ptn:Label__x3A__stats = current()/ptn:Label][@ptn:Nodes='true']">
                <ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__not_validated ptn:debug="#54BB ptn:Node[@ptn:Label = current()/ptn:Label]=[{ptn:Label}]  [#141A]@ptn:Nodes=[true]" />
            </xsl:when>
            <!--<xsl:when test="$ptn:Simulation.model.validate.xml__x3A__stats//ptn:Node[@ptn:Label__x3A__stats = current()/ptn:Label]">
                <ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__not_validated ptn:debug="#54AA ptn:Node[@ptn:Label = current()/ptn:Label]=[{ptn:Label}]  id={ $ptn:Simulation.model.validate.xml__x3A__stats//ptn:Node[@ptn:Label__x3A__stats = current()/ptn:Label]/@id}  [c][{generate-id(.)}]" />
            </xsl:when>-->
            <xsl:when test="$ptn:Simulation.model.validate.xml__x3A__stats//ptn:Node[@ptn:Label = current()/ptn:Label]">
                <ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__not_validated ptn:debug="#54BB ptn:Node[@ptn:Label = current()/ptn:Label]=[{ptn:Label}]" />
            </xsl:when>
            <!--<xsl:when test="$ptn:Simulation.model.validate.xml__x3A__stats//ptn:Node[@ptn:Label = current()/ptn:Label]">
                <ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__not_validated ptn:debug="#54 ptn:Node[@ptn:Label = current()/ptn:Label]=[{ptn:Label}]" />
            </xsl:when>-->
            <xsl:otherwise>
                <ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated ptn:debug=" "> <!-- #87 done to validate [ptn:Label__x3A__count?][{count($ptn:Simulation.model.validate.xml__x3A__stats//ptn:Nod[@ptn:Label__x3A__stats='_B-to-A'])}] -->
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates mode="#current"/>
                </ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulation.Stress__x3A__calculate__x3A__output_node[ptn:Label]">
        <xsl:param name="ptn:Simulation.model.validate.xml__x3A__stats" tunnel="yes" required="yes"/>    
        <!-- czy juz nie ma go w secie -->
        <xsl:choose>
            <xsl:when test="$ptn:Simulation.model.validate.xml__x3A__stats//ptn:Node[@ptn:Label__x3A__stats = current()/ptn:Label][@ptn:Nodes='true']">
                <ptn:Simulation.Stress__x3A__calculate__x3A__output_node__x3A__not_validated ptn:debug="#54 ptn:Node[@ptn:Label = current()/ptn:Label]=[{ptn:Label}] [#141]@ptn:Nodes=[true]" />
            </xsl:when>
            <!--<xsl:when test="$ptn:Simulation.model.validate.xml__x3A__stats//ptn:Node[@ptn:Label = current()/ptn:Label]">
                <ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__not_validated ptn:debug="#54 ptn:Node[@ptn:Label = current()/ptn:Label]=[{ptn:Label}]" />
            </xsl:when>-->
            <xsl:otherwise>
                <ptn:Simulation.Stress__x3A__calculate__x3A__output_node__x3A__validated ptn:debug="#120 done to validate"> 
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates mode="#current"/>
                </ptn:Simulation.Stress__x3A__calculate__x3A__output_node__x3A__validated>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Label">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Maximum_voltage|ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Refactory_period|ptn:Is_inhibitor|ptn:Outputs">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
   
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Input__x3A__nodes">
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:apply-templates mode="#current"/>
                </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Input__x3A__node">
        <xsl:param name="ptn:Simulation.model.validate.xml__x3A__stats" tunnel="yes" required="yes"/>
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="$ptn:Simulation.model.validate.xml__x3A__stats//ptn:Input__x3A__stats[@ptn:Input__x3A__node = current()/text()]">
                    <xsl:attribute name="ptn:Simulation.model.validate.xml__x3A__apply__x3A__error">#127 ptn:Input__x3A__stats[@ptn:Input__x3A__node = current()/text()]</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:value-of select="."/>
        </xsl:copy>
    </xsl:template>
   
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulated_potential">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Input__x3A__nodes__x3A__prohibit">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Input__x3A__node__x3A__prohibit">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
</xsl:stylesheet>