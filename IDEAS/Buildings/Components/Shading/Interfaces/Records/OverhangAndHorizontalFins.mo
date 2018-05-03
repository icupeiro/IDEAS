within IDEAS.Buildings.Components.Shading.Interfaces.Records;
record OverhangAndHorizontalFins "Roof overhang and horizontal fins"
  extends ShadingProperties(controlled=false, shaType=ShadingType.OverhangAndHorizontalFins);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end OverhangAndHorizontalFins;