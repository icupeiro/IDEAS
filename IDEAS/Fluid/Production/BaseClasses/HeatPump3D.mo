within IDEAS.Fluid.Production.BaseClasses;
model HeatPump3D "Heat pump partial"
  extends IDEAS.Fluid.Interfaces.FourPortHeatMassExchanger(
    tau1=30,
    tau2=30,
    m1_flow_nominal=dat.m1_flow_nominal,
    m2_flow_nominal=dat.m2_flow_nominal,
    dp1_nominal=if computeFlowResistance then dat.dp1_nominal else 0,
    dp2_nominal=if computeFlowResistance then dat.dp2_nominal else 0,
    vol1(V=dat.m1/Medium1.density(state_default1),
      energyDynamics=energyDynamics,
      massDynamics=massDynamics,
      prescribedHeatFlowRate=true),
    redeclare IDEAS.Fluid.MixingVolumes.MixingVolume vol2(
      V=dat.m2/Medium1.density(state_default2),
      energyDynamics=energyDynamics,
      massDynamics=massDynamics,
      prescribedHeatFlowRate=true));

  replaceable parameter IDEAS.Fluid.Production.Data.PerformanceMaps.VitoCal300GBWS301dotA45_3D dat
    constrainedby IDEAS.Fluid.Production.BaseClasses.HeatPumpData3D
    "Heat pump performance data"
    annotation (choicesAllMatching=true,Placement(transformation(extent={{60,82},{80,102}})));
  parameter Modelica.Blocks.Types.Smoothness smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments
    "Smoothness of table interpolation";
  parameter Boolean computeFlowResistance = true
    "=true, compute flow resistance. Set to false to assume no friction"
    annotation (Evaluate=true, Dialog(tab="Flow resistance"));


  Modelica.SIunits.Power QEva "Thermal power of the evaporator (positive)";
  Modelica.SIunits.Power QCon "Thermal power of the condensor (positive)";
  Real cop "COP of the heat pump";
  Modelica.Blocks.Interfaces.RealOutput P "Electrical power consumption"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={108,28})));

  IDEAS.Utilities.Tables.CombiTable3D table_a(
    final nDim1=dat.nDim1,
    final nDim2=dat.nDim2,
    final nDim3=dat.nDim3,
    final indicesDim1=dat.indicesDim1,
    final indicesDim2=dat.indicesDim2,
    final indicesDim3=dat.indicesDim3,
    final table1=dat.table1_a,
    final table2=dat.table2_a,
    final table3=dat.table3_a,
    final table4=dat.table4_a,
    final table5=dat.table5_a,
    final table6=dat.table6_a,
    final table7=dat.table7_a,
    smoothness=smoothness,
    is2Dtable=dat.inputType3 == IDEAS.Fluid.Production.BaseClasses.InputType.None)
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Sensors.Temperature senTemConIn(redeclare package Medium = Medium2)
    "Temperature sensor for condensor inlet"
    annotation (Placement(transformation(extent={{110,-40},{90,-20}})));
  Sensors.Temperature senTemEvaIn(redeclare package Medium = Medium2)
    "Temperature sensor for evaporator inlet"
    annotation (Placement(transformation(extent={{-110,40},{-90,20}})));

  Utilities.Tables.CombiTable3D table_b(
    final nDim1=dat.nDim1,
    final nDim2=dat.nDim2,
    final nDim3=dat.nDim3,
    final indicesDim1=dat.indicesDim1,
    final indicesDim2=dat.indicesDim2,
    final indicesDim3=dat.indicesDim3,
    smoothness=smoothness,
    final table1=dat.table1_b,
    final table2=dat.table2_b,
    final table3=dat.table3_b,
    final table4=dat.table4_b,
    final table5=dat.table5_b,
    final table6=dat.table6_b,
    final table7=dat.table7_b,
    is2Dtable=dat.inputType3 == IDEAS.Fluid.Production.BaseClasses.InputType.None)
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
protected
  Modelica.Blocks.Sources.RealExpression QEvap(y=-QEva)
    annotation (Placement(transformation(extent={{-72,70},{-54,50}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatEvap
    annotation (Placement(transformation(extent={{-40,70},{-20,50}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatCond
    annotation (Placement(transformation(extent={{60,-70},{40,-50}})));

  Modelica.Blocks.Sources.RealExpression QCond(y=QCon)
    annotation (Placement(transformation(extent={{86,-70},{66,-50}})));

  Modelica.Blocks.Routing.RealPassThrough inputs[6]
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.RealExpression m_flowEva(y=port_a1.m_flow)
    "Evaporator mass flow rate"
    annotation (Placement(transformation(extent={{-100,14},{-82,-6}})));
  Modelica.Blocks.Sources.RealExpression m_flowCon(y=port_a2.m_flow)
    "Condensor mass flow rate"
    annotation (Placement(transformation(extent={{-100,-6},{-82,-26}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTemEvaOut
    "Temperature sensor for evaporator outlet temperature"
    annotation (Placement(transformation(extent={{-20,34},{-32,46}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTemConOut
    "Temperature sensor for condensor outlet temperature"
    annotation (Placement(transformation(extent={{-20,-46},{-32,-34}})));
  parameter Medium1.ThermodynamicState state_default1=
      Medium1.setState_pTX(
      Medium1.p_default,
      Medium1.T_default,
      Medium1.X_default);
  parameter Medium2.ThermodynamicState state_default2=
      Medium2.setState_pTX(
      Medium2.p_default,
      Medium2.T_default,
      Medium2.X_default);

  parameter Integer inputIndex1=
    if     dat.inputType1 == IDEAS.Fluid.Production.BaseClasses.InputType.m_flowEva then 1
    elseif dat.inputType1 == IDEAS.Fluid.Production.BaseClasses.InputType.m_flowCon then 2
    elseif dat.inputType1 == IDEAS.Fluid.Production.BaseClasses.InputType.T_inEva then 3
    elseif dat.inputType1 == IDEAS.Fluid.Production.BaseClasses.InputType.T_inCon then 4
    elseif dat.inputType1 == IDEAS.Fluid.Production.BaseClasses.InputType.T_outEva then 5
    else 6;
  parameter Integer inputIndex2=
    if     dat.inputType2 == IDEAS.Fluid.Production.BaseClasses.InputType.m_flowEva then 1
    elseif dat.inputType2 == IDEAS.Fluid.Production.BaseClasses.InputType.m_flowCon then 2
    elseif dat.inputType2 == IDEAS.Fluid.Production.BaseClasses.InputType.T_inEva then 3
    elseif dat.inputType2 == IDEAS.Fluid.Production.BaseClasses.InputType.T_inCon then 4
    elseif dat.inputType2 == IDEAS.Fluid.Production.BaseClasses.InputType.T_outEva then 5
    else 6;
  parameter Integer inputIndex3=
    if     dat.inputType3 == IDEAS.Fluid.Production.BaseClasses.InputType.m_flowEva then 1
    elseif dat.inputType3 == IDEAS.Fluid.Production.BaseClasses.InputType.m_flowCon then 2
    elseif dat.inputType3 == IDEAS.Fluid.Production.BaseClasses.InputType.T_inEva then 3
    elseif dat.inputType3 == IDEAS.Fluid.Production.BaseClasses.InputType.T_inCon then 4
    elseif dat.inputType3 == IDEAS.Fluid.Production.BaseClasses.InputType.T_outEva then 5
    else 6;

equation
  QEva = P*(cop - 1);
  QCon = P*cop;

  table_a.y =
    if     dat.outputType1 == IDEAS.Fluid.Production.BaseClasses.OutputType.P then P
    elseif dat.outputType1 == IDEAS.Fluid.Production.BaseClasses.OutputType.QEva then QEva
    elseif dat.outputType1 == IDEAS.Fluid.Production.BaseClasses.OutputType.QCon then QCon
    else  cop;
  table_b.y =
    if     dat.outputType2 == IDEAS.Fluid.Production.BaseClasses.OutputType.P then P
    elseif dat.outputType2 == IDEAS.Fluid.Production.BaseClasses.OutputType.QEva then QEva
    elseif dat.outputType2 == IDEAS.Fluid.Production.BaseClasses.OutputType.QCon then QCon
    else  cop;

  connect(prescribedHeatEvap.port, vol1.heatPort) annotation (Line(
      points={{-20,60},{-10,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(prescribedHeatCond.port, vol2.heatPort) annotation (Line(
      points={{40,-60},{12,-60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(QCond.y, prescribedHeatCond.Q_flow) annotation (Line(
      points={{65,-60},{60,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(QEvap.y, prescribedHeatEvap.Q_flow) annotation (Line(
      points={{-53.1,60},{-40,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senTemConIn.port, port_a2)
    annotation (Line(points={{100,-40},{100,-60}}, color={0,127,255}));
  connect(senTemEvaIn.port, port_a1)
    annotation (Line(points={{-100,40},{-100,60}}, color={0,127,255}));
  connect(table_b.u3, table_a.u3) annotation (Line(points={{-2,-16},{-16,-16},{-16,
          4},{-2,4}}, color={0,0,127}));
  connect(table_b.u2, table_a.u2) annotation (Line(points={{-2,-10},{-14,-10},{-14,
          10},{-2,10}}, color={0,0,127}));
  connect(table_b.u1, table_a.u1) annotation (Line(points={{-2,-4},{-12,-4},{-12,
          16},{-2,16}}, color={0,0,127}));
  connect(m_flowEva.y, inputs[1].u) annotation (Line(points={{-81.1,4},{-74,4},{
          -74,0},{-62,0}}, color={0,0,127}));
  connect(m_flowCon.y, inputs[2].u) annotation (Line(points={{-81.1,-16},{-74,-16},
          {-74,0},{-62,0}}, color={0,0,127}));
  connect(senTemEvaIn.T, inputs[3].u) annotation (Line(points={{-93,30},{-80,30},
          {-66,30},{-66,0},{-62,0}}, color={0,0,127}));
  connect(senTemConIn.T, inputs[4].u) annotation (Line(points={{93,-30},{-66,-30},
          {-66,0},{-62,0}}, color={0,0,127}));
  connect(senTemEvaOut.port, vol1.heatPort) annotation (Line(points={{-20,40},{-20,
          40},{-10,40},{-10,60}}, color={191,0,0}));
  connect(senTemEvaOut.T, inputs[5].u) annotation (Line(points={{-32,40},{-66,40},
          {-66,0},{-62,0}}, color={0,0,127}));
  connect(senTemConOut.port, vol2.heatPort)
    annotation (Line(points={{-20,-40},{12,-40},{12,-60}}, color={191,0,0}));
  connect(senTemConOut.T, inputs[6].u) annotation (Line(points={{-32,-40},{-48,-40},
          {-66,-40},{-66,0},{-62,0}}, color={0,0,127}));
  connect(inputs[inputIndex1].y, table_a.u1) annotation (Line(points={{-39,0},{-12,0},{-12,
          16},{-2,16}}, color={0,0,127}));
  connect(inputs[inputIndex2].y, table_a.u2) annotation (Line(points={{-39,0},{-14,0},{-14,
          10},{-2,10}}, color={0,0,127}));
  connect(inputs[inputIndex3].y, table_a.u3) annotation (Line(points={{-39,0},{-16,0},{-16,
          4},{-2,4}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    Icon(graphics={
        Line(
          points={{-20,0},{40,2.44929e-15}},
          color={255,0,0},
          smooth=Smooth.None,
          origin={0,0},
          rotation=90,
          thickness=0.5),
        Line(
          points={{-14,21},{6,1},{-14,-23}},
          color={255,0,0},
          smooth=Smooth.None,
          origin={-1,-14},
          rotation=270,
          thickness=0.5)}),
    Documentation(revisions="<html>
    <ul>
        <li>January 2014 by Damien Picard:<br/> 
        Remove unnecessary filters + add modulation temperature security to avoid overheating and undercooling and limit number of events.
</li>
    <li>December 2014 by Damien Picard:<br/> 
    Make filter parameters final to avoid warning durings compilation.
</li>
<li>December 2014 by Damien Picard:<br/> 
Add value to internal variable modulationRate_internal to close the equations when use_modulation_security is false. Add a modulation input.
</li>
<li>November 2014 by Filip Jorissen:<br/> 
Added 'AvoidEvents' parameter, temperature protection and documentation.
</li>
<li>March 2014 by Filip Jorissen:<br/> 
Initial version
</li>
</ul>
</html>", info="<html>
<p>This partial model provides an implementation for a heat pump. Heat is drawn from the fluid at the &apos;Brine&apos; side and injected into the &apos;Fluid&apos; side. The model uses performance tables to calculate the COP and electrical power.</p>
<p><b>Main equations</b> </p>
<p>The COP and electrical power P are read from performance tables as a function of the evaporator inlet temperature and the condensor outlet temperature:</p>
<p>COP = f1(T_out_condensor, T_in_evaporator)</p>
<p>P = f2(T_out_condensor, T_in_evaporator)</p>
<p>These values are used to calculate the thermal powers:</p>
<p>Q_condensor = P*COP</p>
<p>Q_evaporator = P*(COP-1)</p>
<p>If the parameter use_scaling is true, the powers of the heat pump will be scaled with QNom / QNomRef. The nominal mass flow rate of the heat pump is also scaled to correctly scale the pressure losses.</p>
<p>The models also allows partial load if use_modulationSignal is set to true. The modulation is assumed to be ideal and it works then as a scaling input of the power.</p>
<p><br>The heat pump compressor will be switched off when:</p>
<ol>
<li>The external control signal is false</li>
<li>The over/under-temperature protection is activated</li>
</ol>
<p>In this case P will become zero. The transition from on to off can happen discretely or through a filter using the parameter &apos;avoidEvents&apos;.</p>
<h4>Assumptions and limitations </h4>
<ul>
<li>The transient behaviour of the thermodynamic cycle is not simulated.</li>
<li>The fluid mass flow rates do not have an impact on the values of COP and P.</li>
<li>Modulation of the power is not supported.</li>
<li>Maximum temperatures of the evaporator and minimum temperatures of the condensor are not considered.</li>
<li>Defrosting cycles etc are not considered.</li>
</ul>
<h4>Typical use and important parameters</h4>
<p>A record with the required parameters needs to be provided.</p>
<p><br>The parameter &apos;avoidEvents&apos; can be used to avoid an event when activating the over/under-temperature protection. When avoidEvents is true the thermal mass of the condensor and evaporator are increased to avoid undercooling/overheating the heat pump while it is switching off and the mass flow rate is zero. This factor can be quite significant and depends on the &apos;riseTime&apos;.</p>
<h4>Options</h4>
<ol>
<li>Typical options inherited through lumpedVolumeDeclarations can be used.</li>
</ol>
<h4>Validation</h4>
<p>Examples of this model can be found in<a href=\"modelica://IDEAS.Fluid.Production.Examples.HeatPump_BrineWater\"> IDEAS.Fluid.Production.Examples.HeatPump_BrineWater</a>, <a href=\"modelica://IDEAS.Fluid.Production.Examples.HeatPump_BrineWaterTset\">IDEAS.Fluid.Production.Examples.HeatPump_BrineWaterTset</a> and <a href=\"modelica://IDEAS.Fluid.Production.Examples.HeatPump_Events\">IDEAS.Fluid.Production.Examples.HeatPump_Events</a></p>
</html>"));
end HeatPump3D;