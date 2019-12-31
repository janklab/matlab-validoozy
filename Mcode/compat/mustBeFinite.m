function x = mustBeFinite(x, label)
%MUSTBEFINITE Require that input is finite
%
% x = mustBeFinite(x, label)
%
% Raises an error if the input x is not finite, as determined by isfinite(x).
%
% label is an optional input that determines how the input will be described
% in error messages. If not supplied, `inputname(1)` is used, and if that is
% empty, it falls back to 'input'.

if nargin < 2; label = []; end

tf = isfinite(x);
if ~all(tf)
  if isempty(label)
    label = inputname (1);
  end
  if isempty(label)
    label = 'input';
  end
  ix_bad = find(~tf);
  error('MATLAB:validators:mustBeFinite', ...
    '%s must be finite; got Infs in %d elements: %s', ...
    label, numel (ix_bad), mat2str (ix_bad));
end
end
