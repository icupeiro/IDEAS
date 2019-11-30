within IDEAS.Buildings.Validation.Data.Constructions;
record HeavyInsWall "BESTEST insulated heavy wall"
  extends IDEAS.Buildings.Data.Interfaces.Construction(
    final mats={
      IDEAS.Buildings.Validation.Data.Materials.WoodSiding(d=0.01),
      IDEAS.Buildings.Validation.Data.Insulation.FoamInsulation(d=0.18),
      IDEAS.Buildings.Validation.Data.Materials.ConcreteBlock(d=0.20)});

end HeavyInsWall;
