# STATGR5263
R code for statistical time series analysis for the class STATGR5263 at Columbia University in Fall 21. Will reuse in future.

# Overview

### homework2.R
Mostly about transforming time series data to be (weakly) stationary (time invariant first and second central moments).
Data is made stationary through 
  - Non-parametric smoothing:
      - Kernel smoothing
      - Moving Average smoothing
  - Parametric smoothing:
      - 2x Fitting a map to the model the mean through OLS and subtracting it from the data to handle the residuals like a weakly stationary time series.
