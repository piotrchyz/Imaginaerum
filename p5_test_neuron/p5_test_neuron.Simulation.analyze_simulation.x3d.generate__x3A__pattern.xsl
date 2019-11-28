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
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="*">
        <xsl:message terminate="yes">#77 [ptn:Input__x3A__generate__x3A__pattern__X3A__scene]  unantended[n][<xsl:value-of select="name()"/>]</xsl:message>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Simulation.analys.xml__x3A__analyze"/>
    
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern">
        <xsl:message>#81 DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/></xsl:message>
        <xsl:comment>#81 DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/></xsl:comment>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="Group">
        <xsl:message>#81A DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/>]  [@][<xsl:copy-of select="@*/name()"/>]</xsl:message>
        <xsl:comment>#81A DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/>]  [@][<xsl:copy-of select="@*/name()"/>]</xsl:comment>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Group__x3A__generate__x3A__pattern_Group[@ptn:Simulation__x3A__DEF__x3A__elements__x3A__group]">
        <xsl:comment>#81-37 DD [TODO][ptn:Input__x3A__generate__x3A__pattern] [/n][<xsl:value-of select="name()"/></xsl:comment>
        <Group>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" select="@ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes"/>
            </xsl:apply-templates>
            <xsl:text> </xsl:text>
        </Group>        
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__Shape">
        <Shape>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:text> </xsl:text>
        </Shape>        
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern_Group">
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes" required="yes"/>
        <xsl:comment>#54 [generate ] [n][<xsl:value-of select="name()"/>]</xsl:comment>
        <LineSet vertexCount="{count(ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector) + 1}" aaa="{ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X}">
            <Coordinate DEF="A__{$ptn:Simulation__x3A__DEF__x3A__elements__x3A__group}_LineSet">
                <xsl:attribute name="point">
                    <xsl:apply-templates mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__Lineset"/>
                </xsl:attribute>
                <xsl:text> </xsl:text>
            </Coordinate>
            <xsl:text> </xsl:text>
        </LineSet>
            <xsl:text> </xsl:text>                
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__Lineset" match="*"/>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene__Lineset" match="ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector[ptn:keyValue__generate__basepoint_1[@ptn:Coordinate_X][@ptn:Coordinate_Y][@ptn:Coordinate_Z]][ptn:keyValue__generate__basepoint_1[@ptn:Coordinate_X][@ptn:Coordinate_Y][@ptn:Coordinate_Z]]">
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes" required="yes"/>
        <LineSet vertexCount="2" aaa="{ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X}">
            <Coordinate DEF="A_{count(preceding-sibling::ptn:Input__x3A__generate__x3A__pattern_LineSet__x3A__vector)}_{$ptn:Simulation__x3A__DEF__x3A__elements__x3A__group}_LineSet">
                <xsl:attribute name="point">
                    <xsl:call-template name="ptn:MFVec3f__x3A__sequence">
                        <xsl:with-param name="ptn:Coordinate_X" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_X" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Y" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Y" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Z" select="ptn:keyValue__generate__basepoint_1/@ptn:Coordinate_Z" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_X__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_X" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Y__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Y" tunnel="yes"/>
                        <xsl:with-param name="ptn:Coordinate_Z__x3A__remote" select="ptn:keyValue__generate__basepoint_2/@ptn:Coordinate_Z" tunnel="yes"/>
                        <xsl:with-param name="ptn:MFVec3f__x3A__sequence__x3A__last" select="true()"/>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:text> </xsl:text>
            </Coordinate>
        <xsl:text> </xsl:text>
        </LineSet>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern__x3A__Appearance">
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes" required="yes"/>
        <Appearance>
            <xsl:apply-templates mode="#current"/>
            <xsl:text> </xsl:text>
        </Appearance>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern__x3A__Material">
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes" required="yes"/>
        <Material>
            <xsl:attribute name="DEF">
                <xsl:call-template name="ptn:Simulation__x3A__DEF_target">
                    <xsl:with-param name="ptn:Label__x3A__analyze" select="$ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes"/>
                    <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" select="'emissiveColor'" tunnel="yes"/>
                    <xsl:with-param name="ptn:Output_Node__x3A__analyze" tunnel="yes">Material</xsl:with-param>
                    <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" tunnel="yes">set_emissiveColor</xsl:with-param>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="emissiveColor">
                <xsl:call-template name="ptn:MFColor__x3A__sequence">
                    <xsl:with-param name="ptn:MFColor__x3A__R"  select="1"/>
                    <xsl:with-param name="ptn:MFColor__x3A__G"  select="1"/>
                    <xsl:with-param name="ptn:MFColor__x3A__B"  select="0"/>
                    <xsl:with-param name="ptn:MFColor__x3A__sequence__x3A__last" select="true()"/>
                </xsl:call-template>
            </xsl:attribute><xsl:text> </xsl:text>
        </Material>
    </xsl:template>
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern__x3A__LineProperties">
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" tunnel="yes" required="yes"/>
        <LineProperties>
            <xsl:copy-of select="@*"/>
            <xsl:text> </xsl:text>
        </LineProperties>
    </xsl:template>
    
    
    
    <xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="ptn:Input__x3A__generate__x3A__pattern_CoordinateInterpolator__x3A__vector|ptn:Input__x3A__generate__x3A__pattern__Receptor__emmit__Interpolator__x3A__vector">
        <xsl:comment>#85 [pattern generate]  unantended[n][<xsl:value-of select="name()"/>]</xsl:comment>
   </xsl:template>
    
    <!--<xsl:template mode="ptn:Input__x3A__generate__x3A__pattern__X3A__scene" match="Group|Shape|LineSet|Coordinate|Appearance|Material|LineProperties|CoordinateInterpolator|ROUTE">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:text> </xsl:text>
        </xsl:copy>        
    </xsl:template>-->
    
    
</xsl:stylesheet>