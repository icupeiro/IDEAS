within IDEAS.Buildings.Validation.Data;
package Constructions
extends Modelica.Icons.MaterialPropertiesPackage;

  record HeavyFloorFH "BESTEST heavy floor"
    extends IDEAS.Buildings.Data.Interfaces.Construction(
      incLastLay = IDEAS.Types.Tilt.Floor,
      locGain = {3},
      final mats={
        IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.35),
        IDEAS.Buildings.Validation.Data.Insulation.InsulationFloor(d=0.30),
        IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.06),
        IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.02)});
  end HeavyFloorFH;

  record HeavyInsWall "BESTEST insulated heavy wall"
    extends IDEAS.Buildings.Data.Interfaces.Construction(
      final mats={
        IDEAS.Buildings.Validation.Data.Materials.WoodSiding(d=0.01),
        IDEAS.Buildings.Validation.Data.Insulation.FoamInsulation(d=0.18),
        IDEAS.Buildings.Validation.Data.Materials.ConcreteBlock(d=0.20)});
  end HeavyInsWall;

  record LightInstRoof "BESTEST insulated light roof"
    extends IDEAS.Buildings.Data.Interfaces.Construction(
      incLastLay = IDEAS.Types.Tilt.Ceiling,
      final mats={
        IDEAS.Buildings.Validation.Data.Materials.Roofdeck(d=0.02),
        IDEAS.Buildings.Validation.Data.Insulation.FiberGlass(d=0.2),
        IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.08),
        IDEAS.Buildings.Validation.Data.Materials.PlasterBoard(d=0.01)});
  end LightInstRoof;

  record InternalCeiling "Internal wall semi-BESTES"
    extends IDEAS.Buildings.Data.Interfaces.Construction(
      incLastLay = IDEAS.Types.Tilt.Ceiling,
      locGain = {1},
      final mats={
        IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.14),
        IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.06)});
  end InternalCeiling;
end Constructions;
