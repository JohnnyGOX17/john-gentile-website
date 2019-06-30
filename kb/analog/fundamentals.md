---
title: Analog Engineering Fundamentals
layout: default
kb: true
top-category: Analog
comments: true
---

## Physics of Electrical Circuits

Fundamentally, there is the property of matter _Charge_ which measured in Coulombs (C). Charge is directly related to one of the fundamental building blocks of matter, the electron; the charge of an electron (e) is negative and has a magnitude of $$~1.602 \times 10^{-19}$$.

<center><img src="electron_flow.png"></center>

_From [Nuts & Volts Magazine](https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjGm8OL3oHWAhWlx4MKHfokAV4QjhwIBQ&url=http%3A%2F%2Fwww.nutsvolts.com%2Fmagazine%2Farticle%2Fwhich-way-does-current-really-flow&psig=AFQjCNEM48przwI2nCUNyFzAsc-yPaqLLw&ust=1504277839609821)_

### Ohm's Law

The fundamental, omnipotent equation in Electrical Engineering is **Ohm's Law** which shows the relationship between the resistance ($$ R $$), voltage ($$ V $$) and current ($$ I $$) through an electrical path:
\$\$ V = I*R \$\$
There are many different relationships that form from this:
<center><img src="resistor_101_ohms_table.png"></center>

