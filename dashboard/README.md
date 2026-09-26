# Interactive Dashboard

The dashboard is part of the project architecture from the beginning rather than an afterthought.

## Target UX

A user should be able to:

1. Load a supported battery/drive-cycle dataset.
2. See validation status and detected signals.
3. Select a drive cycle.
4. Select discharge scaling (1C, 2C, 3C, 4C).
5. Select an estimator.
6. Run the experiment.
7. View current, terminal voltage, estimated voltage, SoC and error plots.
8. View RMSE, MAE, MaxAE and runtime.
9. Export figures and machine-readable results.

## Implementation approach

The dashboard should remain thin. MATLAB functions perform the scientific computation; the dashboard manages configuration, progress, visualization and export.

The initial implementation should be local-first so large/research datasets and computationally expensive HDCQKF runs stay on the user's machine.

Planned entry point:

`dashboard/BatteryEstimationDashboard.mlapp`

A stable programmatic API should be developed first so the dashboard has a dependable backend.
