within BuildingSystems.Fluid.Movers;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;
  annotation (preferredView="info",
  Documentation(info="<html>
<p>
This package contains models for fans and pumps. The same models
are used for fans or pumps.
</p>

<h4>Model description</h4>
<p>A detailed description of the fan and pump models can be
found in
<a href=\"modelica://BuildingSystems/Resources/Images/Fluid/Movers/UsersGuide/2013-IBPSA-Wetter.pdf\">Wetter (2013)</a>.
Below, the models are briefly described.
</p>
<h5>Performance data</h5>
<p>
The models use
performance curves that compute pressure rise,
electrical power draw and efficiency as a function
of the volume flow rate and the speed.
The following performance curves are implemented:
</p>
<table summary=\"summary\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\" style=\"border-collapse:collapse;\">
<tr>
<th>Independent variable</th>
<th>Dependent variable</th>
<th>Record for performance data</th>
<th>Function</th>
</tr>
<tr>
<td>Volume flow rate</td>
<td>Pressure</td>
<td><a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Characteristics.flowParameters\">
flowParameters</a></td>
<td><a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Characteristics.pressure\">
pressure</a></td>
</tr>
<tr>
<td>Volume flow rate</td>
<td>Efficiency</td>
<td><a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Characteristics.efficiencyParameters\">
efficiencyParameters</a></td>
<td><a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Characteristics.efficiency\">
efficiency</a></td>
</tr>
<tr>
<td>Volume flow rate</td>
<td>Power*</td>
<td><a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Characteristics.powerParameters\">
powerParameters</a></td>
<td><a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Characteristics.power\">
power</a></td>
</tr>
</table>
<p>*Note: This record is not available for the movers that take as a control signal
the mass flow rate or the head.
The reason is that these movers prescribe the mass flow rate and head based
on the control signal and the system pressure drop curve.
If the electrical power versus flow rate were specified, then
the electrical power could be lower than the flow work,
which would be physically impossible.
</p>
<p>
These performance curves are implemented in
<a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Characteristics\">
BuildingSystems.Fluid.Movers.BaseClasses.Characteristics</a>,
and are used in the performance records in the package
<a href=\"modelica://BuildingSystems.Fluid.Movers.Data\">
BuildingSystems.Fluid.Movers.Data</a>.
The package
<a href=\"modelica://BuildingSystems.Fluid.Movers.Data\">
BuildingSystems.Fluid.Movers.Data</a>
contains different data records. The table below shows
which data records can be used for what models.
Note that not all records can be used with all models, as
the records only declare the minimum set of required data.
</p>
<!-- Table for performance data -->
<table summary=\"Performance data\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\" style=\"border-collapse:collapse;\">
<tr>
<th></th>
<th style=\"text-align:left\">
<a href=\"modelica://BuildingSystems.Fluid.Movers.Data.FlowControlled\">
Data.FlowControlled</a>
</th>
<th style=\"text-align:left\">
<a href=\"modelica://BuildingSystems.Fluid.Movers.Data.SpeedControlled_y\">
Data.SpeedControlled_y</a>
</th>
<th style=\"text-align:left\">
<a href=\"modelica://BuildingSystems.Fluid.Movers.Data.SpeedControlled_Nrpm\">
Data.SpeedControlled_Nrpm</a>
</th>
</tr>
<tr>
<th style=\"text-align:left\">
<a href=\"modelica://BuildingSystems.Fluid.Movers.FlowControlled_m_flow\">
FlowControlled_m_flow</a>
</th>
<td style=\"background-color:DarkGreen\"/>
<td style=\"background-color:DarkGreen\"/>
<td style=\"background-color:DarkGreen\"/>
</tr>
<tr>
<th>
<a href=\"modelica://BuildingSystems.Fluid.Movers.FlowControlled_dp\">
FlowControlled_dp</a>
</th>
<td style=\"background-color:DarkGreen\"/>
<td style=\"background-color:DarkGreen\"/>
<td style=\"background-color:DarkGreen\"/>
</tr>
<tr>
<th>
<a href=\"modelica://BuildingSystems.Fluid.Movers.SpeedControlled_y\">
SpeedControlled_y</a>
</th>
<td style=\"background-color:DarkRed\"/>
<td style=\"background-color:DarkGreen\"/>
<td style=\"background-color:DarkGreen\"/>
</tr>
<tr>
<th>
<a href=\"modelica://BuildingSystems.Fluid.Movers.SpeedControlled_Nrpm\">
SpeedControlled_Nrpm</a>
</th>
<td style=\"background-color:DarkRed\"/>
<td style=\"background-color:DarkRed\"/>
<td style=\"background-color:DarkGreen\"/>
</tr>
</table>
<p>
&nbsp;
<!-- empty paragraph to add spacing below table -->
</p>
<h5>Models that use performance curves for pressure rise</h5>
<p>
The models
<a href=\"modelica://BuildingSystems.Fluid.Movers.SpeedControlled_y\">
BuildingSystems.Fluid.Movers.SpeedControlled_y</a> and
<a href=\"modelica://BuildingSystems.Fluid.Movers.SpeedControlled_Nrpm\">
BuildingSystems.Fluid.Movers.SpeedControlled_Nrpm</a>
take as an input either a control signal between <i>0</i> and <i>1</i>, or the
rotational speed in units of <i>[1/min]</i>. From this input and the current flow rate,
they compute the pressure rise.
This pressure rise is computed using user-provided list of operating points that
defines the fan or pump curve at full speed.
For other speeds, similarity laws are used to scale the performance curves, as
described in
<a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Characteristics.pressure\">
BuildingSystems.Fluid.Movers.BaseClasses.Characteristics.pressure</a>.
</p>

<p>
For example, suppose a pump needs to be modeled whose pressure versus flow relation crosses, at
full speed, the points shown in the table below.
</p>
  <table summary=\"summary\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\" style=\"border-collapse:collapse;\">
  <tr>
      <th>Volume flow rate [m<sup>3</sup>&frasl;h] </th>
      <th>Head [Pa]</th>
    </tr>
    <tr>
      <td>0.0003</td>
      <td>45000</td>
    </tr>
    <tr>
      <td>0.0006</td>
      <td>35000</td>
    </tr>
    <tr>
      <td>0.0008</td>
      <td>15000</td>
    </tr>
  </table>
<p>
Then, a declaration would be
</p>
<pre>
  BuildingSystems.Fluid.Movers.SpeedControlled_y pum(
    redeclare package Medium = Medium,
    per.pressure(V_flow={0.0003,0.0006,0.0008},
                 dp    ={45,35,15}*1000))
    \"Circulation pump\";
</pre>

<p>
This will model the following pump curve for the pump input signal <code>y=1</code>.
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://BuildingSystems/Resources/Images/Fluid/Movers/UsersGuide/pumpCurve.png\"/>
</p>

<h5>Models that directly control the head or the mass flow rate</h5>
<p>
The models <a href=\"modelica://BuildingSystems.Fluid.Movers.FlowControlled_dp\">
BuildingSystems.Fluid.Movers.FlowControlled_dp</a> and
<a href=\"modelica://BuildingSystems.Fluid.Movers.FlowControlled_m_flow\">
BuildingSystems.Fluid.Movers.FlowControlled_m_flow</a>
take as an input the pressure difference or the mass flow rate.
This pressure difference or mass flow rate will be provided by the fan or pump,
i.e., the fan or pump has idealized perfect control and infinite capacity.
Using these models that take as an input the head or the mass flow rate often leads
to smaller system of equations compared to using the models that take
as an input the speed.
</p>
<p>
These models can be configured for three different control inputs.
For
<a href=\"modelica://BuildingSystems.Fluid.Movers.FlowControlled_dp\">
BuildingSystems.Fluid.Movers.FlowControlled_dp</a>,
the head is as follows:
</p>
<ul>
<li>
<p>
If the parameter <code>inputType==BuildingSystems.Fluid.Types.InputType.Continuous</code>,
the head is <code>dp=dp_in</code>, where <code>dp_in</code> is an input connector.
</p>
</li>
<li>
<p>
If the parameter <code>inputType==BuildingSystems.Fluid.Types.InputType.Constant</code>,
the head is <code>dp=constantHead</code>, where <code>constantHead</code> is a parameter.
</p>
</li>
<li>
<p>
If the parameter <code>inputType==BuildingSystems.Fluid.Types.InputType.Stages</code>,
the head is <code>dp=heads</code>, where <code>heads</code> is a
vectorized parameter. For example, if a mover has
two stages and the head of the first stage should be <i>60%</i> of the nominal head
and the second stage equal to <code>dp_nominal</code>, set
<code>heads={0.6, 1}*dp_nominal</code>.
Then, the mover will have the following heads:
</p>
  <table summary=\"summary\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\" style=\"border-collapse:collapse;\">
  <tr>
      <th>input signal <code>stage</code></th>
      <th>Head [Pa]</th>
    </tr>
    <tr>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0.6*dp_nominal</td>
    </tr>
    <tr>
      <td>2</td>
      <td>dp_nominal</td>
    </tr>
</table>
</li>
</ul>
<p>
Similarly, for
<a href=\"modelica://BuildingSystems.Fluid.Movers.FlowControlled_m_flow\">
BuildingSystems.Fluid.Movers.FlowControlled_m_flow</a>,
the mass flow rate is as follows:
</p>
<ul>
<li>
<p>
If the parameter <code>inputType==BuildingSystems.Fluid.Types.InputType.Continuous</code>,
the mass flow rate is <code>m_flow=m_flow_in</code>, where <code>m_flow_in</code> is an input connector.
</p>
</li>
<li>
<p>
If the parameter <code>inputType==BuildingSystems.Fluid.Types.InputType.Constant</code>,
the mass flow rate is <code>m_flow=constantMassFlowRate</code>, where <code>constantMassFlowRate</code> is a parameter.
</p>
</li>
<li>
<p>
If the parameter <code>inputType==BuildingSystems.Fluid.Types.InputType.Stages</code>,
the mass flow rate is <code>m_flow=massFlowRates</code>, where <code>massFlowRates</code> is a
vectorized parameter. For example, if a mover has
two stages and the mass flow rate of the first stage should be <i>60%</i> of the nominal mass flow rate
and the second stage equal to <code>m_flow_nominal</code>, set
<code>massFlowRates={0.6, 1}*m_flow_nominal</code>.
Then, the mover will have the following mass flow rates:
</p>
  <table summary=\"summary\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\" style=\"border-collapse:collapse;\">
  <tr>
      <th>input signal <code>stage</code></th>
      <th>Mass flow rates [kg/s]</th>
    </tr>
    <tr>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0.6*m_flow_nominal</td>
    </tr>
    <tr>
      <td>2</td>
      <td>m_flow_nominal</td>
    </tr>
</table>
</li>
</ul>
<p>
These two models do not have a performance curve for the flow
characteristics.
The reason for not using a performance curve for the flow characteristics is that</p>
<ul>
<li>
for given pressure rise (or mass flow rate), the mass flow rate (or pressure rise)
is defined by the flow resistance of the duct or piping network, and
</li>
<li>
at zero pressure difference, solving for the flow rate and the revolution leads to a singularity.
</li>
</ul>
<p>
The models <a href=\"modelica://BuildingSystems.Fluid.Movers.FlowControlled_dp\">
BuildingSystems.Fluid.Movers.FlowControlled_dp</a> and
<a href=\"modelica://BuildingSystems.Fluid.Movers.FlowControlled_m_flow\">
BuildingSystems.Fluid.Movers.FlowControlled_m_flow</a>
both have a parameter <code>m_flow_nominal</code>. For
<a href=\"modelica://BuildingSystems.Fluid.Movers.FlowControlled_m_flow\">
BuildingSystems.Fluid.Movers.FlowControlled_m_flow</a>, this parameter
is used for convenience to set a default value for the parameters
<code>constantMassFlowRate</code> and
<code>massFlowRates</code>.
For both models, the value is also used to compute the
size of the fluid volume that can be used to approximate the
inertia of the mover (if <code>dynamicBalance == true</code>).
It is also used for regularization of the equations near zero flow rate.
However, otherwise it does not affect the mass flow rate of the mover as
the mass flow rate is determined by the input signal or the above explained parameters.
</p>
<h5>Start-up and shut-down transients</h5>
<p>
All models have a parameter <code>filteredSpeed</code>. This
parameter affects the fan output as follows:
</p>
<ol>
<li>
If <code>filteredSpeed=false</code>, then the input signal <code>y</code> (or
<code>Nrpm</code>, <code>m_flow_in</code>, or <code>dp_in</code>)
is equal to the fan speed (or the mass flow rate or pressure rise).
Thus, a step change in the input signal causes a step change in the fan speed (or mass flow rate or pressure rise).
</li>
<li>
<p>
If <code>filteredSpeed=true</code>, which is the default,
then the fan speed (or the mass flow rate or the pressure rise)
is equal to the output of a filter. This filter is implemented
as a 2nd order differential equation and can be thought of as
approximating the inertia of the rotor and the fluid.
Thus, a step change in the fan input signal will cause a gradual change
in the fan speed.
The filter has a parameter <code>riseTime</code>, which by default is set to
<i>30</i> seconds.
The rise time is the time required to reach <i>99.6%</i> of the full speed, or,
if the fan is switched off, to reach a fan speed of <i>0.4%</i>.
</p>
</li>
</ol>

<p>
The figure below shows for a fan with <code>filteredSpeed=true</code>
and <code>riseTime=30</code> seconds the
speed input signal and the actual speed.</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://BuildingSystems/Resources/Images/Fluid/Movers/UsersGuide/fanSpeedFiltered.png\"/>
</p>

<p>
Although many simulations do not require such a detailed model
that approximates the transients of fans or pumps, it turns
out that using this filter can reduce computing time and
can lead to fewer convergence problems in large system models.
With a filter, any sudden change in control signal, such as when
a fan switches on, is damped before it affects the air flow rate.
This continuous change in flow rate turns out to be easier, and in
some cases faster, to simulate compared to a step change.
For most simulations, we therefore recommend to use the default settings
of <code>filteredSpeed=true</code> and <code>riseTime=30</code> seconds.
An exception are situations in which the fan or pump is operated at a fixed speed during
the whole simulation. In this case, set <code>filteredSpeed=false</code>.
</p>
<p>
Note that if the fan is part of a closed loop control, then the filter affects
the transient response of the control.
When changing the value of <code>filteredSpeed</code>, the control gains
may need to be retuned.
We now present values control parameters that seem to work in most cases.
Suppose there is a closed loop control with a PI-controller
<a href=\"modelica://BuildingSystems.Controls.Continuous.LimPID\">
BuildingSystems.Controls.Continuous.LimPID</a>
and a fan or pump, configured with <code>filteredOpening=true</code> and <code>riseTime=30</code> seconds.
Assume that the transient response of the other dynamic elements in the control loop is fast
compared to the rise time of the filter.
Then, a proportional gain of <code>k=0.5</code> and an integrator time constant of
<code>Ti=15</code> seconds often yields satisfactory closed loop control performance.
These values may need to be changed for different applications as they are also a function
of the loop gain.
If the control loop shows oscillatory behavior, then reduce <code>k</code> and/or increase <code>Ti</code>.
If the control loop reacts too slow, do the opposite.
</p>

<h5>Efficiency and electrical power consumption</h5>
<p>
All models compute the motor power draw <i>P<sub>ele</sub></i>,
the hydraulic power input <i>W<sub>hyd</sub></i>, the flow work
<i>W<sub>flo</sub></i> and the heat dissipated into the medium
<i>Q</i>. Based on the first law, the flow work is
</p>
<p align=\"center\" style=\"font-style:italic;\">
  W<sub>flo</sub> = | V&#775; &Delta;p |,
</p>
<p>
where <i>V&#775;</i> is the volume flow rate and
<i>&Delta;p</i> is the pressure rise.
The heat dissipated into the medium is as follows:
If the motor is cooled by the fluid, as indicated by
<code>per.motorCooledByFluid=true</code>, then the heat dissipated into the medium is
</p>
<p align=\"center\" style=\"font-style:italic;\">
  Q = P<sub>ele</sub> - W<sub>flo</sub>.
</p>

<p>
If <code>per.motorCooledByFluid=false</code>, then the motor is outside the fluid stream,
and only the shaft, or hydraulic, work <i>W<sub>hyd</sub></i> enters the thermodynamic
control volume. Hence,
</p>
<p align=\"center\" style=\"font-style:italic;\">
  Q = Q<sub>hyd</sub> - W<sub>flo</sub>.
</p>
<p>The efficiencies are computed as</p>
<p align=\"center\" style=\"font-style:italic;\">
  &eta; = W<sub>flo</sub> &frasl; P<sub>ele</sub> = &eta;<sub>hyd</sub> &nbsp; &eta;<sub>mot</sub> <br/>
  &eta;<sub>hyd</sub> = W<sub>flo</sub> &frasl; W<sub>hyd</sub> <br/>
  &eta;<sub>mot</sub> = W<sub>hyd</sub> &frasl; P<sub>ele</sub> <br/>
</p>
<p>where
<i>&eta;<sub>hyd</sub></i> is the hydraulic efficiency,
<i>&eta;<sub>mot</sub></i> is the motor efficiency and
<i>Q</i> is the heat released by the motor.
</p>
<p>
If <code>per.use_powerCharacteristic=true</code>,
then a set of data points for the power <i>P<sub>ele</sub></i> for different
volume flow rates at full speed needs to be provided by the user.
Using the flow work <i>W<sub>flo</sub></i> and the electrical power input
<i>P<sub>ele</sub></i>, the total efficiency is computed as
</p>
<p align=\"center\" style=\"font-style:italic;\">
  &eta; = W<sub>flo</sub> &frasl; P<sub>ele</sub>, <br/>
</p>
<p>
and the two efficiencies
<i>&eta;<sub>hyd</sub></i>
and <i>&eta;<sub>mot</sub></i> are computed as
</p>
<p align=\"center\" style=\"font-style:italic;\">
  &eta;<sub>hyd</sub> = 1,<br/>
  &radic;&eta;<sub>mot</sub> = &eta;.
</p>
<p>
However, if <code>per.use_powerCharacteristic=false</code>, then
performance data for
<i>&eta;<sub>hyd</sub></i> and
 <i>&eta;<sub>mot</sub></i> need to be provided by the user, and hence
the model computes
</p>
<p align=\"center\" style=\"font-style:italic;\">
  &eta; = &eta;<sub>hyd</sub> &nbsp; &eta;<sub>mot</sub><br/>
  P<sub>ele</sub> = W<sub>flo</sub> &frasl; &eta;.
</p>

<p>
The efficiency data for the motor are a list of points
<i>V&#775;</i> and <i>&eta;<sub>mot</sub></i>.
</p>

<h5>Fluid volume of the component</h5>
<p>
All models can be configured to have a fluid volume at the low-pressure side.
Adding such a volume sometimes helps the solver to find a solution during
initialization and time integration of large models.
</p>

<h5>Enthalpy change of the component</h5>
<p>
If <code>per.motorCooledByFluid=true</code>, then
the enthalpy change between the inlet and outlet fluid port is equal
to the electrical power <i>P<sub>ele</sub></i> that is consumed by the component.
Otherwise, it is equal to the hydraulic work <i>W<sub>hyd</sub></i>.
The parameter <code>addPowerToMedium</code>, which is by default set to
<code>true</code>, can be used to simplify the equations.
If it is set to <code>false</code>, then no enthalpy change occurs between
inlet and outlet other than the flow work <i>W<sub>flo</sub></i>.
This can lead to simpler equations, but the temperature rise across the component
will be underestimated, in particular for fans.
</p>

<h5>Further description</h5>
<p>
For a detailed description of the models with names <code>FlowMachine_*</code>,
see their base class <a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.PartialFlowMachine\">
BuildingSystems.Fluid.Movers.BaseClasses.PartialFlowMachine.</a>
</p>

<h4>Differences to models in Modelica.Fluid.Machines</h4>
<p>
The models with names <code>FlowMachine_*</code> have similar parameters than the
models in the package <a href=\"Modelica.Fluid.Machines\">Modelica.Fluid.Machines</a>.
However, the models in this package differ primarily in the following points:
</p>
<ul>
<li>
They use a different base class, which allows to have zero mass flow rate.
The models in <code>Modelica.Fluid</code> restrict the number of revolutions, and hence the flow
rate, to be non-zero.
</li>
<li>
For the model with prescribed pressure, the input signal is the
pressure difference between the two ports, and not the absolute
pressure at <code>port_b</code>.
</li>
<li>
The pressure calculations are based on total pressure in Pascals instead of the pump head in meters.
This change was done to avoid ambiguities in the parameterization if the models are used as a fan
with air as the medium. The original formulation in
<a href=\"Modelica.Fluid.Machines\">Modelica.Fluid.Machines</a> converts head
to pressure using the density <code>medium.d</code>. Therefore, for fans,
head would be converted to pressure using the density of air. However, for fans,
manufacturers typically publish the head in millimeters water (mmH20).
Therefore, to avoid confusion when using these models with media other than water,
we changed the models to use total pressure in Pascals instead of head in meters.
</li>
<li>
The performance data are interpolated using cubic hermite splines instead of polynomials.
These functions are implemented at
<a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Characteristics\">
BuildingSystems.Fluid.Movers.BaseClasses.Characteristics</a>.
</li>
</ul>
<h4>References</h4>
<p>
Michael Wetter.
<a href=\"modelica://BuildingSystems/Resources/Images/Fluid/Movers/UsersGuide/2013-IBPSA-Wetter.pdf\">
Fan and pump model that has a unique solution for any pressure
boundary condition and control signal.</a>
<i>Proc. of the 13th Conference of the International Building Performance
Simulation Association</i>, p. 3505-3512. Chambery, France. August 2013.
</p>
</html>"));

end UsersGuide;