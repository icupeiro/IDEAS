within IDEAS.Fluid.Movers.Data.Pumps.Wilo;
record VeroLine32slash160dash1comma1slash2
  "Pump data for a Wilo Veroline IP-E 32/160-1,1/2 pump"
  extends Generic(
    speed_rpm_nominal=2840,
    use_powerCharacteristic=true,
    power(V_flow={0,1,2,3,4,5,6,7,8,9,10,11,12}/3600,
          P={1.1053, 1.1842, 1.2947, 1.4053, 1.4684, 1.5158, 1.5474, 1.5789, 1.5947, 1.6263, 1.6421, 1.6737, 1.6737}*1000),
    pressure(V_flow={0,1,2,3,4,5,6,7,8,9,10,11,12}/3600, dp={26.242,25.879,25.274,24.67,23.823, 22.856, 21.767, 206.79, 192.28, 177.77, 159.63, 140.28, 117.3}*9806.65),
    motorCooledByFluid=true);
  annotation (
defaultComponentPrefixes="parameter",
defaultComponentName="per",
Documentation(info="<html>
<p>Data from:<a href=\"http://productfinder.wilo.com/nl/BE/product/0000001d000149e80001003a/fc_product_datasheet\"> http://productfinder.wilo.com/nl/BE/product/0000001d000149e80001003a/fc_product_datasheet</a></p>
<p>See <a href=\"modelica://IDEAS.Fluid.Movers.Data.Pumps.Wilo.Stratos25slash1to6\">IDEAS.Fluid.Movers.Data.Pumps.Wilo.Stratos25slash1to6 </a>for more information about how the data is derived. </p>
</html>",   revisions="<html>
<ul>
<li>
February 17, 2016, by Michael Wetter:<br/>
Updated parameter names for
<a href=\"https://github.com/iea-annex60/modelica-annex60/issues/396\">#396</a>.
</li>
<li>
December 12, 2014, by Michael Wetter:<br/>
Added <code>defaultComponentPrefixes</code> and
<code>defaultComponentName</code> annotations.
</li>
<li>April 22, 2014
    by Filip Jorissen:<br/>
       Initial version
</li>
</ul>
</html>"));
end VeroLine32slash160dash1comma1slash2;