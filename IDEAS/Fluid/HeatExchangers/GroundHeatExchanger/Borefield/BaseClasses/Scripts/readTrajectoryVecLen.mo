within IDEAS.Fluid.HeatExchangers.GroundHeatExchanger.Borefield.BaseClasses.Scripts;
function readTrajectoryVecLen
  input String filPathAndName;
  output Integer vecLen "length of vector";
algorithm
  vecLen := readTrajectorySize(filPathAndName + ".mat");
end readTrajectoryVecLen;
