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
        <xsl:message terminate="yes">#33 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Simulation.model.validate.xml__x3A__stats">
        <xsl:comment>#33AA unantended/n[<xsl:value-of select="name()"/>]</xsl:comment>
        <!--<xsl:apply-templates mode="#current"/>-->
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Simulation.attract__x3A__aggregate">
        <ptn:Simulation.attract__x3A__aggregate__x3A__validated>
            <xsl:apply-templates mode="ptn:Simulation.model.validate.xml__x3A__apply"/>
        </ptn:Simulation.attract__x3A__aggregate__x3A__validated>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.model.validate.xml" match="ptn:Receptors|ptn:Nodes">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="*">
        <xsl:message terminate="yes">#661 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    <!-- ptn:Simulation.Stress__x3A__calculate -->
    
    
    
    
    
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
    
    <xsl:template mode="ptn:Simulation.model.validate.xml__x3A__apply" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node[ptn:Label][root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id][@ptn:Label__x3A__count__x3A__Nodes = '0']]" priority="9">
        <xsl:message terminate="no">#83-0 [VALIDATED][XPATH][]validate relation for[<xsl:value-of select="ptn:Label"/>][@id[<xsl:value-of select="@id"/>]] #[<xsl:value-of select="root()//ptn:Simulation.model.validate.xml__x3A__stats/ptn:Node[@id=current()/@id]/@ptn:Label__x3A__count__x3A__Nodes"/>] </xsl:message>
        <ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated ptn:debug=" "> <!-- #87 done to validate [ptn:Label__x3A__count?][{count($ptn:Simulation.model.validate.xml__x3A__stats//ptn:Nod[@ptn:Label__x3A__stats='_B-to-A'])}] -->
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </ptn:Simulation.attract__x3A__calculate__x3A__output_node__x3A__validated>
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