function x = mustBeInteger(x, label)
%MUSTBEINTEGER Require that input is integer-valued
%
% x = mustBeInteger(x, label)
%
% Raises an error if the input x is not integer-valued. "Integer-valued"
% means, real, finite, and with no fractional value part. Integer types
% automatically qualify; floating-points have each value checked.
%
% label is an optional input that determines how the input will be described
% in error messages. If not supplied, `inputname(1)` is used, and if that is
% empty, it falls back to 'input'.

if nargin < 2; label = []; end

if isinteger (x) || islogical (x)
  return
end
but = [];
if ~isnumeric(x)
  but = sprintf ('it was non-numeric (got a %s)', class (x));
elseif any (~isfinite(x))
  but = 'there were Inf values';
elseif ~isreal(x)
  but = 'it was complex';
elseif ~all(floor(x) == x)
  but = 'it had fractional values in some elements';
end
if ~isempty(but)
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('validoozy:validators:mustBeInteger', ...
    '%s must be integer-valued; but %s', ...
    label, but);
end
end
