function x = mustBeScalarLogical(x, label)
%MUSTBESCALARLOGICAL Require that input is scalar logical
%
% x = mustBeScalarLogical(x, label)
%
% Raises an error if the input x is not a scalar logical, as determined by
% isscalar (x) && islogical (x).
%
% label is an optional input that determines how the input will be described
% in error messages. If not supplied, `inputname(1)` is used, and if that is
% empty, it falls back to 'input'.

if nargin < 2; label = []; end

if ~(isscalar(x) && islogical(x))
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('validoozy:validators:mustBeScalarLogical', ...
    '%s must be a scalar logical; got a %s %s', ...
    label, size2str(size(x), class(x)));
end
end
