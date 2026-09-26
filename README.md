# Battery Estimation Lab

A reusable MATLAB framework for battery state-estimation experiments, benchmarking, drive-cycle analysis, and interactive workflows.

## Project direction

- Reproducible battery-estimation experiments
- Research-reference HDCQKF implementation kept separate from public interfaces
- Multi-drive-cycle experiments
- 1C / 2C / 3C / 4C discharge-rate scaling
- Apples-to-apples estimator comparison
- Automated RMSE / MAE / MaxAE / runtime metrics
- Publication-quality plots and reports
- Plug-and-play interactive dashboard

## Interactive dashboard

The dashboard is planned as a user-facing layer on top of the MATLAB experiment engine. The intended workflow is:

**Load data → choose estimator/cycle/rate → Run → inspect plots and metrics → export results**

The dashboard will initially target a local MATLAB workflow so users can run the computationally intensive estimators without moving research data to a server.

## Research reference

The supplied HDCQKF reference case uses the US06 dataset with 1-second interpolation, a 15-state HDCQKF at radial order 2, and 900 points, with the original benchmark settings retained.

## Status

Early development. The first milestone is establishing the validated US06 HDCQKF reference case and a stable experiment API before adding the multi-cycle dashboard workflow.

## License

See `LICENSE`.
