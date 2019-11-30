within IDEAS.Buildings.Validation.Data.Constructions;
record LightInstRoof "BESTEST insulated light roof"
  extends IDEAS.Buildings.Data.Interfaces.Construction(
    incLastLay = IDEAS.Types.Tilt.Ceiling,
    final mats={
      IDEAS.Buildings.Validation.Data.Materials.Roofdeck(d=0.02),
      IDEAS.Buildings.Validation.Data.Insulation.FiberGlass(d=0.2),
      IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.08),
      IDEAS.Buildings.Validation.Data.Materials.PlasterBoard(d=0.01)});

end LightInstRoof;
