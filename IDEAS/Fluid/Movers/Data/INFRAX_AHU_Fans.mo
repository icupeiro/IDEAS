within IDEAS.Fluid.Movers.Data;
record INFRAX_AHU_Fans "record for fans in INFRAX AHU"
  extends Generic(
    speed_rpm_nominal=2800,
    use_powerCharacteristic = false,
    motorEfficiency(V_flow={2.7222, 2.9691, 3.3395, 3.8210, 4.1049, 4.4753, 4.8827}*1.225,
          eta={0.80, 0.81, 0.80, 0.75, 0.70, 0.60, 0.40}),
    pressure(V_flow={2.2407, 3.0432, 3.4383, 3.7593, 4.0432, 4.3148, 4.5494, 4.7593, 4.9568}*1.225,
          dp={2000, 1800, 1600, 1400, 1200, 1000, 800, 600, 400}));
  annotation (
defaultComponentPrefixes="parameter",
defaultComponentName="per");
end INFRAX_AHU_Fans;
