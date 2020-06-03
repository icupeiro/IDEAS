within IDEAS.Buildings.Components.OccupancyType;
record OfficeWorkWithComputers
  "Properties for typical office work, assuming each occupant has a moderate-sized PC + monitor.
  SOURCE: Table 6.7 and 6.8 in https://www.cambeep.eng.cam.ac.uk/References/internalheat"
  extends IDEAS.Buildings.Components.OccupancyType.BaseClasses.PartialOccupancyType(
    QlatPp=45,
    QsenPp=73 + 65 + 70,
    radFra=0.6,
    ICl=0.7);

end OfficeWorkWithComputers;
