within IDEAS.Fluid.Production.Data.PerformanceMaps;
record VitoCal300GBWS301dotA08
  "Viessmann Vitocal 300-G, type BW/BWS/BWC 301.A08 heat pump data"
   extends IDEAS.Fluid.Production.BaseClasses.HeatPumpData3D(
    m1_flow_nominal=2600/3600,
    m2_flow_nominal=1800/3600,
    dp1_nominal=10000,
    dp2_nominal=10000,
    TEvaMin=273.15-5,
    TConMax=273.15+60,
    indicesDim1={308.15, 318.15, 328.15, 333.15},
    indicesDim2={268.15,273.15,275.15,283.15,288.15,298.15},
    indicesDim3={0},
    outputType1=IDEAS.Fluid.Production.BaseClasses.OutputType.COP,
    outputType2=IDEAS.Fluid.Production.BaseClasses.OutputType.P,
    inputType1=IDEAS.Fluid.Production.BaseClasses.InputType.T_outCon,
    inputType2=IDEAS.Fluid.Production.BaseClasses.InputType.T_inEva,
    inputType3=IDEAS.Fluid.Production.BaseClasses.InputType.None,
    table1_a={{4.02,4.65,4.94,6.13,6.87},
              {3.02,3.45,3.69,4.66,5.27},
              {0,2.65,2.82,3.52,3.96},
              {0,0,2.44,3.06,3.45}},
    table1_b={{1710,1690,1690,1680,1670},
              {2170,2150,2140,2100,2080},
              {0,2690,2680,2630, 2600},
              {0,0,2950,2920,2900}});
  annotation (Documentation(revisions="<html>
<ul>
<li>March 2014 by Filip Jorissen:<br/> 
Initial version
</li>
</ul>
</html>"));
end VitoCal300GBWS301dotA08;
