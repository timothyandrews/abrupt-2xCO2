# abrupt-2xCO2

This repository calculates the F2x, lambda and EffCS from the HadGEM3-GC3.1-LL abrupt-2xCO2 simulation, which will be part of our submission to CFMIP3/CMIP6.

**Note: These are not our official CMIP6 numbers since the simulation has not yet gone through internal scientific review. Do not use without informing me.**

Tim Andrews

Met Office Hadley Centre.

December 2019.

## Data description

The abrupt-2xCO2 simulation runs from Jan 1850 through to Dec 1999, i.e. 150 years, following CFMIP protocols (Webb et al., 2016; GMD).  It runs parallel to the piControl, i.e. branched from 1st Jan 1850.

Included in the data files are global-annual-mean timeseries tas and radiative flux data from the piControl and abrupt-2xCO2 simulation.  The code used to create them converts standard CMIP6 type diagnostics into TOA radiative fluxes: Net, LW clear-sky, LW CRE, SW clear-sky and SW CRE.  CRE (cloud radiative effect), is the difference between all-sky and clear-sky.  All fluxes are positive downwards.  Mappings from standard CMIP6 diagnostic names are as follows:

| name | Mapping Routine |
| ---- | --------------- |
| NET  | PP_FF('a-b-c',rsdt,rlut,rsut) |
| LWcs | PP_FF('a*b',-1.0,rlutcs) |
| LWcre| PP_FF('a*(b-c)',-1.0,rlut,rlutcs) |
| SWcs | PP_FF('a-b',rsdt,rsutcs) |
| SWcre| PP_FF('(a-b)-(c-d)',rsdt,rsut,rsdt,rsutcs) |
  
To ensure consistency between processing, please use the piControl data given here alongside the abrupt-2xCO2 simulation, rather than the piControl on the ESGF.  They ought to be almost identical, except perhaps for LW fluxes since our ESGF submission includes a small adjustment to account for the boundary layer timestep.  This should not impact differences, i.e. abrupt-2xCO2 minus piControl.


## Data files

The data files have been produced using `idl_create_data.pro`.

| Filename | Description |
| -------- | ----------- |
| `HadGEM3-GC31-LL_abrupt-2xCO2_r1i1p1f3_gn_1850-1999_GlobalAnnualMean.csv` | Global-annual-mean tas and radiative flux timeseries from abrupt-2xCO2 |
| `HadGEM3-GC31-LL_piControl_r1i1p1f1_gn_1850-1999_GlobalAnnualMean.csv` | Global-annual-mean tas and radiative flux timeseries from piControl |


## Effective Climate Sensitivity

Gregory plot: See `Figure_GregoryPlot.pdf`.  Created with `idl_gregoryplot.pro`.

The F2x, lambda and EffCS (gregory plot on 150yrs) in comparison to abrupt-4xCO2 are:

| Simulation | F2x (Wm-2) | Lambda (Wm-2 K-1) | EffCS (K) |
| ---------- | ---------- | ----------------- | --------- |
| abrupt-2xCO2 | 3.43 | -0.70 | 4.9 |
| abrupt-4xCO2 | 3.49 | -0.63 | 5.5 |

The abrupt-4xCO2 values are documented in: Andrews, T., Andrews, M. B., Bodas‐Salcedo, A., Jones, G. S., Kulhbrodt, T., Manners, J., et al (2019). Forcings, feedbacks and climate sensitivity in HadGEM3‐GC3.1 and UKESM1. Journal of Advances in Modeling Earth Systems, 11. https://doi.org/10.1029/2019MS001866.


