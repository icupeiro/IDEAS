within IDEAS.Fluid.HeatExchangers.GroundHeatExchanger.Borefield.BaseClasses.Scripts;
function readTrajectorytVec
  input String filPathAndName;
  output Integer[:] tVec;
algorithm
  tVec := readTrajectoryTRSHX(filPathAndName);
end readTrajectorytVec;
