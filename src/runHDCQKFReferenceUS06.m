function result = runHDCQKFReferenceUS06(dataFile, hdcqkfFile)
% Standardized entry point around the supplied research HDCQKF implementation.
% The research mathematics is not rewritten here.
if nargin < 1 || isempty(dataFile), dataFile = 'US06Output_3CMax_P2D_25Deg.mat'; end
if nargin < 2 || isempty(hdcqkfFile), hdcqkfFile = 'HDCQKF.m'; end
assert(isfile(dataFile), 'Data file not found: %s', dataFile);
assert(isfile(hdcqkfFile), 'HDCQKF file not found: %s', hdcqkfFile);
hdcDir = fileparts(which(hdcqkfFile));
if isempty(hdcDir), hdcDir = fileparts(hdcqkfFile); end
if ~isempty(hdcDir), addpath(hdcDir); end
S = load(dataFile);
required = {'I_app','SOC','volt','t_steps'};
for k = 1:numel(required)
    assert(isfield(S, required{k}), 'Dataset is missing required variable "%s".', required{k});
end
I_app = S.I_app(:); SOC = S.SOC(:); volt = S.volt(:); t_steps = S.t_steps(:);
tm = t_steps(end); t = (0:1:tm).';
I = interp1(t_steps, I_app, t, 'linear');
V = interp1(t_steps, volt, t, 'linear');
SOC_ref = interp1(t_steps, SOC, t, 'linear');
if numel(t) >= 6
    I(1:5) = I(6); V(1:5) = V(6); SOC_ref(1:5) = SOC_ref(6);
end
[wc, chai] = HDCQKF(2, 15);
result = struct(); result.dataset = dataFile; result.t = t; result.I = I;
result.V_reference = V; result.SOC_reference = SOC_ref;
result.hdcqkf_weights = wc; result.hdcqkf_points = chai;
result.nStates = 15; result.nPoints = size(chai, 2);
result.interpolationTs_s = 1; result.weightSum = sum(wc);
end
