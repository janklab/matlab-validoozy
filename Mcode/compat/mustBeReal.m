function x = mustBeReal(x, label)
%MUSTBEREAL Require that input is real
%
% x = mustBeReal(x, label)
%
% Raises an error if the input x is not real, as determined by isreal(x).
%
% label is an optional input that determines how the input will be described
% in error messages. If not supplied, `inputname(1)` is used, and if that is
% empty, it falls back to 'input'. 

if nargin < 2; label = []; end

if ~isreal(x)
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('validoozy:validators:mustBeReal', ...
    '%s must be real; got a complex value', ...
    label);
end
end
