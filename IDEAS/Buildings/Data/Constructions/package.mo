within IDEAS.Buildings.Data;
package Constructions "Library of building envelope constructions"
extends Modelica.Icons.MaterialPropertiesPackage;

  record HeavyFloorFH "BESTEST heavy floor with floor heating"
    extends IDEAS.Buildings.Data.Interfaces.Construction(
      incLastLay = IDEAS.Types.Tilt.Floor,
      locGain={2},
      final mats={
        IDEAS.Buildings.Validation.Data.Insulation.InsulationFloor(d=1.007),
        IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.05),
        IDEAS.Buildings.Validation.Data.Materials.ConcreteSlab(d=0.03)});

  end HeavyFloorFH;

annotation (Documentation(info="<html>
<p>By convention the last material layer of a construction type is connected to propsBus_a of the building component.</p>
</html>"));
end Constructions;
