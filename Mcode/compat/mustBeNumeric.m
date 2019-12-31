function x = mustBeNumeric(x, label)
%MUSTBENUMERIC Require that input is numeric
%
% x = mustBeNumeric(x, label)
%
% Raises an error if the input x is not numeric, as determined by isnumeric(x).
%
% label is an optional input that determines how the input will be described
% in error messages. If not supplied, `inputname(1)` is used, and if that is
% empty, it falls back to 'input'. 

if nargin < 2; label = []; end

if ~isnumeric(x)
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('MATLAB:validators:mustBeNumeric', ...
    '%s must be numeric; got a %s', ...
    label, class (x));
end
end
