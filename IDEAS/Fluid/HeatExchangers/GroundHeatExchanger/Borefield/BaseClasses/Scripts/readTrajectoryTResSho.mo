within IDEAS.Fluid.HeatExchangers.GroundHeatExchanger.Borefield.BaseClasses.Scripts;
function readTrajectoryTResSho
  input String filPathAndName;
  output Real[:] TMea "mean in-out temperature";
algorithm

  (,TMea) := readTrajectoryTRSHX(filPathAndName);
end readTrajectoryTResSho;
