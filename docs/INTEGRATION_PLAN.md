# Integration Plan

## Phase 1 — validated reference
1. Reproduce the supplied single-US06 HDCQKF benchmark.
2. Standardize result structures without changing the research mathematics.
3. Add automated metrics and plots.

## Phase 2 — experiment engine
1. Generalize drive-cycle selection.
2. Add 1C / 2C / 3C / 4C current scaling.
3. Standardize saved result naming and metadata.
4. Add repeatable experiment configuration.

## Phase 3 — estimator comparison
Add apples-to-apples adapters for EKF, UKF, CKF, HCKF and HDCQKF where the underlying implementations are available.

## Phase 4 — interactive dashboard
The first dashboard should be local and plug-and-play:

**Upload/select dataset → validate → choose cycle → choose rate → choose estimator → Run → live progress → plots → metrics → export**

The computational engine remains MATLAB. The dashboard should call a stable experiment API rather than duplicate estimator mathematics.

## Phase 5 — productization
Separate public examples/interfaces from research/private implementations and add documentation, tests, releases and benchmark artifacts.
