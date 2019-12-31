function x = mustBeNonempty(x, label)
%MUSTBENONEMPTY Require that input is not empty
%
% x = mustBeNonempty(x, label)
%
% Raises an error if the input x is empty, as determined by isempty(x).
%
% label is an optional input that determines how the input will be described
% in error messages. If not supplied, `inputname(1)` is used, and if that is
% empty, it falls back to 'input'. 

if nargin < 2; label = []; end

if isempty(x)
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('MATLAB:validators:mustBeNonempty', ...
    '%s must be nonempty; got a %s empty', ...
    label, size2str (size (x)));
end
end
