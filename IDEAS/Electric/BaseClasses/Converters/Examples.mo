within IDEAS.Electric.BaseClasses.Converters;
package Examples "Converter examples"
extends Modelica.Icons.ExamplesPackage;
  model converterPower
  extends Modelica.Icons.Example;

    ConvertersPower.Converter converter(AC=false, eff=0.95)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.Ramp ramp(
      duration=5,
      startTime=5,
      height=-1000)
      annotation (Placement(transformation(extent={{-74,-10},{-54,10}})));

  equation
    connect(ramp.y, converter.PIn) annotation (Line(
        points={{-53,0},{-10.8,0}},
        color={0,0,127},
        smooth=Smooth.None));
  annotation (Diagram(graphics));
  end converterPower;

  model Rectifier_3phase
  extends Modelica.Icons.Example;

    Modelica.Electrical.Analog.Basic.Resistor resistor(R=380) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={50,10})));
    Converters.ConvertersPin.Rectifier aCDC_Singlephase(
      inverter=false,
      numPha=3,
      eff=0.95)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica.Electrical.Analog.Basic.Ground ground1
      annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource
      voltageSource1(
      f=50,
      V=230,
      phi=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-10})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground2
      annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource
      voltageSource2(
      f=50,
      V=230,
      phi(displayUnit="rad") = 2*Modelica.Constants.pi/3)
             annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-22})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground3
      annotation (Placement(transformation(extent={{-60,-72},{-40,-52}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource
      voltageSource3(
      f=50,
      V=230,
      phi=4*Modelica.Constants.pi/3)
             annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-30})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground4
      annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  equation
    connect(aCDC_Singlephase.pin_pDC, resistor.n) annotation (Line(
        points={{10,10},{40,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor.p, aCDC_Singlephase.pin_nDC) annotation (Line(
        points={{60,10},{70,10},{70,-10},{10,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(aCDC_Singlephase.pin_nDC, ground1.p) annotation (Line(
        points={{10,-10},{10,-40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(voltageSource1.pin_p, aCDC_Singlephase.pin_pAC[1]) annotation (Line(
        points={{-70,0},{-40.4,0},{-40.4,0.666667},{-10.8,0.666667}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSource2.pin_p, aCDC_Singlephase.pin_pAC[2]) annotation (Line(
        points={{-50,-12},{-30,-12},{-30,-5.55112e-017},{-10.8,-5.55112e-017}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSource3.pin_p, aCDC_Singlephase.pin_pAC[3]) annotation (Line(
        points={{-30,-20},{-20,-20},{-20,-0.666667},{-10.8,-0.666667}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(ground2.pin, voltageSource1.pin_n) annotation (Line(
        points={{-70,-40},{-70,-20}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(ground3.pin, voltageSource2.pin_n) annotation (Line(
        points={{-50,-52},{-50,-32}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(ground4.pin, voltageSource3.pin_n) annotation (Line(
        points={{-30,-60},{-30,-40}},
        color={85,170,255},
        smooth=Smooth.None));
    annotation (Diagram(graphics));
  end Rectifier_3phase;

  model Inverter_1phase
  extends Modelica.Icons.Example;
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground
      annotation (Placement(transformation(extent={{-70,-60},{-50,-40}})));
    Modelica.Electrical.Analog.Basic.Ground ground1
      annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
    Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=400)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={56,0})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor resistor(
              useHeatPort=false, R_ref=50)
                                 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-30,0})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor
      voltageSensor annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-20,-20})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor
      voltageSensor1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-60,-20})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource
      voltageSource(
      f=50,
      V=230,
      phi=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-80,-20})));
    Converters.ConvertersPin.Inverter inverter(
      inverter=true, eff=0.95)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R=20) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={30,10})));
  equation
    connect(voltageSensor1.pin_p, resistor.pin_n) annotation (Line(
        points={{-60,-10},{-60,1.22465e-015},{-40,1.22465e-015}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSource.pin_p, resistor.pin_n) annotation (Line(
        points={{-80,-10},{-80,1.22465e-015},{-40,1.22465e-015}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(constantVoltage.n, inverter.pin_nDC) annotation (Line(
        points={{56,-10},{10,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ground1.p, inverter.pin_nDC) annotation (Line(
        points={{10,-40},{10,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(voltageSensor.pin_n, resistor.pin_p) annotation (Line(
        points={{-20,-10},{-20,-1.22465e-015}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(resistor1.n, inverter.pin_pDC) annotation (Line(
        points={{20,10},{10,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor1.p, constantVoltage.p) annotation (Line(
        points={{40,10},{56,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(voltageSource.pin_n, ground.pin) annotation (Line(
        points={{-80,-30},{-80,-40},{-60,-40}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSensor1.pin_n, ground.pin) annotation (Line(
        points={{-60,-30},{-60,-40}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSensor.pin_p, ground.pin) annotation (Line(
        points={{-20,-30},{-20,-40},{-60,-40}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(resistor.pin_p, inverter.pin_pAC[1]) annotation (Line(
        points={{-20,0},{-10.8,0}},
        color={85,170,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics));
  end Inverter_1phase;

  model Bidirectional_1phase
  extends Modelica.Icons.Example;
    Converters.ConvertersPin.BidirectionalConverter bidirectionalConverter(eff=0.95)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground
      annotation (Placement(transformation(extent={{-90,-60},{-70,-40}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Resistor resistor(
              useHeatPort=false, R_ref=50)
                                 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-50,0})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor
      voltageSensor annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-40,-20})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor
      voltageSensor1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-80,-20})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource
      voltageSource(
      f=50,
      V=230,
      phi=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-100,-20})));
    Modelica.Blocks.Sources.Ramp ramp2(
      duration=1500,
      startTime=2700,
      height=-200)
      annotation (Placement(transformation(extent={{-74,64},{-62,76}})));
    Modelica.Blocks.Sources.Ramp ramp1(
      duration=1500,
      startTime=0,
      offset=1,
      height=99)
      annotation (Placement(transformation(extent={{-74,86},{-62,98}})));
    Modelica.Blocks.Math.Add3 add3_1
      annotation (Placement(transformation(extent={{-52,64},{-40,76}})));
    Modelica.Blocks.Sources.Ramp ramp3(
      duration=1500,
      startTime=4800,
      height=100)
      annotation (Placement(transformation(extent={{-74,44},{-62,56}})));
    IDEAS.Electric.BaseClasses.DC.WattsLaw wattsLawDC
      annotation (Placement(transformation(extent={{-32,60},{-12,80}})));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor2
                                                                   annotation (
        Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=270,
          origin={26,8.88178e-016})));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(
                                                       R=0.1) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={50,10})));
    Modelica.Electrical.Analog.Basic.Ground ground1
      annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
    DC.Con1PlusNTo1 con1PlusNTo1_1
      annotation (Placement(transformation(extent={{16,60},{-4,80}})));
  equation
    connect(voltageSensor1.pin_n,ground. pin) annotation (Line(
        points={{-80,-30},{-80,-40}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSensor.pin_p,ground. pin) annotation (Line(
        points={{-40,-30},{-40,-40},{-80,-40}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSensor1.pin_p,resistor. pin_n) annotation (Line(
        points={{-80,-10},{-80,1.22465e-015},{-60,1.22465e-015}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSource.pin_n,ground. pin) annotation (Line(
        points={{-100,-30},{-100,-40},{-80,-40}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSource.pin_p,resistor. pin_n) annotation (Line(
        points={{-100,-10},{-100,1.22465e-015},{-60,1.22465e-015}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(voltageSensor.pin_n,resistor. pin_p) annotation (Line(
        points={{-40,-10},{-40,-1.22465e-015}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(resistor.pin_p, bidirectionalConverter.pin_pAC[1]) annotation (Line(
        points={{-40,-1.22465e-015},{-26,-1.22465e-015},{-26,0},{-10.8,0}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(ramp1.y,add3_1. u1) annotation (Line(
        points={{-61.4,92},{-58,92},{-58,74.8},{-53.2,74.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(ramp2.y,add3_1. u2) annotation (Line(
        points={{-61.4,70},{-53.2,70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(ramp3.y,add3_1. u3) annotation (Line(
        points={{-61.4,50},{-58,50},{-58,65.2},{-53.2,65.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add3_1.y,wattsLawDC. P) annotation (Line(
        points={{-39.4,70},{-36,70},{-36,72},{-32,72}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(voltageSensor2.p, bidirectionalConverter.pin_pDC) annotation (Line(
        points={{26,6},{26,10},{10,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(voltageSensor2.n, bidirectionalConverter.pin_nDC) annotation (Line(
        points={{26,-6},{26,-10},{10,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor1.n, bidirectionalConverter.pin_pDC) annotation (Line(
        points={{40,10},{10,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bidirectionalConverter.pin_nDC, ground1.p) annotation (Line(
        points={{10,-10},{10,-40}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(wattsLawDC.vi[1], con1PlusNTo1_1.oneWire[1]) annotation (Line(
        points={{-12,70},{-4,70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(con1PlusNTo1_1.twoWire[1], resistor1.p) annotation (Line(
        points={{16,69.5},{64,69.5},{64,10},{60,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(con1PlusNTo1_1.twoWire[2], bidirectionalConverter.pin_nDC)
      annotation (Line(
        points={{16,70.5},{76,70.5},{76,-10},{10,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics));
  end Bidirectional_1phase;
end Examples;
