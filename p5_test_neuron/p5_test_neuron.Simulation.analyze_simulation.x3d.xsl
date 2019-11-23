<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ptn="p5_test_neuron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:math="http://exslt.org/math"
    xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    <xsl:output indent="yes" method="xml" /><!-- doctype-public="ISO//Web3D//DTD X3D 3.0//EN" doctype-system="http://www.web3d.org/specifications/x3d-3.0.dtd" -->
    <xsl:strip-space elements="*"/>
    
    <xsl:include href="p5_test_neuron.param.xsl"/>
    
    <xsl:include href="p5_test_neuron.Simulation.analyze_simulation.x3d.Current_synapse.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.analyze_simulation.x3d.Nodes.xsl"/>
    <xsl:include href="p5_test_neuron.Simulation.analyze_simulation.x3d.Current_synapse.Input.xsl"/>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d" match="ptn:Simulation.analyze_simulation.xml">
        <!--<X3D version="3.0" profile="Immersive" 
            xmlns:xsd="http://www.w3.org/2001/XMLSchema-instance"
            xsd:noNamespaceSchemaLocation="http://www.web3d.org/specifications/x3d-3.0.xsd">
            
            <head>
                <meta name="filename" content="Simulation.analyze_simulation.x3d" />
                <meta name="generator" content="Procesy5 arkadiusz binder xslt 2019-11" />
            </head>
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene"/>
        </X3D>-->
        <html>
            <!--<head>
                <xsl:element name="meta">
                    <xsl:attribute name="http-equiv">X-UA-Compatible</xsl:attribute>
                    <xsl:attribute name="content">IE=edge</xsl:attribute>
                        <title>Analyze procesy5  neuron</title>
                        <script type="text/javascript" src="https://www.x3dom.org/download/x3dom.js"/>
                        <link rel="stylesheet" type="text/css" href="https://www.x3dom.org/download/x3dom.css"/>
                </xsl:element>
            </head>-->
            <head>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                    <title>X3Dom Example OnOutputChange Event</title>
                    <script type="text/javascript" src="https://x3dom.org/release/x3dom.js"><xsl:text> </xsl:text></script>
                    <link rel="stylesheet" type="text/css" href="https://www.x3dom.org/download/x3dom.css"/>
                        
                        
                        
                 
            </head>
            <body>
                <p>
                    Testing sequence capable neurons
                </p>
                <x3d width="800px" height="600px" 
                    xsi:noNamespaceSchemaLocation="http://www.web3d.org/specifications/x3d-3.0.xsd"
                    >
                    <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene">
                        <xsl:with-param name="ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage" select="$ptn:Simulation.analyze_simulation.xml__x3A__Minimum_voltage" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage" select="$ptn:Simulation.analyze_simulation.xml__x3A__Maximum_voltage" tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulation.analyze_simulation.xml" select="." tunnel="yes"/>
                        <xsl:with-param name="ptn:Simulation_body_tick__x3A__max" select="max(descendant-or-self::ptn:Simulation.analys.xml__x3A__analyze/number(@ptn:Simulation_body_tick))" tunnel="yes"/>
                    </xsl:call-template>
                </x3d>
                <button onclick="document.getElementById('rows').setAttribute('set_bind','true');">rows</button>
                <button onclick="document.getElementById('top').setAttribute('set_bind','true');">top </button>
            </body>
        </html>
    </xsl:template>
    
    
    
    
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene">
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group">
            <xsl:call-template name="ptn:Simulator_tick__x3A__for-each-group"/>
        </xsl:param>
        <xsl:param name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF">
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF">
                <xsl:with-param name="ptn:Simulator_tick__x3A__for-each-group" tunnel="yes" select="$ptn:Simulator_tick__x3A__for-each-group"/>
                <xsl:with-param name="ptn:Simulation__x3A__TimeSensor" select="'ColorAnimationTimer'" tunnel="yes"/><!-- todo  -->
            </xsl:call-template>
        </xsl:param>
        
        <scene render="true" bboxcenter="0,0,0" bboxsize="-1,-1,-1" pickmode="idBuf" dopickpass="true">
            <!--<xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.NavigationInfo"/>
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Background"/>
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Lamp"/>
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Camera"/>-->
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.Viewpoint"/>
            <xsl:copy-of select="$ptn:Simulator_tick__x3A__for-each-group"></xsl:copy-of>
            <xsl:copy-of select="$ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF"/>
            <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.timesensor"/>
            <!--<xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF__x3A__apply" select="$ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF"/>-->
            <!--<Group DEF='ColorAnimation'>-->
                <!--<TimeSensor DEF='ColorAnimationTimer'
                    loop='true'/>-->
                <!--<ColorInterpolator DEF='Neon17EmissiveColorInterpolator'
                    key='0, 0.2, 0.4, 0.6, 0.8, 1'
                    keyValue='1 0 0, 0.460235 0 1, 0 0.398733 1, 0.363921 1 0.0478005, 1 0.7155 0, 1 0 0'/>-->
               
            <!--</Group>-->
            <!--<Shape DEF='C'>
                <Appearance>
                    <Material DEF='Neon17'
                        ambientIntensity='0'
                        diffuseColor='0 0 0'
                        specularColor='0.622449 0.622449 0.622449'
                        emissiveColor='0.345967 0 1'
                        shininess='0.8'/>
                </Appearance>
                <sphere solid="true" ccw="true" usegeocache="true" lit="true" radius="1" subdivision="24,24"><xsl:text> </xsl:text></sphere>      				
            </Shape>-->
          <!--  <ROUTE fromNode='time' fromField='fraction_changed' toNode='Neon17EmissiveColorInterpolator' toField='set_fraction'><xsl:text> </xsl:text></ROUTE>
            <ROUTE fromNode='Neon17EmissiveColorInterpolator' fromField='value_changed' toNode='A_Material' toField='set_emissiveColor'><xsl:text> </xsl:text></ROUTE>
            -->
        </scene>
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF">
        <!-- get elements DEF -->
        <!--<xsl:param name="ptn:Coordinate_Z" select="0"/>-->
        <xsl:param name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.scale">1,1,1</xsl:param>
        <xsl:param name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.rotation">0,0,0,0</xsl:param>
        <xsl:param name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.bboxsize">-1,-1,-1</xsl:param>
        <xsl:param name="ptn:Simulation_body_tick__x3A__max" tunnel="yes" required="yes"/>
        <!--<ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF>-->
        <!-- BEGIN ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF --><!-- BEGIN ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF --><!-- BEGIN ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF -->
        <xsl:message>#132 [SCENE][GroupDEF='ColorAnimation'[]]</xsl:message>
        <Group DEF='ColorAnimation'>
            <TimeSensor DEF='ColorAnimationTimer'
                cycleinterval="{$ptn:Simulation_body_tick__x3A__max div 2}"  
                loop='true'/><!-- time="10" -->
            <xsl:for-each-group select="descendant-or-self::*[@ptn:Label__x3A__analyze]" group-by="@ptn:Label__x3A__analyze">
                <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Group"  select=".">
                    <xsl:with-param name="ptn:Label__x3A__analyze" select="@ptn:Label__x3A__analyze" tunnel="yes"/>
                </xsl:apply-templates>
            </xsl:for-each-group>
        </Group>
        
        
        <xsl:for-each-group select="descendant-or-self::*[@ptn:Label__x3A__analyze]" group-by="@ptn:Label__x3A__analyze">
            
            <transform render="true" bboxcenter="0,0,0"
                center="0,0,0"
                scaleorientation="0,0,0,0"
                bboxsize="{$ptn:Simulation.analyze_simulation.x3d.Scene.Transform.bboxsize}">
                <xsl:attribute name="DEF" select="@ptn:Label__x3A__analyze"/>
                <xsl:attribute name="id" select="@ptn:Label__x3A__analyze"/>
                <xsl:attribute name="translation">
                    <xsl:value-of select="@ptn:Coordinate_X"/><xsl:text> </xsl:text><xsl:value-of select="@ptn:Coordinate_Y"/><xsl:text> </xsl:text><xsl:value-of select="@ptn:Coordinate_Z"/>
                </xsl:attribute>
                <xsl:attribute name="scale" select="$ptn:Simulation.analyze_simulation.x3d.Scene.Transform.scale"/>
                <xsl:attribute name="rotation" select="$ptn:Simulation.analyze_simulation.x3d.Scene.Transform.rotation"/>
                <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform"  select=".">
                    <xsl:with-param name="ptn:Label__x3A__analyze" select="@ptn:Label__x3A__analyze" tunnel="yes"/>
                </xsl:apply-templates>
            </transform>                
        </xsl:for-each-group>
        <xsl:for-each-group select="descendant-or-self::*[@ptn:Label__x3A__analyze]" group-by="@ptn:Label__x3A__analyze">
            <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.ROUTE"  select=".">
                <xsl:with-param name="ptn:Label__x3A__analyze" select="@ptn:Label__x3A__analyze" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:for-each-group>
        
        <!-- EOF ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF --><!-- EOF ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF --><!-- EOF ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF -->
        
        
        <Group>
            <!--<Shape>
                <LineSet vertexCount='2'>
                    <Coordinate DEF="Current_synapse_LineSet" point='5 0 0 1 5 0' />
                </LineSet>
                <Appearance>
                    <Material emissiveColor='1 0 0' DEF="Current_synapse_emissiveColor"/>
                    <LineProperties linewidthScaleFactor='5'/>
                </Appearance>
            </Shape>-->
            
            <xsl:for-each-group select="descendant-or-self::*[@ptn:Label__x3A__analyze]/ptn:Current_synapse__x3A__analyze" group-by="concat(parent::*/@ptn:Label__x3A__analyze,'-',@ptn:Output_Node__x3A__analyze)">
                <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Shape"  select=".">
                    <xsl:with-param name="ptn:Label__x3A__analyze" select="parent::*/@ptn:Label__x3A__analyze" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_X" select="parent::*/@ptn:Coordinate_X" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_Y" select="parent::*/@ptn:Coordinate_Y" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_Z" select="parent::*/@ptn:Coordinate_Z" tunnel="yes"/>
                </xsl:apply-templates>
            </xsl:for-each-group>
        </Group>
        <Group DEF="CoordAnimation"> 
            <TimeSensor DEF='CoordAnimation_Clock' loop="true" cycleinterval="2"  time="10"><xsl:text> </xsl:text></TimeSensor>
            
            <!--<CoordinateInterpolator DEF='Current_synapse_CoordinateInterpolator' key='0, 1' keyValue='0 0 0 1 5 0 ,  0 0 1 1 10 0'><xsl:text> </xsl:text></CoordinateInterpolator>
            <ColorInterpolator DEF="Current_synapse_ColorInterpolator"
                keyValue="1 0 0 , 0 0 1 , 0 1 0 , 0 0 0 , 0.30 0 0 , 0.30 0 0 , 0.30 0 0 , 0.30 0 0 , 0.30 0 0 , 0.30 0 0 , 0.30 0 0 "
                key="0, 0.18, 0.27, 0.36, 0.45, 0.55, 0.64, 0.73, 0.82, 0.91, 1"><xsl:text> </xsl:text></ColorInterpolator>-->
            
            
            <xsl:for-each-group select="descendant-or-self::*[@ptn:Label__x3A__analyze]/ptn:Current_synapse__x3A__analyze" group-by="concat(parent::*/@ptn:Label__x3A__analyze,'-',@ptn:Output_Node__x3A__analyze)">
                <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Group"  select=".">
                    <xsl:with-param name="ptn:Label__x3A__analyze" select="parent::*/@ptn:Label__x3A__analyze" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_X" select="parent::*/@ptn:Coordinate_X" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_Y" select="parent::*/@ptn:Coordinate_Y" tunnel="yes"/>
                    <xsl:with-param name="ptn:Coordinate_Z" select="parent::*/@ptn:Coordinate_Z" tunnel="yes"/>
                </xsl:apply-templates>
            </xsl:for-each-group>
        </Group>
        
        <xsl:for-each-group select="descendant-or-self::*[@ptn:Label__x3A__analyze]/ptn:Current_synapse__x3A__analyze" group-by="concat(parent::*/@ptn:Label__x3A__analyze,'-',@ptn:Output_Node__x3A__analyze)">
            <xsl:apply-templates mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.ROUTE"  select=".">
                <xsl:with-param name="ptn:Label__x3A__analyze" select="parent::*/@ptn:Label__x3A__analyze" tunnel="yes"/>
                <xsl:with-param name="ptn:Coordinate_X" select="parent::*/@ptn:Coordinate_X" tunnel="yes"/>
                <xsl:with-param name="ptn:Coordinate_Y" select="parent::*/@ptn:Coordinate_Y" tunnel="yes"/>
                <xsl:with-param name="ptn:Coordinate_Z" select="parent::*/@ptn:Coordinate_Z" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:for-each-group>
        <!-- 
        <ROUTE fromNode="ColorAnimationTimer"  fromField="fraction_changed" toNode="Current_synapse_ColorInterpolator" toField="set_fraction"><xsl:text> </xsl:text></ROUTE>
        <ROUTE fromNode="Current_synapse_ColorInterpolator"  fromField="value_changed" toNode="Current_synapse_emissiveColor" toField="set_emissiveColor"><xsl:text> </xsl:text></ROUTE>
        
        <ROUTE fromNode='CoordAnimation_Clock' fromField='fraction_changed' toNode='Current_synapse_CoordinateInterpolator' toField='set_fraction'><xsl:text> </xsl:text></ROUTE>
        <ROUTE fromNode='Current_synapse_CoordinateInterpolator' fromField='value_changed' toNode='Current_synapse_LineSet' toField='point'><xsl:text> </xsl:text></ROUTE> -->
        <!--</ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF>-->
        
        
        <!-- BEGIN Current_synapse.Input --><!-- BEGIN Current_synapse.Input -->
        <xsl:message>#229 [SCENE][ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Interpolator]</xsl:message>
        <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Interpolator">
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__type" select="'CoordinateInterpolator'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" select="'Current_synapse.Input'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" select="'Coordinate'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" select="'point'" tunnel="yes"/>
        </xsl:call-template>
        <xsl:message>#236 [SCENE][ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Shape]</xsl:message>
        <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Shape">
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__type" select="'CoordinateInterpolator'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" select="'Current_synapse.Input'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" select="'Coordinate'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" select="'point'" tunnel="yes"/>
        </xsl:call-template>
        <xsl:message>#244 [SCENE][ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Route]</xsl:message>
        <xsl:call-template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Current_synapse.Input.Route">
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__type" select="'CoordinateInterpolator'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" select="'Current_synapse.Input'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target" select="'Coordinate'" tunnel="yes"/>
            <xsl:with-param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" select="'point'" tunnel="yes"/>
        </xsl:call-template>
        
        
        <!-- END Current_synapse.Input --><!-- BEGIN Current_synapse.Input -->
        
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Lamp">
        <Transform DEF="Lamp_TRANSFORM"
            translation="-11.000000 -1.000000 -8.000000"
            scale="1.000000 1.000000 1.000000"
            rotation="-0.930248 -0.309006 0.197874 2.788391"
            >
            <DirectionalLight DEF="LA_Lamp"
                ambientIntensity="0.0000"
                color="1.0000 1.0000 1.0000"
                intensity="0.2686"
                direction="-0.0000 -0.0000 -1.0000"
            />
        </Transform>
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Camera">
        <Transform DEF="Camera_TRANSFORM"
            translation="-12.079477 6.849407 9.335769"
            scale="1.000000 1.000000 1.000000"
            rotation="-0.589434 -0.795928 -0.138079 0.839287"
            >
            <Viewpoint DEF="CA_Camera"
                centerOfRotation="0 0 0"
                position="0.00 -0.00 0.00"
                orientation="0.65 0.76 0.05 0.00"
                fieldOfView="1.651"
            />
        </Transform>
    </xsl:template>
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF__x3A__apply" match="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF">
        <xsl:apply-templates mode="#current"/>
    </xsl:template> 
    
    
    <xsl:template mode="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF__x3A__apply" match="DEF">
        <Transform>
            <xsl:copy-of select="@DEF"/>
            <xsl:copy-of select="@translation"/>
            <xsl:copy-of select="@scale"/>
        </Transform>
    </xsl:template>
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.NavigationInfo">
        <NavigationInfo headlight="false"
            visibilityLimit="0.0"
            type='"EXAMINE", "ANY"'
            avatarSize="0.25, 1.75, 0.75"
        />
    </xsl:template>
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Background">
        <Background DEF="WO_World"
            groundColor="0.051 0.051 0.051"
            skyColor="0.051 0.051 0.051"
        />
    </xsl:template>
    
    
    
    
    
    
    <xsl:template name="ptn:Simulator_tick__x3A__for-each-group">
        <ptn:Simulator_tick__x3A__for-each-group name="{name()}">
            <xsl:choose>
                <xsl:when test="ptn:Simulation.analys.xml__x3A__analyze/@ptn:Simulation_body_tick">
                    <xsl:message>#322 ok[/@ptn:Simulation_body_tick[<xsl:value-of select="ptn:Simulation.analys.xml__x3A__analyze[1]/@ptn:Simulation_body_tick"/>]]</xsl:message>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes">#325  [MISSING][ptn:Simulation.analys.xml__x3A__analyze/@ptn:Simulation_body_tick]</xsl:message>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each-group select="ptn:Simulation.analys.xml__x3A__analyze" group-by="@ptn:Simulation_body_tick">
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                </xsl:copy>
            </xsl:for-each-group>
        </ptn:Simulator_tick__x3A__for-each-group>
    </xsl:template>
    
    
    
    
    
    
    
    <xsl:attribute-set name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape">
        <xsl:attribute name="render" select="true()"/>
        <xsl:attribute name="bboxcenter">0,0,0</xsl:attribute>
        <xsl:attribute name="bboxsize">-1,-1,-1</xsl:attribute>
        <xsl:attribute name="ispickable" select="true()"/>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape.appearance">
        <xsl:attribute name="sorttype">auto</xsl:attribute>
        <xsl:attribute name="alphaclipthreshold">0.1</xsl:attribute>
    </xsl:attribute-set>
    
    
    <xsl:attribute-set name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.shape.appearance.material">
        <xsl:attribute name="ambientintensity">0.2</xsl:attribute>
        <xsl:attribute name="emissivecolor">0,0,0</xsl:attribute>
        <xsl:attribute name="shininess">0.2</xsl:attribute>
        <xsl:attribute name="specularcolor">0,0,0</xsl:attribute>
    </xsl:attribute-set>
    
    
    <xsl:template name="ptn:MFVec3f__x3A__sequence">
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__sequence__x3A__last" required="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__distance" required="no" select="-1"/>
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__local"/>
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__remote"/>
        
        <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text>
        <xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text>
        <xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test="$ptn:MFVec3f__x3A__distance = -1">
                <xsl:value-of select="$ptn:Coordinate_X__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z__x3A__remote"/><xsl:text> </xsl:text>
            </xsl:when>
            <xsl:when test="$ptn:MFVec3f__x3A__distance = 0">
                <xsl:value-of select="$ptn:Coordinate_X"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z"/><xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">#364 $ptn:MFVec3f__x3A__distance[ELSE]</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
        
        <xsl:choose>
            <xsl:when test="$ptn:MFVec3f__x3A__sequence__x3A__last = true()"></xsl:when>
            <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template name="ptn:MFVec3f__x3A__section__x3A__sequence">
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__sequence__x3A__last" required="yes"/>
        <xsl:param name="ptn:MFVec3f__x3A__distance__x3A__percent" required="no" tunnel="yes"/><!-- 0...1 -->
        <xsl:param name="ptn:MFVec3f__x3A__length" required="yes" tunnel="yes"/><!-- suma  ptn:Input_exec_Time_constant__x3A__analyze -->
        <!-- todo dlugosc -->
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive" required="yes" tunnel="yes"/>
        <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min" select="min($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys//ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position)"/>
        <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_max" select="max($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys//ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position)"/>
        <xsl:variable name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count" select="count($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys//ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position)"/>
        
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__local"/>
        <xsl:call-template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__remote"/>
        
        <xsl:variable name="x" select="- $ptn:Coordinate_X + $ptn:Coordinate_X__x3A__remote"/>
        <xsl:variable name="y" select="- $ptn:Coordinate_Y + $ptn:Coordinate_Y__x3A__remote"/>
        <xsl:variable name="z" select="- $ptn:Coordinate_Z + $ptn:Coordinate_Z__x3A__remote"/>
        <xsl:variable name="xt" select="$ptn:Coordinate_X - $x"/>
        <xsl:variable name="yt" select="$ptn:Coordinate_Y - $y"/>
        <xsl:variable name="zt" select="$ptn:Coordinate_Z - $z"/>
        <xsl:variable name="percent" select="($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position - $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min ) div   $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/>
        <xsl:variable name="percent_more" select="($ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position - $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min + 0.5 ) div   $ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/>
        <!--<xsl:text>xt:</xsl:text><xsl:value-of select="$xt"/><xsl:text>  </xsl:text>
        <xsl:text>yt:</xsl:text><xsl:value-of select="$yt"/><xsl:text>  </xsl:text>
        <xsl:text>zt:</xsl:text><xsl:value-of select="$zt"/><xsl:text>  </xsl:text>
        <xsl:text>%:</xsl:text><xsl:value-of select="$percent"/><xsl:text>  </xsl:text>-->
        <xsl:choose>
            <xsl:when test="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__inactive = true()">
                <xsl:value-of select="$ptn:Coordinate_X__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z__x3A__remote"/><xsl:text> </xsl:text>
                
                <xsl:value-of select="$ptn:Coordinate_X__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z__x3A__remote"/><xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ptn:Coordinate_X - $xt * $percent"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y - $yt * $percent"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z - $zt * $percent"/><xsl:text> </xsl:text>
                
                <xsl:value-of select="$ptn:Coordinate_X - $xt * $percent_more"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Y - $yt * $percent_more"/><xsl:text> </xsl:text>
                <xsl:value-of select="$ptn:Coordinate_Z - $zt * $percent_more"/><xsl:text> </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
       
        <!--<xsl:text>(</xsl:text><xsl:value-of select="$percent"/><xsl:text>)[</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__current_position"/><xsl:text>][</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active"/><xsl:text>]</xsl:text>
        <xsl:text>*{min:</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_min"/><xsl:text>}{</xsl:text>
        <xsl:text>{max:</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_max"/><xsl:text>}{</xsl:text>
        <xsl:text>{cnt:</xsl:text><xsl:value-of select="$ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_analys_count"/><xsl:text>}*  </xsl:text>-->
        <!-- 1,3,2 (to)..... -5,0,4 (t1)-->
        <!-- -6,-3,-2 -->
        <!-- r t 1,3,2) + t -6 -3 -2 -->
        <!-- tx = I -6t 
        y= 3-3t
        z = 2+2t
        -->
        
        <xsl:choose>
            <xsl:when test="$ptn:MFVec3f__x3A__sequence__x3A__last = true()"></xsl:when>
            <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template name="ptn:MFColor__x3A__sequence">
        <xsl:param name="ptn:MFColor__x3A__R" required="yes" />
        <xsl:param name="ptn:MFColor__x3A__G" required="yes" />
        <xsl:param name="ptn:MFColor__x3A__B" required="yes" />
        <xsl:param name="ptn:MFColor__x3A__sequence__x3A__last" required="yes"/>
        <xsl:value-of select="$ptn:MFColor__x3A__R"/><xsl:text> </xsl:text>
        <xsl:value-of select="$ptn:MFColor__x3A__G"/><xsl:text> </xsl:text>
        <xsl:value-of select="$ptn:MFColor__x3A__B"/><xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test="$ptn:MFColor__x3A__sequence__x3A__last = true()"></xsl:when>
            <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="ptn:Simulation__x3A__ROUTE">
        <xsl:param name="ptn:Simulation__x3A__TimeSensor" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Label__x3A__analyze" required="yes" tunnel="yes"/><!-- main tag -->
        <xsl:param name="ptn:Output_Node__x3A__analyze" required="no" tunnel="yes"/><!-- remote tag -->
        <xsl:param name="ptn:Input_exec_time__x3A__initial__x3A__analyze" required="no" tunnel="yes"/><!-- extra tag -->
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" required="yes" tunnel="yes"/><!-- Current_synapse_Input -->
        <xsl:param name="ptn:Simulation__x3A__Interpolator__x3A__type" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation__x3A__Interpolator__x3A__target" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" required="yes" tunnel="yes"/>
        <ROUTE fromNode="{$ptn:Simulation__x3A__TimeSensor}"
            fromField="fraction_changed"
            toField="set_fraction">
            <xsl:attribute name="toNode">
                <xsl:call-template name="ptn:Simulation__x3A__DEF_Interpolator"/>
            </xsl:attribute>
            <xsl:text> </xsl:text></ROUTE>
        <ROUTE 
            fromField="value_changed"
            toField="{$ptn:Simulation__x3A__Interpolator__x3A__target_field}">
            <xsl:attribute name="fromNode">
                <xsl:call-template name="ptn:Simulation__x3A__DEF_Interpolator"/>
            </xsl:attribute>
            <xsl:attribute name="toNode">
                <xsl:call-template name="ptn:Simulation__x3A__DEF_target"/>
            </xsl:attribute>
            <xsl:text> </xsl:text></ROUTE>
    </xsl:template>
    
    <xsl:template name="ptn:Simulation__x3A__DEF_Interpolator">
        <xsl:param name="ptn:Label__x3A__analyze" required="yes" tunnel="yes"/><!-- main tag -->
        <xsl:param name="ptn:Output_Node__x3A__analyze" required="no" tunnel="yes"/><!-- remote tag -->
        <xsl:param name="ptn:Input_exec_time__x3A__initial__x3A__analyze" required="no" tunnel="yes"/><!-- extra tag -->
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" required="yes" tunnel="yes"/><!-- Current_synapse_Input -->
        <xsl:param name="ptn:Simulation__x3A__Interpolator__x3A__target" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation__x3A__Interpolator__x3A__type" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" required="yes" tunnel="yes"/>
        <xsl:value-of select="$ptn:Label__x3A__analyze"/><xsl:text>_</xsl:text>
        <xsl:choose>
            <xsl:when test="$ptn:Output_Node__x3A__analyze"><xsl:value-of select="$ptn:Output_Node__x3A__analyze"/><xsl:text>_</xsl:text></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$ptn:Input_exec_time__x3A__initial__x3A__analyze"><xsl:value-of select="$ptn:Input_exec_time__x3A__initial__x3A__analyze"/><xsl:text>_</xsl:text></xsl:when>
        </xsl:choose>
        <xsl:value-of select="$ptn:Simulation__x3A__DEF__x3A__elements__x3A__group"/><xsl:text>_</xsl:text>
        <xsl:value-of select="$ptn:Simulation__x3A__Interpolator__x3A__type"/><xsl:text>_</xsl:text>
        <xsl:value-of select="$ptn:Simulation__x3A__Interpolator__x3A__target_field"/>
    </xsl:template>
    
    <xsl:template name="ptn:Simulation__x3A__DEF_target">
        <xsl:param name="ptn:Label__x3A__analyze" required="yes" tunnel="yes"/><!-- main tag -->
        <xsl:param name="ptn:Output_Node__x3A__analyze" required="no" tunnel="yes"/><!-- remote tag -->
        <xsl:param name="ptn:Input_exec_time__x3A__initial__x3A__analyze" required="no" tunnel="yes"/><!-- extra tag -->
        <xsl:param name="ptn:Simulation__x3A__DEF__x3A__elements__x3A__group" required="yes" tunnel="yes"/><!-- Current_synapse_Input -->
        <xsl:param name="ptn:Simulation__x3A__Interpolator__x3A__target" tunnel="yes" required="yes"/>
        <xsl:param name="ptn:Simulation__x3A__Interpolator__x3A__target_field" required="yes" tunnel="yes"/>
        <xsl:value-of select="$ptn:Label__x3A__analyze"/><xsl:text>_</xsl:text>
        <xsl:choose>
            <xsl:when test="$ptn:Output_Node__x3A__analyze"><xsl:value-of select="$ptn:Output_Node__x3A__analyze"/><xsl:text>_</xsl:text></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$ptn:Input_exec_time__x3A__initial__x3A__analyze"><xsl:value-of select="$ptn:Input_exec_time__x3A__initial__x3A__analyze"/><xsl:text>_</xsl:text></xsl:when>
        </xsl:choose>
        <xsl:value-of select="$ptn:Simulation__x3A__DEF__x3A__elements__x3A__group"/><xsl:text>_</xsl:text>
        <xsl:value-of select="$ptn:Simulation__x3A__Interpolator__x3A__target"/><xsl:text>_</xsl:text>
        <xsl:value-of select="$ptn:Simulation__x3A__Interpolator__x3A__target_field"/>
    </xsl:template>
    
    
    <xsl:template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__local">
        <xsl:param name="ptn:Coordinate_X" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="yes" tunnel="yes"/>
        <xsl:if test="string-length($ptn:Coordinate_X) = 0"><xsl:message terminate="yes">#63X ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
        <xsl:if test="string-length($ptn:Coordinate_Y) = 0"><xsl:message terminate="yes">#63Y ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
        <xsl:if test="string-length($ptn:Coordinate_Z) = 0"><xsl:message terminate="yes">#63Z ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
    </xsl:template>
    
    <xsl:template name="ptn:MFVec3f__x3A__sequence__x3A__validate__x3A__remote">
        <xsl:param name="ptn:Coordinate_X" required="no" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y" required="no" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z" required="no" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_X__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Y__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:param name="ptn:Coordinate_Z__x3A__remote" required="yes" tunnel="yes"/>
        <xsl:if test="string-length($ptn:Coordinate_X__x3A__remote) = 0"><xsl:message terminate="yes">#63XX ERROR Current_synapse.Input.Shape with data  [<xsl:value-of select="$ptn:Coordinate_X"/>][<xsl:value-of select="$ptn:Coordinate_Y"/>][<xsl:value-of select="$ptn:Coordinate_Z"/>]TO-[<xsl:value-of select="$ptn:Coordinate_X__x3A__remote"/>][<xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/>][<xsl:value-of select="$ptn:Coordinate_Y__x3A__remote"/>]</xsl:message></xsl:if>
        <xsl:if test="string-length($ptn:Coordinate_Y__x3A__remote) = 0"><xsl:message terminate="yes">#63YY ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
        <xsl:if test="string-length($ptn:Coordinate_Z__x3A__remote) = 0"><xsl:message terminate="yes">#63ZZ ERROR Current_synapse.Input.Shape with data</xsl:message></xsl:if>
    </xsl:template>
    
    <xsl:template name="ptn:Simulator_tick__x3A__for-each-group__x3A__key">
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" tunnel="yes" required="yes"/>
        <xsl:attribute name="key">
            <xsl:for-each select="1 to count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze)">
                <xsl:choose>
                    <xsl:when test="position() = last()">
                        <xsl:value-of select="1"/>
                    </xsl:when>
                    <xsl:when test="position() = 1">
                        <xsl:value-of select="0"/><xsl:text>, </xsl:text>
                    </xsl:when>
                    <xsl:otherwise><xsl:value-of select="format-number(1 div count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze) * position(), '0.00')"/><xsl:text>, </xsl:text></xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_all">
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" tunnel="yes" required="yes"/>
        <xsl:value-of select="count($ptn:Simulator_tick__x3A__for-each-group//ptn:Simulation.analys.xml__x3A__analyze)"/>
    </xsl:template>
    
    <xsl:template name="ptn:Simulator_tick__x3A__for-each-group__x3A__key__x3A__count_active">
        <xsl:param name="ptn:Simulator_tick__x3A__for-each-group" tunnel="yes" required="yes"/>
        <xsl:param name="current-group" required="yes" tunnel="yes"/>
        <xsl:value-of select="count($current-group)"/>
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.Viewpoint">
        <!--<Viewpoint id="top" position="0 0 100" orientation="0 0 0 0" description="camera"></Viewpoint>
        <Viewpoint id="rows" position="-2.43383 1.07351 -5" orientation="0 -1 0 2.06609" description="camera"></Viewpoint>-->
        
        <Viewpoint id="top"   description="camera"><!-- position="-0.07427 0.95329 -2.79608" --><!-- orientation="-0.01451 0.99989 0.00319 3.15833" -->
            <xsl:attribute name="position">
                <xsl:value-of select="max(descendant-or-self::*/@ptn:Coordinate_X) div 10"/><xsl:text> </xsl:text><xsl:value-of select="max(descendant-or-self::*/@ptn:Coordinate_Y) div 2"/><xsl:text> </xsl:text><xsl:value-of select="max(descendant-or-self::*/@ptn:Coordinate_Y) * 5"/>
            </xsl:attribute>
            <xsl:attribute name="orientation">
                <xsl:text>0 0 0 0</xsl:text>
            </xsl:attribute>
            <xsl:text> </xsl:text>
            <!-- centerOfRotation='0,0,0' fieldOfView='0.785398'  zFar='-1' zFar='-1' zNear='-1' zNear='-1'  -->
        </Viewpoint>
        <Viewpoint id="rows"   description="camera"><!-- position="-0.07427 0.95329 -2.79608" --><!-- orientation="-0.01451 0.99989 0.00319 3.15833" -->
            <xsl:attribute name="position">
                <!--<xsl:value-of select="min(descendant-or-self::*/@ptn:Coordinate_X)"/><xsl:text> </xsl:text><xsl:value-of select="min(descendant-or-self::*/@ptn:Coordinate_Y)"/><xsl:text> </xsl:text><xsl:value-of select="max(descendant-or-self::*/@ptn:Coordinate_Y) * 5"/>-->
                <xsl:text>-2.43383 1.07351 -5</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="orientation"><!-- rotate, -->
                <!--<xsl:value-of select="min(@ptn:Coordinate_X)"/><xsl:text> </xsl:text><xsl:value-of select="min(@ptn:Coordinate_Y)"/><xsl:text> 1 3.15833</xsl:text>-->
                <xsl:text>0 -1 0 2.06609</xsl:text>
            </xsl:attribute>
            <!-- centerOfRotation='0,0,0' fieldOfView='0.785398'  zFar='-1' zFar='-1' zNear='-1' zNear='-1'  -->
            <xsl:text> </xsl:text>
        </Viewpoint>
        
    </xsl:template>
    
    
    <xsl:template name="ptn:Simulation.analyze_simulation.x3d.Scene.Transform.DEF.Transform.timesensor">
        <timesensor def="time" cycleinterval="{max(descendant-or-self::*/number(@ptn:Simulation_body_tick))}" loop="true" enabled="true" first="true"><xsl:text> </xsl:text></timesensor>
    </xsl:template>
    
    
</xsl:stylesheet>