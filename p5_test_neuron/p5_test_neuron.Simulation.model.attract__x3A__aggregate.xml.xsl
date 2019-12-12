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
    
    
    <!-- przekopiowanie attract na wierzch tylko -->
    
    <xsl:template name="ptn:Simulation.attract__x3A__aggregate"><!--ptn:Simulation.attract__x3A__calculate.best.unique-->
        <ptn:Simulation.attract__x3A__aggregate>
        <!--<ptn:Simulation.attract__x3A__aggregate ptn:debug="#133 just for devel analys, passed to childs">
            <xsl:for-each-group select="descendant-or-self::ptn:Simulation.attract__x3A__calculate[number(@ptn:Simulated_potential__x3A__diff) &gt; 0 ]" group-by="@ptn:Label">
                <xsl:sort select="@ptn:Distance" data-type="number" order="ascending"/>
                <xsl:copy>
                    <xsl:attribute name="ptn:Simulation.attract__x3A__aggregate.position" select="position()"/>
                    <!-\-<xsl:attribute name="prec_silb" select="current()/preceding-sibling::ptn:Simulation.attract__x3A__calculate/@ptn:Label"/>-\-><!-\- and not(current()/preceding-sibling::ptn:Simulation.attract__x3A__calculate/@ptn:Label__x3A__context = current()/@ptn:Label) -\->
                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="*"/>
                </xsl:copy>
            </xsl:for-each-group>
        </ptn:Simulation.attract__x3A__aggregate>-->
        <!--<ptn:Simulation.attract__x3A__calculate.best.unique>
            <xsl:for-each select="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate">
                <xsl:variable name="ptn:Simulation.attract__x3A__calculate.best.unique.position" select="@ptn:Simulation.attract__x3A__calculate.best.unique.position"/>
                
                <xsl:choose>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context = current()/@ptn:Label and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <!-\-<xsl:comment>#67Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>-\->
                        <!-\-<xsl:message>#67Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:message>-\->
                        <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="67Mignored {@ptn:Label__x3A__context} to {@ptn:Label}"></ptn:Simulation.attract__x3A__calculate__x3A__ignored>
                    </xsl:when>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context = current()/@ptn:Label__x3A__context and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <!-\-<xsl:comment>#111Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>
                        <xsl:message>#111Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:message>-\->
                        <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="111Mignored {@ptn:Label__x3A__context} to {@ptn:Label}"></ptn:Simulation.attract__x3A__calculate__x3A__ignored>
                    </xsl:when>
                    <xsl:when test="$ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate.best.unique/ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context = current()/@ptn:Label__x3A__context and number(@ptn:Simulation.attract__x3A__calculate.best.unique.position) &lt; number($ptn:Simulation.attract__x3A__calculate.best.unique.position)]">
                        <!-\-<xsl:comment>#131Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:comment>
                        <xsl:message>#131Mignored <xsl:value-of select="@ptn:Label__x3A__context"/> to <xsl:value-of select="@ptn:Label"/></xsl:message>-\->
                        <ptn:Simulation.attract__x3A__calculate__x3A__ignored ptn:debug="131Mignored {@ptn:Label__x3A__context} to {@ptn:Label}"></ptn:Simulation.attract__x3A__calculate__x3A__ignored>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:copy-of select="@*"/>
                            <xsl:attribute name="ptn:debug" select="concat(@ptn:Label__x3A__context,'to',@ptn:Label)"/>
                            <!-\-<xsl:attribute name="debug.Output_Node" select="$ptn:Output_Node"/>-\->
                            <xsl:copy-of select="text()"/>
                            <xsl:copy-of select="*"/>
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </ptn:Simulation.attract__x3A__calculate.best.unique>-->
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__aggregate"/>
        </ptn:Simulation.attract__x3A__aggregate>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="*">
        <xsl:message terminate="yes">#66 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
                        
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Input__x3A__attract__x3A__vectors|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector">
        <!--<xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>-->
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Simulation.attract__x3A__calculate">
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Simulation.Stress__x3A__calculate">
            <xsl:apply-templates mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Input__x3A__attract__x3A__vectors__x3A__calculate">
        <xsl:comment>#90 [bypassed][/n][<xsl:value-of select="name()"/>]</xsl:comment>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="*">
        <xsl:message terminate="yes">#90 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Input__x3A__attract__x3A__vectors__x3A__calculate|ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate|ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate|ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment">
        <!--<xsl:comment>#90-102 [bypassed][/n][<xsl:value-of select="name()"/>]  [calculated-requirements-meet-at-]</xsl:comment>-->
        <xsl:element name="{name()}__x3A__assert">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    
    
    <!--
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_X__calculate__x3A__empty[@ptn:Coordinate_X__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_Y__calculate__x3A__empty[@ptn:Coordinate_Y__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_Z__calculate__x3A__empty[@ptn:Coordinate_Z__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <xsl:copy-of select="."/>
    </xsl:template>
    -->
    
    <!-- ATTRACT MOSTTLY METHOD -->
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_X__calculate__x3A__empty[@ptn:Coordinate_X__x3A__less_charged_node][@ptn:Coordinate_X__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio][ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <xsl:element name="{name()}__x3A__assert"><xsl:copy-of select="@*"/></xsl:element>
        <ptn:Coordinate_X ptn:debug="avg[{avg(following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate )}]*[ratio[{following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio}]]">
            <xsl:value-of select="@ptn:Coordinate_X__x3A__less_charged_node + abs(@ptn:Coordinate_X__x3A__more_charged_node - @ptn:Coordinate_X__x3A__less_charged_node )  * avg(following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate ) * following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio"/></ptn:Coordinate_X>
        <!--<ptn:Coordinate_X><xsl:value-of select="abs(ptn:Coordinate_X + $ptn:Coordinate_X) div 3"/></ptn:Coordinate_X>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_Y__calculate__x3A__empty[@ptn:Coordinate_Y__x3A__less_charged_node][@ptn:Coordinate_Y__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio][ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <xsl:element name="{name()}__x3A__assert"><xsl:copy-of select="@*"/></xsl:element>
        <ptn:Coordinate_Y><xsl:value-of select="@ptn:Coordinate_X__x3A__less_charged_node + abs(@ptn:Coordinate_Y__x3A__more_charged_node - @ptn:Coordinate_Y__x3A__less_charged_node ) * avg(following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate ) * following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio"/></ptn:Coordinate_Y>
        <!--<ptn:Coordinate_X><xsl:value-of select="abs(ptn:Coordinate_X + $ptn:Coordinate_X) div 3"/></ptn:Coordinate_X>-->
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_Y__calculate__x3A__empty[@ptn:Coordinate_Y__x3A__less_charged_node][@ptn:Coordinate_Y__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio][ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment]">
        <xsl:element name="{name()}__x3A__assert"><xsl:copy-of select="@*"/></xsl:element>
        <ptn:Coordinate_Y><xsl:value-of select="abs(@ptn:Coordinate_Y__x3A__more_charged_node + @ptn:Coordinate_Y__x3A__less_charged_node ) div 2 + following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment + 
            ( avg(following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate) + (1 - 1 div following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.increment ) ) div 2
            * following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio"/></ptn:Coordinate_Y>
        <!--<ptn:Coordinate_X><xsl:value-of select="abs(ptn:Coordinate_X + $ptn:Coordinate_X) div 3"/></ptn:Coordinate_X>-->
    </xsl:template>
    
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_Z__calculate__x3A__empty[@ptn:Coordinate_Z__x3A__less_charged_node][@ptn:Coordinate_Z__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio][ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <xsl:element name="{name()}__x3A__assert"><xsl:copy-of select="@*"/></xsl:element>
        <ptn:Coordinate_Z><xsl:value-of select="abs(@ptn:Coordinate_Z__x3A__more_charged_node + @ptn:Coordinate_Z__x3A__less_charged_node ) div 2  + avg(following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate ) * following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio"/></ptn:Coordinate_Z>
        <!--<ptn:Coordinate_X><xsl:value-of select="abs(ptn:Coordinate_X + $ptn:Coordinate_X) div 3"/></ptn:Coordinate_X>-->
    </xsl:template>
    
    
    
    <!-- STRESS MOSTTLY METHOD -->
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_X__calculate__x3A__empty[not(@ptn:Coordinate_X__x3A__less_charged_node)][@ptn:Coordinate_X__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio][ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <xsl:element name="{name()}__x3A__assert"><xsl:copy-of select="@*"/></xsl:element>
        <ptn:Coordinate_X ptn:debug="avg[{avg(following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate )}]*[ratio[{following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio}]]"
            ><xsl:value-of select="@ptn:Coordinate_X__x3A__more_charged_node + following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate * following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio"/></ptn:Coordinate_X>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_Y__calculate__x3A__empty[not(@ptn:Coordinate_Y__x3A__less_charged_node)][@ptn:Coordinate_Y__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio][ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <xsl:element name="{name()}__x3A__assert"><xsl:copy-of select="@*"/></xsl:element>
        <ptn:Coordinate_Y><xsl:value-of select="@ptn:Coordinate_Y__x3A__more_charged_node + following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate * following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio"/></ptn:Coordinate_Y>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Coordinate_Z__calculate__x3A__empty[not(@ptn:Coordinate_Z__x3A__less_charged_node)][@ptn:Coordinate_Z__x3A__more_charged_node][following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio][ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        <xsl:element name="{name()}__x3A__assert"><xsl:copy-of select="@*"/></xsl:element>
        <ptn:Coordinate_Z><xsl:value-of select="@ptn:Coordinate_Z__x3A__more_charged_node + following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate * following-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/@ptn:Coordinate__x3A__Input__X3A__attract__x3A__vector__x3A__calculate.ratio"/></ptn:Coordinate_Z>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Input__x3A__attract__x3A__vectors__calculate__x3A__empty[preceding-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate[ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate][ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate][ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate]]">
        
        <ptn:Input__x3A__attract__x3A__vectors ptn:debug="#124 to implement more than stress">
            <ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector><xsl:value-of select="avg(preceding-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector__x3A__calculate)"/></ptn:Coordinate_X__x3A__Input__X3A__attract__x3A__vector>
            <ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector><xsl:value-of select="avg(preceding-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector__x3A__calculate)"/></ptn:Coordinate_Y__x3A__Input__X3A__attract__x3A__vector>
            <ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector><xsl:value-of select="avg(preceding-sibling::ptn:Input__x3A__attract__x3A__vectors__x3A__calculate/ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector__x3A__calculate)"/></ptn:Coordinate_Z__x3A__Input__X3A__attract__x3A__vector>
        </ptn:Input__x3A__attract__x3A__vectors>
    </xsl:template>
    
    
    
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Simulation.attract__x3A__calculate[@ptn:Label__x3A__context]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label__x3A__context" select="@ptn:Label__x3A__context" tunnel="no"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Simulation.Stress__x3A__calculate[@ptn:Label__x3A__context]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Label__x3A__context" select="@ptn:Label__x3A__context" tunnel="no"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Simulation.Stress__x3A__calculate__x3A__output_node">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
        
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Simulation.attract__x3A__calculate__x3A__output_node">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Label|ptn:Coordinate_X|ptn:Coordinate_Y|ptn:Coordinate_Z">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Capacitance|ptn:Resistance|ptn:Minimum_voltage|ptn:Maximum_voltage">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Resting_potential|ptn:Reset_potential|ptn:Firing_threshold|ptn:Refactory_period">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Is_inhibitor">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Simulated_potential">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Current_synapse">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Maximum_current|ptn:Time_constant|ptn:Delay|ptn:Output_Node">
        <xsl:copy-of select="."></xsl:copy-of>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Input__x3A__nodes">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Input__x3A__node">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Outputs">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Input__x3A__nodes__x3A__prohibit">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Input__x3A__node__x3A__prohibit">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Output__x3A__flag|ptn:Stress__x3A__flag">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate__x3A__apply" match="ptn:Output__x3A__flag__x3A__emmit">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    <!--  --><!--  --><!--  --><!--  --><!--  -->
    
    
    
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Attract__x3A__flag[not(*)]"/>
        
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Attract__x3A__flag[*]">
        <xsl:message terminate="yes">#666 unantended/n[<xsl:value-of select="name()"/>]</xsl:message>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Receptors">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Receptor[ptn:Label]">
        <xsl:apply-templates mode="#current">
            <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Nodes">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Leaky_neuron_inhibitor__X3A__AA">
        <xsl:message>#72 todo why not working other templ cont</xsl:message>
        <xsl:apply-templates mode="#current">
            <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Leaky_neuron_inhibitor__x3A__AB">
        <xsl:message>#72B todo why not working other templ cont</xsl:message>
        <xsl:apply-templates mode="#current">
            <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
                                                                                                                                     
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Leaky_neuron_standard">
        <xsl:apply-templates mode="#current">
            <xsl:with-param name="ptn:Label" select="ptn:Label" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Coordinate_X"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Coordinate_Y"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Coordinate_Z"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Capacitance"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Resistance"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Minimum_voltage"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Maximum_voltage"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Resting_potential"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Reset_potential"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Firing_threshold"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Refactory_period"/>
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Is_inhibitor"/>
  
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Input__x3A__nodes"/>

    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Outputs"/>
    
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Label"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Simulated_potential|ptn:Simulated_potential__x3A__vectors.sum|ptn:Receptor_regex_filter"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Output__x3A__flag|ptn:Stress__x3A__flag|ptn:Output__x3A__flag__x3A__emmit"/>
    
    <xsl:template mode="ptn:Simulation.attract__x3A__aggregate" match="ptn:Input__x3A__nodes__x3A__prohibit"/>
    
    
</xsl:stylesheet>