_From [Resistors 101- Vishay](https://www.digikey.com/en/pdf/v/vishay/resistors-101)_

## Direct Current Circuit Analysis (DC)

For reference when specifying a DC circuit, use capital letters for voltage ($$V$$), current ($$I$$) and resistance ($$R$$).

### KCL

## Alternating Current Circuit Analysis (AC)

For reference when specifying an AC circuit, use lower case letters for voltage ($$v$$), current ($$i$$) and resistance ($$r$$).

### Impedance

For impedances connected in series, the current through each is the same so the total impedance is the sum of each:
<center><img src="Impedances_in_series.png"></center>
\$\$ Z_{eq} = Z_{1} + Z_{2} + \cdots + Z_{n} \$\$
\$\$ R_{eq} + jX_{eq} = (R_{1} + R_{2} + \cdots + R_{n}) + j(X_{1} + X_{2} + \cdots + X_{n}) \$\$

For impedances connected in parallel, the voltage across each is the same, thus the inverse equivalent impedance is the sum of the inverses of each impedance:
<center><img src="Impedances_in_parallel.png"></center>
\$\$ \frac{1}{Z_{eq}} = \frac{1}{Z_{1}} + \frac{1}{Z_{2}} + \cdots + \frac{1}{Z_{n}} \$\$
A simplified version for the two element case is:
\$\$ Z_{eq} = \frac{Z_{1}Z_{2}}{Z_{1}+Z_{2}} \$\$

### RLC Resonant Circuits

Quality factor $$Q$$ is the ratio of energy stored to energy dissipated in a component or circuit:
\$\$ Q = \frac{E_{stored}}{E_{dissipated}} \$\$

The less loss in a device the higher it's quality factor. $$Q$$ can also be determined by measuring the frequency response such that $$ Q = \frac{f_{center}}{\Delta f} $$ where $$ \Delta f $$ is the 3dB bandwidth of the response:
<center><img src="3db_response.png"></center>

### Bode Plots

Bode plots are logarithmic graphs used to show magnitude (in dB) and phase response (degrees or radians) plotted over frequency ($$f$$ or $$\omega$$). They can be measured in a real circuit, mathematically derived given a transfer function, or analyzed using CAD/SPICE software for a given circuit.

#### Drawing Bode Plot Manually

For quick response analysis of a given circuit it's useful to be able to quickly draw the bode plot and transfer function. For example, given the following RC filter:

<center><img src="rc_hpf.png"></center>

## EM
Electromagnetic (EM) waves behave like all other waves:
* They can be continuous or happen in short bursts
* They propagate in some medium over time and attenuate as they propagate
* They can be absorbed or reflected
* Their paths can be guided


### Transmission Lines

#### Application Examples

* When an ideal driver transmits a voltage into a high-impedance (open) receiver
    - Almost all signal is reflected back creating a 2x driven amplitude (i.e. a 2.5Vpp driver will see a 5Vpp signal amplitude into an open receiver) on the line and, in the ideal case, the signal oscillates back and forth indefinitely

## Components

### Common Component Factors
- **Power Rating:** depending on the physical size and composition of the component, the power rating is indicative of how much power it can dissipate. Generally, a larger package can handle more power due to a larger surface area. It is generally not advisable to operate right at the nominal power rating of a part and instead operate with some margin due to component derating (see below).
- **Working/Nominal Maximums:** maximum DC or AC (rms) voltage or current that can be continuously applied to the component.
- **Absolute Maximums:** maximum DC or AC (rms) voltage or current that can be tolerated by the component, usually for a very short period of time. **Never design to absolute maximums, always reference the working specifications and leave margin**.
-- **Dielectric Withstanding Voltage:** max voltage that can be applied to component before dielectric breakdown occurs (meaning the insulator is no longer effective and becomes electrically conductive, which can be a safety issue or general failure)
- **Component Derating:** most parts will show one or more curves expressing the relationship between some independent variable (e.g. temperature, voltage, current, etc.) and the dependent variable as some suggested derating of an otherwise nominal specification (e.g. rated power handling, maximum input current, etc.). These are critical to pay attention to when designing a system that may be in an environment where these bounds change the specifications significantly; for example derating a certain capacitor could mean limiting the maximum input voltage to the part given an application need to operate in a hot ambient temperature:
<center><img src="T525-derate-kocap.png"></center>
- **Reliability:** the probability that the component will fail, or not meet specifications, can be shown as the Mean Time Between Failures (MTBF), failure rate per hours of operation or other statistical measurements. Reliable electronics design is a deep subject and thus [has its own page](reliable_design.html).
- **Temp Coefficient:** the "tempco" of a device is a measure of the variation of a given specification for a given change in temperature from where the specification was recorded. For example, a resistor with a temperature coefficient of resistance (sometimes shown as TCR) of 100 ppm/°C with a specified resistance of 10kΩ at +25°C will change 0.1% with a 10°C change in temperature. Generally, components with low tempco's are beneficial as a design varies less over temperature.
- **Tolerance:** usually shown as a percentage of max deviation of a component from the nominal specification under nominal circumstances (e.g. same temperature and voltage as specification). For example a capacitor with 1% tolerance usually means that any capacitor used- when measured under nominal conditions- should fall within ±1% of the nominal capacitance. Component manufacturers can achieve a certain tolerance by careful material selection or by "binning" where components are tested and then bucketed into groups that meet a certain threshold. Generally, the tighter the tolerance of a component, the more expensive it will be (holding all other factors the same).
- **Standard Values:** for commonality between vendors and component manufacturers, standard values have been adopted for resistors, inductors and capacitors, given a certain tolerance bin. The values follow a logarithmic progression determined by the EIA E Series:
\$\$ value = D * 10^{\frac{i}{N}} \$\$
where $$D$$ is the decade multiplier (10, 100, 1k, etc.), $$N$$ is the tolerance series (e.x. 1%=96, 5%=24, 10%=12) and $$\{ i \mid 1..N-1\}$$. Thus for 10% resistor parts in the 1k decade, the standard values are: 1kΩ, 1.2kΩ, 1.5kΩ, 1.8kΩ, 2.2kΩ, 2.7kΩ, 3.3kΩ, 3.9kΩ, 4.7kΩ, 5.6kΩ, 6.8kΩ, and 8.2kΩ. It can also show that the higher the tolerance bin, the more value options available. Standard values are another factor in design decisions or part value selection since arbitrary values generally cannot be used; for instance, my calculation of a voltage divider calls for a 1.8725kΩ resistor but given standard values (and other factors like stock on hand, supplier/vendor availability, BOM cost, etc.) it's most likely OK to use the standard 1.8kΩ part.

### Resistors ![resistor_symbol](Resistor_symbol_America.png)

Resistors resist or limit the flow of electric current in a circuit. They are commonly used for:
- Voltage dividing
- Current limiting
- Energy absorption

#### Resistor Types
Resistor come in three main types:
- **Fixed Resistors:** where the one stated value of resistance is not intended to change. It's most common that resistors are packaged individually however there are cases where an array makes sense:
  + _Resistor Networks:_ ResNets are an array, or multiple, resistors in a single package and are good for applications needing multiple resistors in close proximity (e.x. voltage dividers, resistor ladders, pull-up/downs for digital I/O, etc.) while also benefitting from better tracking (e.g. same manufacturing process/lot or substrate used leading to less variation between resistors).
- **Variable Resistors:** where the resistance value is changed via some mechanical mechanism (e.x. potentiometers and rheostats)
- **Non-Linear Resistors:** where the resistance value changes significantly with applied voltage (varistors), temperature (thermistors) or light (photoresistors)

Resistors come in a variety of composition types:
- **Carbon:** older, low cost, terrible tempcos but can handle high peak power
<center><img src="carbon_resistor.png"></center>
- **Thin/Thick/Metal Film:** modern, tighter tolerances, generally good noise and high-frequency performance, smaller package sizes
- **Wire Wound:** made for very high power applications though drawback is in size and inductance (since wire wounds act like an inductor)
<center><img src="wire_wound.png"></center>

Resistors also can come in surface mount (SMT) or through-hole (TH) form factors with these different compositions:
![vishay_smt](vishay_smt_types.png)
![vishay_th](vishay_th_types.png)

_From [Resistors 101- Vishay](https://www.digikey.com/en/pdf/v/vishay/resistors-101)_

#### Non-Idealities

Ideally a resistor has a constant impedance from DC to daylight (frequency independent) however, due to package type and how the signal propagates through the internals of the resistor, a resistor will look capacitive at high-frequency (lowering effective impedance), and then at even higher frequencies, start to look inductive (higher effective impedance):
<center><img src="resistor_f_response.png"></center>

These non-idealities need to be considered for high-frequency or precision designs.

#### Noise

Resistors exhibit **[Johnson-Nyquist Noise](https://en.wikipedia.org/wiki/Johnson%E2%80%93Nyquist_noise)** which is caused by thermal agitation of charge carriers within the resistor. This noise is independent of applied voltage but rather dependent on temperature and bandwidth. Johnson-Nyquist Noise is present, and has constant power spectral density, across frequencies (approximately white noise) and is defined by:
\$\$ v_{noise} = \sqrt{4 k T R B} \xrightarrow[noise]{current} i_{noise} = \sqrt{\frac{4 k T B}{R}} \$\$

Where $$k$$ is **[Boltzmann Constant](https://en.wikipedia.org/wiki/Boltzmann_constant)** (about $$1.380649 \times 10^{-23} J/K$$), $$T$$ is absolute temperature in Kelvin, $$R$$ is resistance Ohms and $$B$$ is bandwidth in Hz. Given nominal characteristics (e.g. room temperature and Boltzmann Constant), the rule of thumb noise voltage is:
\$\$ V_{rms} = 1.3 \times 10^{-10} \sqrt{RB} \$\$

Bandwidth is not a single frequency but rather a range of frequencies (hence Band- _width_) that is relevant to the application of noise analysis. This also means that the frequency of operation, or center frequency for instance, does not matter since the noise is constant throughout the frequency spectrum; again, what matters is the bandwidth of operation. For example the Johnson-Nyquist noise power spectral density (and resulting noise voltage) with a bandwidth of 1 MHz is equivalent whether the band is centered at 10 MHz or 1 GHz.

Ideal inductors and capacitors do not exhibit noise, but their non-ideal/real-life models do exhibit resistance in some fashion; however, one can generally ignore these noise sources since the equivalent resistances present are typically negligible.

Since noise from different sources (e.g. two discrete resistors in series) are uncorrelated and independent (it's statistically unlikely that the random fluctuations of both resistors will be exactly the same- in power and in phase at any given time- even at the same temperature or process), the noise must be added in [RMS](https://en.wikipedia.org/wiki/Root_mean_square):
\$\$ v_{noise total} = \sqrt{(v_{noise 1})^{2} + (v_{noise 2})^{2}} \$\$

#### Tempco

Resistors follow similar tempco guidance as other components and generally increase in resistance as temperature increases. However, some resistors are specifically designed with large _and negative_ tempcos- like thermistors- to better serve a specific application like temperature compensation or measurement.

#### Voltage Coefficient of Resistance (VCR)

Resistance of a part can change with applied voltage though this property is often not specified for general low/standard voltage work. High-voltage (HV) resistors, though, will show the VCR as it is a concern for HV work.

### Inductors ![inductor_symbol](Inductor_symbol.png)

Inductors are reactive devices that store energy in a magnetic field when current flows through and oppose changes in current through them. Commonly they are used in:
- Power supplies
- Tuned circuits & filters
- Transformers

#### Construction

Since the inductance of most solenoid inductors follows the equation:
\$\$ L = \frac{N^{2}\mu_{r}\mu_{0}A}{l} \$\$

Manufacturers have worked to increase the inductance of parts by either:
- Increasing the number of turns ($$N$$)
- Increasing loop area ($$A$$)
- Decreasing the length ($$l$$)
- Using new/ferrous core materials to increase relative permeability $$ \mu_{r} $$

#### Non-Idealities

Ideally an inductor has an impedance which follows the equation $$ Z = j \omega L $$ however due to resistive losses and inter-winding capacitance (self-resonance) an inductor will start to behave as a capacitor past its self-resonant frequency and decrease in impedance.

### Capacitors ![cap_symbol](Capacitor_Symbol.png)

Capacitors are reactive devices used to hold charge in an electric circuit and are commonly used for:
- Energy storage
- High-frequency paths
- DC-blocking
- Decoupling

Capacitors can be bi-directional (placed in either direction) or polarized (where the cathode is shown as a "+" in the schematic symbol and is polarity sensitive) like in electrolytic capacitors.

#### Construction

<center><img src="cap_plate.png"></center>
Capacitors are still based on the parallel-plate model above where:
\$\$ C = \frac{k \epsilon_{0} A}{d} \$\$ 
so to reduce package size but increase capacitance, manufacturers have played with each variable:
- Increased area ($$A$$) by using multi-layer design techniques
- Reduced plate distance ($$d$$) by reducing the voltage rating (otherwise dielectric breakdown or arcing could occur)
- Utilize advanced dielectrics in between to increase the coefficient $$k$$

#### Non-Idealities

Ideally a capacitor acts as a purely reactive device and follows the well-known capacitor equation for it's impedance as $$ Z = \frac{1}{j \omega C} $$. However, mainly due to package inductance and resistance, at some higher-frequency of resonance, a capacitor will start having higher impedance as frequency increases as it becomes more inductive. A real capacitor acts like a notch filter.
<center><img src="cap_model.png"></center>

### Diodes ![diode_symbol](diode_symbol.png)

The basic operation of a diode is to conduct current in one direction while blocking current in the opposite direction (asymmetric conductance); the ideal diode has zero resistance in one direction and infinite resistance in the other. Semiconductor diodes are made with a p-n junction.

There are many different types and constructions of diodes for many applications:

#### Zener
#### Schottky
#### TVS
#### LED

### BJT

The bipolar junction transistor (BJT) were of the first semiconductors (solid state devices) developed to replace old vacuum tubes for purposes of amplification. Solid state devices solved a lot of the issues with large, high-voltage tubes and led to integrated circuits due to their ability to operate at much smaller sizes. However, tubes and other thermionic devices are still better suited for very high power and high frequency operation (e.g. 100kW Klystron or 1 MW Traveling Wave Tube) for purposes of Radar or other applications.

The _bipolar_ in the name is in regards to the two complimentary doped semiconductors used to create the transistor- two PN junctions, almost like two diodes squished together at either end depending on the type. However, the devices are unipolar in that they are intended to operate actively with a certain polarity of input voltages:
- **NPN:** requires $$ + V_{base-emitter} , + V_{collector-base} $$
- **PNP:** requires $$ - V_{base-emitter} , - V_{collector-base} $$

This also means signals like zero-offset sinusoids cannot just be plugged into the base of either (since sinusoids oscillate between positive and negative voltages); for this reason, most AC BJT circuits require a **bias** circuit to bring the DC offset/operating-point of the signal within the proper range required.

<center><img src="bjt_npn_pnp.png"></center>

A mnemonic key to remember the difference in symbology is NPN has the arrow **N**ot **P**ointing i**N** (where as PNP has the arrow pointing towards its base).

Transistors can operate in three main modes:
- Cutoff
- Saturation
- Active

#### BJT Component Characteristics

There are a couple things to note when dealing with real (non-ideal) BJTs, for example for a `2N3904` device:
- **Breakdown Voltages:** While BJTs can usually handle a fairly high potential at the collector terminal, the base terminal should not be reverse biased too far; for instance, in the `2N3904`, if the emitter is grounded, the voltage at the base should not go below $$-6 V$$ or one risks breaking the device:
<center><img src="2n3904_base_voltage.png"></center>
- **Beta:** the gain of the BJT is very variable (almost 3x between minimum and maximum values!) and depends on a lot of factors, one mainly being the collector current $$I_{C}$$ present (a higher collector current will often lead to a larger $$\beta$$), so don't rely too much on a single beta value without giving much room for margin:
<center><img src="2n3904_beta.png"></center>
- **Thermal Performance:** besides the usual derating curves and operating points for given system temperatures, BJTs also can suffer from a phenomenon known as thermal runaway; when BJTs start to heat up, temperature dependent characteristics cause even more power to be dissipated, which in turn, cause even more heat. For instance with increased temperature, base-emitter voltage decreases ($$\Delta V_{be} \approx -2.2mV/^{\circ}C$$), $$\beta$$ increases, and emitter current increases (in aforementioned Shockley diode equation, saturation current $$I_{S}$$- though small- nearly doubles ever +10°C). **Thermal junction resistance $$R_{\theta J}$$** is usually given to show the increase in temperature of the device for a given power dissipation through the device; for instance, the `2N3904` has a $$R_{\theta JA}$$ (junction-to-Ambient, means no heatsink, just nominal air flow) of $$200^{\circ}C/W$$, which means for every Watt of power dissipated, the part will increase temperature by roughly 200°C.

#### $$r_{e}$$ / 'T' Model

<center><img src="bjt_re_model.png"></center>

The _T_ or $$ r_{e} $$ model is a simple model for a BJT which is great for quickly characterizing a BJT circuit's behavior for low to mid frequencies. It is modeled as a three-terminal device, with a dynamic resistance $$r_{e}$$ and a simple, linear current-dependent current-source with gain $$\beta$$ (given from the BJT's datasheet) on base current $$i_{b}$$; by KCL, this simply means the total emitter current is $$ i_{e} = (\beta + 1)i_{b} \approx \beta i_{b} $$. _NOTE:_ the simplification of $$ i_{c} \equiv i_{e} $$ is valid for most analog analysis since the gain $$\beta$$ is large- between 100 and 300- such that removing the one extra base current $$i_{b}$$ term is $$< 1\%$$ error. The NPN model is explained here but the PNP is the same with only a difference in polarity.

The collector terminal in the model is an ideal current source since a BJT operating in it's active region has nearly similar characteristics; the collector current $$i_{c}$$ is nearly independent of the collector voltage $$v_{ce}$$ (assuming $$v_{ce}$$ is high enough that BJT is not in saturation).
<center><img src="bjt_saturation.png"></center>
This also follows the ideal current source characteristic of having nearly infinite output impedance:
\$\$ \frac{v}{i}=r \rightarrow  \frac{\Delta v_{ce} \to \infty}{\Delta i_{c} \to 0} \approx \boxed{ r_{o} = \infty \Omega } \$\$

##### Emitter Impedance $$r_{e}$$

The base emitter junction has a dynamic impedance $$r_{e}$$ that is given from the relationship of $$ \frac{v_{be}}{i_{e}} $$. Given the BJT can be seen as a forward biased diode from base to emitter, the Shockley diode equation can show the relationship between $$v_{be}$$ and $$i_{e}$$.
<center><img src="bjt_diodes.png"></center>
\$\$ i_{e} = I_{s}(e^{\frac{v_{be}}{V_{T}}} - 1) \$\$

Where $$ V_{T} = \frac{nKT}{q} $$ and $$n$$ is device parameter (~1), $$K$$ is Boltzmann constant, $$T$$ is absolute temp and $$q$$ is electron charge; at 25°C, $$ V_{T} \approx 26 mV $$. $$I_{s}$$ is saturation current ($$\approx 10^{-12}$$). So since $$\frac{v_{be}}{i_{e}}$$ is not linear, and a fixed $$r_{e}$$ is ideal for our simple model, we can pick a value of $$i_{e}$$ on the curve that is nominal for the application at hand and make linear by taking the derivative of the Shockley diode equation w.r.t. $$v_{be}$$:
\$\$ \frac{\partial }{\partial v_{be}} \left [ I_{s}(e^{\frac{v_{be}}{V_{T}}} - 1) \right ] \Rightarrow \frac{I_{s}}{V_{T}}e^{\frac{v_{be}}{V_{T}}} \approx \frac{i_{e}}{V_{T}} \$\$
\$\$ \frac{i_{e}}{V_{T}} = \frac{1}{r_{e}} \therefore \boxed{ r_{e} = \frac{V_{T}}{i_{e}} }\$\$
<center><img src="shockley_derivative.png"></center>
With this equation, quick estimates of emitter impedance can be made; for instance, at room temperature and with a design specification of $$i_{e}=1mA$$, the emitter resistance is $$ \frac{26 mV}{1 mA} = 26 \Omega $$.

#### Input Impedance

To get the input impedance of the BJT model looking into the base terminal, we can express as $$Z_{in} = \frac{v_{in}}{i_{in}} = \frac{v_{be}}{i_{b}}$$. The base-emitter voltage $$v_{be}$$ can be expressed as the voltage created by the emitter current $$i_{e}$$ through the previously calculated emitter impedance $$r_{e}$$ (using a specified collector current), and simplified to be a function of base current $$i_{b}$$:
\$\$ v_{b} = i_{e}r_{e} \Rightarrow (i_{b}+i_{c})r_{e} \Rightarrow (i_{b}+ \beta i_{b})r_{e} \Rightarrow i_{b} (\beta + 1)r_{e} \$\$
\$\$ \therefore Z_{in} = \frac{v_{b}}{i_{b}} = \frac{i_{b}(\beta + 1)r_{e}}{i_{b}} \Rightarrow \boxed{ Z_{in_{BJT}} = (\beta + 1)r_{e} } \$\$

Plugging the value of $$\beta$$ in for the same specified collector current- usually given in a datasheet- gives the resultant input impedance; this also means the variations in $$\beta$$ (over process, temperature and collector current) have a direct impact on input impedance as well.

This same calculation follows for input impedance when resistance is added to the emitter (e.g. emitter resistor $$R_{E}$$) in a common emitter design such that the base voltage is still dependent on the current flow through the total resistance at the emitter. Thus, this can also be expressed as:
\$\$ Z_{in} = (\beta + 1)(r_{e} + R_{E}) \$\$

Furthermore, the bias resistors $$R1$$ and $$R2$$ in an amplifier stage (explained more below) can be factored into the input impedance as being in parallel with this adjusted BJT impedance:
<center><img src="CE_Zin.png" width="500"></center>
\$\$ Z_{in_{amp}} = R1 \parallel R2 \parallel Z_{in_{BJT}} \$\$

Again, input impedance of the BJT is directly related to $$\beta$$ but overall input impedance, due to the parallel nature of the bias resistors, is dominated by the least resistance, commonly the $$R2$$ bottom leg resistor.

#### Voltage Gain & Output Impedance

##### Common Emitter

For a simple common emitter configuration where the output voltage comes from the collector node- note, the DC bias circuit is not present but for instructional sake, ignore for now- the voltage gain can be found using similar parameters above (given specified $$i_{c}$$, $$\beta$$ and $$r_{e}$$) using small-signal analysis (note also setting DC voltage sources like $$V_{CC} \rightarrow 0V$$):
<center><img src="bjt_common_emitter.png"></center>
Voltage gain is given by: 
\$\$ A_{v} = \frac{v_{out}}{v_{in}} = \frac{v_{c}}{v_{b}} \$\$

Collector voltage is negative due to grounding the $$V_{CC}$$ and current flowing towards the emitter such that:
\$\$ v_{c} = -i_{c}R_{c} = -\beta i_{b}R_{c} \$\$

Base voltage is produced by the emitter current $$i_{e}$$ through the equivalent series resistance of $$r_{e} + R_{e}$$ but is simplified in terms of $$i_{b}$$ (given relationship with current gain $$\beta$$) such that we can simplify the voltage gain equation:
\$\$ v_{b} = i_{e}(r_{e} + R_{e}) \Rightarrow i_{b}(\beta + 1)(r_{e} + R_{E}) \$\$
\$\$ \therefore A_{v} = \frac{v_{c}}{v_{b}} \Rightarrow \frac{-\beta i_{b}R_{c}}{i_{b}(\beta + 1)(r_{e} + R_{E})} \$\$

Since we already approximated $$ \beta \approx \beta + 1 $$, the voltage gain can be further simplified with little error to:
\$\$ \frac{-\beta i_{b}R_{c}}{i_{b}(\beta + 1)(r_{e} + R_{E})} \approx \frac{-\beta i_{b}R_{c}}{\beta i_{b}(r_{e} + R_{E})} \Rightarrow A_{v} = -\frac{R_{c}}{r_{e}+R_{e}} \$\$

Furthermore, since usually the emitter resistor component $$ R_{e} \gg r_{e} $$ (e.g. given a nominal $$r_{e}=26 \Omega$$ at room temp and $$i_{c}=1 mA$$ and $$R_{e} > 1 k\Omega$$), $$r_{e}$$ can often be ignored with reasonable error such that:
\$\$ \boxed { A_{v} \approx -\frac{R_{c}}{R_{e}}, when (R_{e} \gg r_{e}) } \$\$

What's also powerful about this simplification is that the ideal voltage gain is independent of device characteristics like $$\beta$$.

When looking at the output impedance of the $$r_{e}$$ model of a common emitter configuration, the external resistor $$R_{c}$$ is in parallel with the series combination of the current source impedance $$Z_{c}$$, $$r_{e}$$ and external resistor $$R_{e}$$:
\$\$ Z_{out} = R_{c} \parallel (Z_{c} + r_{e} + R_{e}) \$\$

However, since in this model we are using an ideal current source, the impedance $$Z_{c} = \infty$$. Thus, the added resistances $$r_{e}$$ and $$R_{e}$$ are insignificant and the series impedance is $$\infty$$, and since this looks like an open circuit in parallel with $$R_{c}$$, the output resistance is simply $$R_{c}$$:
\$\$ Z_{out} = R_{c} \parallel \infty \Rightarrow \boxed { Z_{out} = R_{c} } \$\$

Technically though, the current source in our model doesn't have infinite inpedance and actually can be specified by the BJT's datasheet as output admittance $$h_{oe}$$ in $$\mho$$, the inverse of which gives the output impedance of the BJT as $$r_{o}$$.
<center><img src="CE_Zout.png" height="500"></center>
This value is highly dependent on base current (see varying $$I_{C}$$ vs $$V_{CE}$$ slopes [discussed previously](#r_e--t-model)) but is sometimes large enough to be a factor in computing output impedance such that:
\$\$ \boxed{ Z_{out} \approx r_{o} \parallel R_{C} } \$\$

When the series combination of $$r_{e} + R_{E}$$ is negligible compared to $$r_{o}$$, which is often the case.

This inclusion of $$r_{o}$$ can affect voltage gain as well if it's in the same order of magnitude as $$R_{C}$$; both are in parallel with each other so a more precise output voltage at the collector would be the potential across both. Thus CE voltage gain can be given as:
\$\$ A_{v} = -\frac{R_{C} \parallel r_{o}}{r_{e} + R_{E}} \$\$

##### Common Collector

For a common collector configuration, the output voltage comes from the emitter node.
<center><img src="bjt_common_collector.png"></center>
Thus $$v_{out}$$ is produced from the current through external resistor $$R_{e}$$ such that:
\$\$ v_{out} = i_{e}R_{e} \$\$

The base voltage at the input is the emitter current through the series resistance of $$r_{e}$$ and $$R_{e}$$:
\$\$ v_{in} = v_{b} = i_{e}(r_{e} + R_{e}) \$\$
\$\$ A_{v} = \frac{v_{out}}{v_{in}} = \frac{i_{e}R_{e}}{i_{e}(r_{e}+R_{e})} = \frac{R_{e}}{(r_{e}+R_{e})} \approx \frac{R_{e}}{R_{e}}, when (R_{e} \gg r_{e}) \$\$
\$\$ \boxed { \therefore A_{v} \approx 1 } \$\$

The common collector's near unity gain is why this configuration is also called a Voltage Follower as the output voltage closely follows the input voltage.

The output impedance for a common collector is a little less apparent though; since it's known that the ideal current source has $$\infty$$ impedance, the whole collector node looks like an open circuit and thus one would reason that $$ Z_{out} = R_{e} \parallel (r_{e} + R_{b}) $$ (note an added base resistance to illustrate the point). However, this is not true as the **current through $$r_{e}$$ and $$R_{b}$$ are not the same!** To solve this, we know that the emitter current $$ i_{e} = i_{b}(\beta + 1)$$ thus we treat the current as a ratio of $$ i_{b} : i_{b}(\beta + 1) $$ through $$R_{b}$$ and $$r_{e}$$ respectively. This means the current through $$R_{b}$$ is $$\beta + 1$$ times less than through the emitter so we can treat the base resistance as effectively equalling $$R_{b}'=\frac{R_{b}}{\beta + 1}$$.

<center><img src="bjt_common_collector_zout.png"></center>
\$\$ \therefore Z_{out} = R_{e} \parallel (r_{e} + R_{b}') \Rightarrow \boxed { Z_{out} = R_{e} \parallel (r_{e} + \frac{R_{b}}{\beta + 1}) } \$\$

This effective scaling of the base-emitter impedances through the BJT is known as the **base-emitter reflection rule** and means that impedances at the emitter appear $$\beta + 1$$ times _larger_ when looking in through the base and, inversely, base impedances appear $$\beta + 1$$ times _smaller_ when looking through the emitter.

#### Current Gain

Current gain, $$A_{i}$$, of a particular BJT circuit can be used to determine how many "stages" of BJT amplifiers are required to meet a system level gain specification. Current gain is simply output current divided by input current, so simplifying further, we can see current gain is the voltage gain multiplied by the ration of input impedance to output impedance:
\$\$ A_{i} = \frac{i_{o}}{i_{i}} = \frac{v_{o}/Z_{o}}{v_{i}/Z_{i}} = \frac{v_{o}}{v_{i}}*\frac{Z_{i}}{Z_{o}} \$\$

\$\$ \boxed{ \therefore A_{i} = A_{v}\frac{Z_{in}}{Z_{out}} } \$\$

##### Common Emitter

With common CE circuits, this current gain is similar to the $$\beta$$ of the BJT used. So if a system needs a current gain that is $$ \gg \beta$$, than one knows multiple stages will be required to meet that spec.

##### Common Collector

Since the voltage gain for a CC stage is about unity, the current gain is $$A_{i} \approx \frac{Z_{in}}{Z_{out}}$$. From previous, we know the output impedance is (when DC bias resistors are used and $$R_{b}=R_{1}\parallel R_{2}$$):
\$\$ Z_{out} = R_{e} \parallel (r_{e} + \frac{R_{1}\parallel R_{2}}{\beta + 1}) \$\$

And we know the input impedance to be:
\$\$ Z_{in} = R1 \parallel R2 \parallel (\beta + 1)(r_{e} + R_{E}) \$\$

\$\$ \therefore \boxed {A_{i} = \frac{R1 \parallel R2 \parallel (\beta + 1)(r_{e} + R_{E})}{R_{e} \parallel (r_{e} + \frac{R_{1}\parallel R_{2}}{\beta + 1})} } \$\$

This current gain is nominally $$A_{i} \approx \beta^{2}$$ which makes the CC amplifier a great buffer.


#### BJT Biasing for AC Circuits

Since the AC performance or application of BJT circuits is highly dependent on collector current $$I_{C}$$ and other DC operating points- as well as fundamentally keeping a BJT in its active region, for instance- the need for proper biasing circuitry around a BJT circuit is critical to the overall design. A DC bias circuit may also contend with circuit/environment variables such as:
- Ambient temperature changes
- Part/process variation (resulting in changes to $$\beta$$ for instance)
- Resistor tolerances
- Power dissipation (self-heating affecting tempco similarly to ambient temperature changes)

For example, DC bias of an NPN BJT should generally achieve the following to operate adequately:
- $$V_{CE}$$ high enough that the BJT is operating in its Active region (out of saturation)
- Base-emitter voltage $$V_{BE} > 0V$$
- Base-collector voltage $$V_{BC} < 0V$$

##### Standard Voltage-Divider Bias Circuit

<center><img src="std_bjt_bias.png"></center>

To specify a standard voltage-divider bias network for an NPN BJT, there are some general steps one can take:
1. **Set $$V_{C} = \frac{V_{cc} - V_{ee}}{2}$$:** this allows the most voltage swing at the collector, equally in both directions. If the rail voltages are fairly low, the drop across $$R_{E}$$ can be accounted for by setting:
\$\$ V_{C} = \frac{V_{cc} - V_{E}}{2} \$\$
Since for NPN transistors to function, $$V_{CE}$$ must be positive, so any drop across $$R_{E}$$ is not available as voltage swing at the collector.
2. **Set Collector Current $$I_{C}$$ large enough for required output current:** make sure the intended collector current isn't too high that the BJT is dissipating too much power but also high enough that the current gain $$\beta$$ is high enough for good high frequency performance; this is commonly in the range of 0.1mA to 10 mA.
3. **Set Emitter Voltage $$V_{E}$$ slightly above $$V_{ee}$$:** since we want the largest output voltage swing range at the collector, we relatively want the emitter voltage to be close to the negative rail. However, we also want to account for changes in emitter voltage due to temperature; given a constant $$V_{B}$$, the drop $$V_{be}$$ has a tempco of around -2mV/°C, so for every +1°C increase in temperature, the emitter voltage $$V_{E}$$ increases by +2mV, thereby increasing $$I_{E}$$. So for instance, if $$V_{ee} = GND (0V)$$, set $$V_{E} = 1V$$ so changes in $$V_{be}$$ do not affect emitter current too greatly, while also not wasting too much power across $$R_{E}$$. If temperature stability is desired though- at the cost of decreased output range- one can increase $$V_{E}$$ so that the change in $$V_{be}$$ is even less noticeable.
4. **Set Emitter Resistor $$R_{E}$$:** with a target $$V_{E}$$, and the assumption that $$ I_{E} \approx I_{C} $$ for large $$\beta$$, we can set the emitter resistor knowing the potential across it and the current through it:
\$\$ R_{E} = \frac{V_{E} - V_{ee}}{I_{C}} \$\$
5. **Set Collector Resistor $$R_{C}$$:** given the intended DC operating point of $$I_{C}$$ and $$V_{C}$$, the resistor can simply be calculated by:
\$\$ R_{C} = \frac{V_{cc} - V_{C}}{I_{C}} \$\$
6. **Specify $$V_{B} = V_{E intended} + V_{be}$$:** with an intended emitter potential of 1V and $$V_{be} \approx 0.7V$$, the base voltage should be set to 1.7V. This will be achieved by the voltage divider of $$V_{cc}$$ with $$R1$$ & $$R2$$. The simple resistive voltage divider does not provide tightly controlled line regulation (e.g. doesn't compensate for changes in $$V_{cc}$$) nor load regulation (e.g. doesn't compensate for changes in load current) but is adequate for most designs. However, the selection of these resistors cannot be arbitrary as they also control the base current $$I_{B}$$.
7. **Target $$I_{B}$$ given expected BJT current gain:** use the typical current gain $$\beta$$ of the BJT used to calculate the target base current given the collector current specified. The most robust DC bias design (over temp and process variation) should calculate intended base current using the _minimum_ expected $$\beta$$ of the BJT, though remember $$\beta$$ is also dependent on collector current $$I_{C}$$ and temperature:
\$\$ I_{B} = \frac{I_{C}}{\beta_{min}} \$\$
8. **Set Voltage Divider Resistors:** A rule of thumb in this design is to have the current through the voltage divider be about 10x that which flows into the base of the BJT; this is a compromise between a low impedance circuit with high base current (which provides more stable bias but also causes a lot of current to divert from the transistor leading to more static power consumption) and a higher impedance circuit with low base current (which is more susceptible to fluctuations in collector voltage due to changes in $$\beta$$). Thus, the bottom leg of the divider can be found by:
\$\$ R_{2} = \frac{V_{B} - V_{ee}}{10 * I_{B}} \$\$
Similarly the top leg is found by accounting for the extra base current pulled through the same resistor (current entering base node is equal to current flowing out to BJT + current flowing through bottom resistor leg):
\$\$ R_{1} = \frac{V_{cc} - V_{B}}{11 * I_{B}} \$\$

The capacitors $$C_{IN}$$ and $$C_{C}$$ are used to isolate the bias circuit from external DC disturbance or loading while allowing AC voltages to pass. $$C_{e}$$ is chosen to bypass the emitter resistor at operating frequencies to allow full AC gain.

Deviations from these design parameters due to process (min/max device $$\beta$$) or temperature (change in $$\beta$$ and $$V_{be}$$) can be calculated by:
1. Computing new values of base current (due to changes in $$\beta$$ for a target $$I_{C}$$) and base voltage given the thevenin equivalent circuit of the resistor divider network:
\$\$ V_{B} = V_{cc}(\frac{R_{2}}{R_{1} + R_{2}}) - (\frac{I_{C}}{\beta})R_{1}\parallel R_{2} \$\$
2. Calculating any changes in circuit due to system changes (e.g. $$V_{be}$$ changes with temperature).
3. Using any changes to potential $$V_{E}$$ over $$R_{E}$$ to calculate changes in emitter current, which we can equate to changes in collector current since $$I_{E} \approx I_{C}$$.
4. If there's a large change in calculated $$I_{C}$$ than what was assumed in Step 1, recalculate steps 1-3 until the change is minimal (the values considered converged).
5. Calculate output voltage at the collector knowing the positive rail voltage and current through $$R_{C}$$:
\$\$ V_{C} = V_{cc} - I_{C}R_{C} \$\$

In general this bias design uses a fair amount of components but can maintain $$\approx 10\%$$ of output across a range of temperature and $$\beta$$ fluctuations.

#### Common Emitter Amplifier Design

##### Improving Voltage Gain

As noted earlier in [standard bias circuit design](#standard-voltage-divider-bias-circuit), the existence of the emitter capacitor $$C_{E}$$ is used to help bypass the emitter resistor $$R_{E}$$ at operating frequencies. This is because we don't want to mess with the DC bias resistors we setup for stability but we usually want improved voltage gain over the [standard CE voltage gain](#voltage-gain--output-impedance) given by $$A_{v} = -\frac{R_{C} \parallel r_{o}}{r_{e} + R_{E}}$$; for instance with $$R_{C} = 1.4k\Omega$$, $$R_{E} + r_{e} = 100\Omega$$ and $$r_{o} \gg R_{C}$$, the gain is only 14.

_Full Bypass_

With a capacitor $$C_{E}$$ directly in parallel with $$R_{E}$$, the external emitter resistance is completely shorted at high frequencies (or large enough for a given range of frequency operation) which leads to maximum gain due to being only limited by the BJT's internal emitter resistance:
<center><img src="CE_cap_full_bypass.png" height="500"></center>
\$\$ A_{v} = -\frac{R_{C} \parallel r_{o}}{r_{e} + R_{E}} \overset{R_{E}=0}{\rightarrow} A_{v} = -\frac{R_{C} \parallel r_{o}}{r_{e}} \approx \boxed{ -\frac{R_{C}}{r_{e}}, (r_{o} \gg R_{C}) } \$\$

_Partial Bypass_

However, in most systems we want to control the actual amount of gain in a given CE amplifier which means we only want to short _some_ of the emitter resistance, but not all. This leads to a common configuration where the DC emitter resistance found from standard bias calculations is split into two resistors, with the bottom leg being shorted at high-frequencies (there is another configuration where the second resistor follows the capacitor but involves heavier math- parallel resistance with $$R_{E}$$- with little benefit):
<center><img src="CE_cap_partial_bypass.png" height="500"></center>
Where the top resistor $$\hat{R_{E}}$$ that is always present is simply the calculated DC Bias emitter resistor $$R_{E}$$ subtracted by the series resistor $$R_{es}$$ which is shorted at high frequencies:
\$\$ \hat{R_{E}} = R_{E} - R_{es} \$\$

So at high frequencies, the voltage gain is given by:
\$\$\ A_{v} = -\frac{R_{C} \parallel r_{o}}{r_{e} + \hat{R_{E}}} \approx \boxed{ -\frac{R_{C}}{r_{e} + \hat{R_{E}}}, (r_{o} \gg R_{C}) } \$\$

And, given an already calculated $$R_{C}$$ from the bias circuit, and a calculated $$r_{e}$$, one can find $$\hat{R_{E}}$$ and $$R_{es}$$ from:
\$\$ \hat{R_{E}} = \frac{R_{C} \parallel r_{o}}{A_{v_{target}}} - r_{e} \$\$
\$\$ R_{es} = R_{E_{DC Bias}} - \hat{ R_{E} } \$\$

This addition of the emitter capacitor means that the [BJT input impedance we calculated earlier](#input-impedance) needs to be adjusted for:
\$\$ Z_{in_{BJT}} = (\beta + 1)(r_{e} + Z_{emitter}) \$\$

With no $$\hat{R_{E}}$$, thus maximum gain, the input impedance is very low which can lead to voltage divider errors at the input (ideally we want as high input impedance as possible for voltage amplifiers). The more voltage gain, the lower the input impedance.

As mentioned before, current gain $$A_{i}$$ is mainly dependent on device $$\beta$$, and it is largely independent of the emitter capacitance added to bypass the emitter resistor. As the voltage gain $$A_{v}$$ is nearly inversely related to input impedance $$Z_{in}$$, when $$A_{v}$$ rises with added bypass in the emitter circuit, $$Z_{in}$$ drops at a similar rate.

##### Isolating Output Load

Since we don't want the DC bias circuit to be affected by a load connected at the output, it's common to add a series, DC-blocking, output capacitor $$C_{out}$$ to isolate the CE circuit from the load.
<center><img src="CE_Cap_out.png" height="500"></center>

However, this has consequences on the AC circuit response as the load is in parallel with the $$r_{e}$$ small signal BJT model (shown w/o emitter capacitor):
<center><img src="CE_load_gain.png" height="500"></center>

This leads to the collector voltage being $$v_{c} = -i_{c}(r_{o} \parallel R_{C} \parallel Z_{load})$$. Therefore, the voltage gain equation, with an emitter capacitor from above, can be expanded with a load attached as:
\$\$ A_{v} = -\frac{R_{C}}{r_{e} + \hat{R_{E}}} \overset{w/load}{\rightarrow} \boxed{ A_{v} = -\frac{(r_{o} \parallel R_{C} \parallel Z_{load})}{r_{e} + \hat{R_{E}}} } \$\$

This means that to preserve a target voltage gain, ideally the load impedance $$Z_{L} \gg (r_{o} \parallel R_{C})$$ (and since $$r_{o}$$ is usually much greater than $$R_{C}$$, we can usually simplify that we want load impedance to be much more greater than $$R_{C}$$). Thus, with light loads relative to the collector resistance, the voltage gain drops below specification.

##### Frequency Response & Capacitor Selection

Nominally, a BJT CE amplifier circuit will not operate from DC to Daylight but instead in a certain band of frequencies. The 3dB bandwidth has many factors. The low frequency cutoff is mainly a function of the input & output DC coupling capacitors and the emitter capacitor (if used for higher gain). The high frequency cutoff is dependent upon the BJT's specifications- a BJT only has a certain bandwidth itself- and the capacitance of the connected load. To acheive a certain low & high frequency cutoff, we must choose the emitter, input and output capacitors.

_Emitter Capacitor Selection- Full Bypass_

In a full-bypass emitter configuration for a CE amplifier, the capacitor is in parallel with $$R_{E}$$ and we already know the gain is given by $$ A_{v} = - \frac{R_{C}}{r_{e} + Z_{E}} $$. To expand this, the emitter impedance is $$Z_{E} = R_{E} \parallel X_{C_{E}} = \frac{R_{E}}{1 + j\omega R_{E}C_{E}} $$. Thus the full derivation of gain is:
\$\$ A_{v} = -\frac{R_{C}}{r_{e} + \frac{R_{E}}{1 + j\omega R_{E}C_{E}}} \$\$

As before, when the input frequency is well above the lower cutoff frequency $$\omega_{c}$$, the gain can be simplified to:
\$\$ A_{v} \mid_{ \omega \gg \omega_{c}} \approx -\frac{R_{C}}{r_{e}} \$\$

So if we desire to find the lower frequency cutoff point, the gain will be 3dB lower than the midband gain leading or $$A_{v}\times\frac{1}{\sqrt{2}}$$. So setting the two gain equations equal to each other can solve for the desired emitter capacitor using the magnitude of the reactive impedance:
\$\$ -\frac{R_{C}}{\sqrt{2}r_{e}} = -\frac{R_{C}}{r_{e} + \frac{R_{E}}{1 + j\omega_{c} R_{E}C_{E}}} \$\$
\$\$ \frac{1}{\sqrt{2}r_{e}} = \left | \frac{1 + j\omega_{c} R_{E}C_{E}}{r_{e}(1 + j\omega_{c} R_{E}C_{E}) + R_{E}} \right | \rightarrow \frac{1}{\sqrt{2}r_{e}} = \frac{\sqrt{1^{2} + (\omega_{c} R_{E}C_{E})^{2}}}{\sqrt{(r_{e}+R_{E})^{2}+(\omega_{c} R_{E}C_{E})^{2}}} \$\$
\$\$ \frac{1}{2r_{e}^{2}} = \frac{1 + (\omega_{c} R_{E}C_{E})^{2}}{(r_{e}+R_{E})^{2}+(\omega_{c} R_{E}C_{E})^{2}} \$\$
\$\$ \dots \$\$
\$\$ C_{E}^{2} = \frac{(R_{E} + r_{e})^{2} - 2 r_{e}^{2}}{r_{e}^{2}\omega_{c}^{2}R_{E}^{2}} \$\$

When BJT internal emitter resistance $$r_{e}$$ is $$\ll R_{E}$$- which is often the case- the numerator of the equation above can reduce yeilding a much simpler, and logical, representation of required capacitance as essentially a time constant $$\tau$$ related to $$r_{e}$$:
\$\$ R_{E} \gg r_{e} \implies C_{E}^{2} = \frac{R_{E}^{2}}{r_{e}^{2}\omega_{c}^{2}R_{E}^{2}} \rightarrow \boxed{ C_{E}=\frac{1}{r_{e}\omega_{c}} } \$\$

_Emitter Capacitor Selection- Partial Bypass_

A similar derivation as above can be performed (equating mid-band gain equation at -3dB with the full voltage gain equation with emitter capacitor reactance to solve for emitter capacitance at a certain frequency) and is very lengthy and leads to:

$$ C_{E} = \frac{ \sqrt{ R_{es}^{2} - (r_{e} + \hat{R}_{E})^{2} + 2(r_{e} + \hat{R}_{E})R_{es} }}{\omega_{c}(r_{e} + \hat{R}_{E})R_{es}} $$

But this is not intuitive and can be approximated into a time constant like equation above based on the nearly equivalent resistance of $$R_{es} \parallel (r_{e} + \hat{R}_{E})$$:

$$ \boxed{ C_{E} \approx \frac{1}{[R_{es} \parallel (r_{e} + \hat{R}_{E})]\omega_{c}} } $$

_Input Capacitor Selection_

Given we know the [total input impedance of a CE circuit](#input-impedance) to be $$ R_{1} \parallel R_{2} \parallel Z_{in_{BJT}} $$, we can assume that any emitter capacitor has impedance $$X_{C_{E}}=0$$ such that the input capacitor is chosen for a given low frequency cutoff $$\omega_{c}$$ as:
\$\$ \boxed{ C_{in} = \frac{1}{\omega_{c}(R_{1} \parallel R_{2} \parallel Z_{in_{BJT}})} } \$\$

_Output Capacitor Selection_

Similarly to the input capacitor selection, the output capacitor forms a time constant $$\tau$$ with the output impedance- which we [know previously to be](#voltage-gain--output-impedance) $$Z_{out} = r_{o} \parallel R_{C}$$- and the load impedance (which could be a nominal/specified load or the input impedance of the following amplifier stage):
\$\$ \boxed{ C_{out} = \frac{1}{\omega_{c}[(r_{o} \parallel R_{C}) + Z_{Load}]} } \$\$

In general, the computed capacitor values can be rounded up to the next largest standard value to ensure the lower frequency cutoff specification is met or exceeded given the other system variables and component tolerances.

#### Common Collector Amplifier Design

Common Collector (CC) amplifiers are useful circuit building blocks in that they provide high input impedance (which presents less of a load to a previous stage/input) and low output impedance (less voltage divider error to following stage, assuming it has high input impedance) while having a voltage gain $$A_{v} \approx 1$$; this unity gain is useful in seperating stages and using a CC amplifier as a buffer (or impedance transformer) as well as the fact that they [have very large current gain](#common-collector-1) usually with $$A_{i} \approx \beta^{2}$$.

<center><img src="CC_amp.png" height="500"></center>

The biasing design [is similar to a CE stage](#standard-voltage-divider-bias-circuit) however:
* The Collector is tied directly to $$V_{cc}$$ (no collector resistor needed).
* Output is taken from the emitter node so set the DC bias halfway between the rail voltages $$V_{E}=\frac{V_{cc}-V_{ee}}{2}$$ to maximize output voltage swing.

#### Common Base Amplifier Design

<center><img src="CB_Amp.png"></center>
In a common base (CB) BJT amplifier, the output is taken at the collector and the input is applied to the emitter through an AC coupling capacitor $$C_{in}$$ to protect the DC bias. The DC bias is similar to the CE circuit, however the emitter resistor can be replaced with a generic current source and $$V_{E}$$ is highly application dependent.

The input impedance (ignoring the source impedance connected in the diagram) looking into the emitter is simply the parallel combination of $$r_{e}$$ and $$Z_{E}$$, where $$Z_{E}$$ can be either a standard emitter resistor $$R_{E}$$ or the impedance of a current source (e.g. $$r_{o}$$):
\$\$ Z_{in} = r_{e} \parallel Z_{E} \$\$

Output impedance looking into the collector is similarly the parallel resistance of the collector resistor and the inverse of the BJT admittance $$h_{OE}$$:
\$\$ Z_{out} = R_{C} \parallel r_{o} \rightarrow Z_{out} \approx R_{C}, when \frac{1}{h_{OE}} \gg R_{C} \$\$

The voltage gain can be given by finding the ratio of collector voltage to emitter voltage:
\$\$ v_{out} = -i_{c}(r_{o} \parallel R_{C}) = -i_{b}\beta (r_{o} \parallel R_{C}) \$\$
\$\$ v_{in} = -i_{b}(\beta + 1)(R_{s} + r_{e}) \$\$
\$\$ A_{v} \triangleq \frac{v_{i}}{v_{o}} = \frac{-i_{b}\beta (r_{o} \parallel R_{C})}{-i_{b}(\beta + 1)(R_{s} + r_{e})} \approx \boxed{ \frac{r_{o} \parallel R_{C}}{R_{s} + r_{e}} } \$\$

The current gain defined as $$A_{i} \triangleq A_{v}\frac{Z_{in}}{Z_{out}}$$ can be found as:
\$\$ A_{i} = (\frac{r_{o} \parallel R_{C}}{R_{s} + r_{e}})(\frac{r_{e} \parallel Z_{E}}{R_{C} \parallel r_{o}}) \rightarrow \frac{r_{e} \parallel Z_{E}}{R_{S} + r_{e}} \$\$
This can be further reduced if $$Z_{E} \gg r_{e}$$ and no source connected so $$R_{S} = 0$$:
\$\$ A_{i} \approx \frac{r_{e}}{r_{e}} \rightarrow \boxed{ A_{i} \approx 1 } \$\$

This makes sense that current gain is about unity since $$I_{C} \approx I_{E}$$. Thus the CB amplifier can be used as a current gain buffer.

#### BJT High-Frequency Response

##### Gain-Bandwidth Product

The main figure of merit for high-frequency response of a BJT is it's current [gain-bandwidth product](https://en.wikipedia.org/wiki/Gain%E2%80%93bandwidth_product) (GBW) which is usually given in datasheets as $$f_{T}$$ or it's transition frequency.
<center><img src="BJT_FT.gif"></center>
This transition frequency is the extrapolated product of the low frequency current gain and the high cutoff frequency (-3dB point) as it is representative of the frequency at which the current gain would drop to unity (gain of 1, or 0dB). This also means that there is a direct tradeoff between gain and bandwith; the higher the magnitude of the gain $$|A_{v}|$$, the lower the high-frequency 3dB cutoff point $$f_{B}$$ occurs:
\$\$ f_{B} = \frac{f_{T}}{|A_{v}|} \$\$
<center><img src="BJT_GBW.png" height="300"></center>
$$f_{T}$$ also increases with collector current $$I_{C}$$ so running a BJT hotter can increase its effective BW (up to a certain point).

##### Miller Effect

Another primary factor in the high-frequency BW limit of BJTs in large, inverting gain configurations (e.g. CE amplifiers) is due to the [Miller effect](https://en.wikipedia.org/wiki/Miller_effect) which effectively multiplies the stray input capacitance of the BJT by the voltage gain. The miller capacitance can be shown with an ideal inverting voltage amplifier with gain $$A_{v}$$ ($$\therefore V_{o}=-A_{v}V_{i}$$) and reactive impedance $$Z=X_{Cm}$$:
<center><img src="miller_effect.png" height="150"></center>
Given an ideal amplifier, the amplifier input draws no current ($$\infty$$ input impedance) so all the current goes through $$Z$$ leading to an input impedance inversely related to gain:
\$\$ I_{i}=\frac{V_{i}-V_{o}}{Z}=\frac{V_{i}(1+A_{v})}{Z} \rightarrow Z_{in}=\frac{V_{i}}{I_{i}}=\frac{Z}{1+A_{v}} \$\$
With $$Z=X_{C}=\frac{1}{j\omega C_{in}}$$, we can see where the multiplicative effect of gain on input capacitance $$C_{in}$$ comes from and the effective miller capacitance $$C_{m}$$ is derived by $$\eqref{eq:c_miller}$$:
\$\$
\begin{equation}
  Z_{in} = \frac{1}{j\omega C_{in}(1+A_{v})} \rightarrow \boxed { \therefore C_{m}=(1+A_{v})C_{in} }
  \label{eq:c_miller}
\end{equation}
\$\$

For a BJT there exists two main stray capacitances: input capacitance (between base and emitter) and output capacitance (between collector and base). The miller capacitance $$C_{m}$$ (which is a product of voltage gain $$A_{v}$$ and $$C_{cb}$$) is added to the input stray capacitance
<center><img src="BJT_miller.png" height="500"></center>
Thus, given an input impedance of the BJT circuit and the source impedance of an input voltage source, there exists a pole from the time constant $$\tau = RC$$ formed which gives the dominant high-frequency cutoff point $$f_{H,1} \eqref{eq:bjt_fh1}$$:
\$\$
\begin{equation}
  f_{H,1} = \frac{1}{2\pi(Z_{source} \parallel Z_{in})(C_{be} + (1-A_{v})C_{cb})}
  \label{eq:bjt_fh1}
\end{equation}
\$\$
There also exists another HF pole $$f_{H,2}$$ given from the output capacitance & output impedance, however it's usually much higher frequency than the input capacitance (assuming no external load capacitance):
\$\$ f_{H,2} = \frac{1}{2\pi Z_{out}C_{out}} \$\$
Note, $$C_{out} \approx \frac{A_{v}+1}{A_{v}}C_{cb}$$.

#### Cascaded CE Amplifiers

Since we know that there's a tradeoff between gain and bandwidth in a BJT amplifier, what if we wanted the best of both worlds? That's where cascading one or more CE amplifiers to the output of a CE stage may help. For instance, if we need to hit system gain $$A$$, but need higher BW, we could use two CE stages, each with a gain of $$\sqrt{A}$$ to achieve more BW in each stage (due to constant gain-bandwidth product). For voltage stages, we ideally want high input impedance and low output impedance to minimize voltage divider losses to each stage.

There are two main methods to calculate system gain of a cascaded CE that produce similar results:
1. Compute unloaded gain $$G$$, $$Z_{in}$$ and $$Z_{out}$$ for each stage and cascade the transfer functions. Then correct for voltage divider loss between stages.
2. Compute the loaded gain of each stage by including the load resistance in the gain calculation. Then cascade transfer functions.

For example, with the following cascaded CE circuit, method #1 can be used to find the system gain:
<center><img src="Cascade_CE.png"></center>
- **Stage 1 Properties**
  + Base voltage: $$V_{B}=V_{cc}(\frac{R_{12}}{R_{11}+R_{12}}) \approx 1.7V$$
  + Emitter voltage: $$V_{E}=V_{B}-v_{be} \approx 1.0V$$
  + Device Current: $$I_{E}=\frac{V_{E}}{R_{e1}} = 1.0mA \rightarrow \approx I_{C}$$
  + BJT internal resistance: $$r_{e}=\frac{V_{T}}{I_{E}} = 26\Omega$$
  + Device $$\beta$$ @ $$I_{C}=1.0mA \rightarrow \beta = 120$$
  + Inverse output admittance @ $$ I_{C}=1mA \rightarrow r_{o} = 120k\Omega$$
  + Input Impedance: $$Z_{in1} = R_{11} \parallel R_{12} \parallel (\beta + 1)r_{e} = 2.7k\Omega$$
  + Voltage Gain: $$A_{v}=-\frac{R_{c1}}{r_{e}} = -230$$
  + Output Impedance: $$Z_{out1} = r_{o} \parallel R_{c1} \approx 6k\Omega$$
- **Stage 2 Properties**
  + Base voltage: $$V_{B}=V_{cc}(\frac{R_{22}}{R_{21}+R_{22}}) \approx 1.8V$$
  + Emitter voltage: $$V_{E}=V_{B}-v_{be} \approx 1.1V$$
  + Device Current: $$I_{E}=\frac{V_{E}}{R_{e2}} \approx 5.0mA \rightarrow \approx I_{C}$$
  + BJT internal resistance: $$r_{e}=\frac{V_{T}}{I_{E}} \approx 5\Omega$$
  + Device $$\beta$$ @ $$I_{C}=5.0mA \rightarrow \beta = 150$$
  + Inverse output admittance @ $$ I_{C}=5mA \rightarrow r_{o} = 42k\Omega$$
  + Input Impedance: $$Z_{in2} = R_{21} \parallel R_{22} \parallel (\beta + 1)r_{e} = 680\Omega$$
  + Voltage Gain: $$A_{v}=-\frac{R_{c2}}{r_{e}} = -230$$
  + Output Impedance: $$Z_{out2} = r_{o} \parallel R_{c2} \approx 1k\Omega$$

Given these properties of each stage, we can build a representative circuit of voltage dependent voltage sources (voltage gain of each stage) to compute the effects of the input voltage dividers and output load on the effective system gain:
<center><img src="Cascade_Vdiv.png"></center>
\$\$ v_{in1}=v_{i}\frac{2.7k\Omega}{50\Omega + 2.7k\Omega} = 0.98v_{i} \$\$

\$\$ v_{in2}=-230*v_{in1}\frac{680\Omega}{680\Omega + 6k\Omega} = -23v_{i} \$\$

\$\$ v_{out}=-230*v_{in2}\frac{1k\Omega}{1k\Omega + 1k\Omega} = 2645v_{i} \$\$

\$\$ \boxed{ A_{v_{total}} = 2645 (68.4dB)} \$\$

## Designing Circuits

### Reference Designs

* [Arrow](https://www.arrow.com/en/reference-designs)
* [Texas Instruments](http://www.ti.com/guidedsupport/docs/categoryhome.tsp?categoryId=515)
* [Maxim Integrated](https://www.maximintegrated.com/en/design/overview.html)

### Modeling & SPICE

SPICE is an acronym for Simulation Program with Integrated Circuit Emphasis which was originally made to model ICs and their behaviors. A popular tool is [LTSpice](https://www.analog.com/en/design-center/design-tools-and-calculators/ltspice-simulator.html) (developed by Linear Tech which is now owned by Analog Devices) which has a simple interface and lots of capabilities such as [Monte Carlo analysis](https://en.wikipedia.org/wiki/Monte_Carlo_method) (useful for modeling impact of component tolerances), parametric analysis and noise analysis. Note the Windows version is the most full featured so if installing on MacOS or Linux use [Wine](https://www.winehq.org/) Windows emulator. [Multisim](https://www.multisim.com/) is another tool from NI.

Some main analysis types that are commonly used are:
- **DC:** computes the DC operating point of a circuit given system conditions (e.g. input voltages and DC characteristics) and is required for other analysis types.
- **AC/Small Signal:** performs frequency sweeps across the circuit to do frequency domain analysis, however care should be taken since results are linearized about given DC operating point. Valid for small signal analysis.
- **Transient/Time Domain:** simulation done over a time period to see effects of given events, for example power supply transient response to load step. Valid for large signal analysis.
- **Noise Analysis:** simulation of system effect of various noise sources in schematic.
