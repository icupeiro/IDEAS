within IDEAS.Buildings.Validation.Data.Constructions;
record HeavyCeilingFC "BESTEST heavy floor"
  extends IDEAS.Buildings.Data.Interfaces.Construction(
    incLastLay = IDEAS.Types.Tilt.Ceiling,
    locGain = {3},
    final mats={
      IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.35),
      IDEAS.Buildings.Validation.Data.Insulation.InsulationFloor(d=0.30),
      IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.06),
      IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.02)});
end HeavyCeilingFC;
