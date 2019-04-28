function mustBeVector(x, label)
  %MUSTBEVECTOR Require that input is a vector
  %
  % x = mustBeVector(x, label)
  %
  % Raises an error if the input x is not a vector or empty, as determined by 
  % isvector(x) || isequal(size(x), [0 0]).
  %
  % label is an optional input that determines how the input will be described
  % in error messages. If not supplied, `inputname(1)` is used, and if that is
  % empty, it falls back to 'input'.  if nargin < 2; label = []; endif
  if ~(isvector(x) || isequal(size(x), [0 0]))
    if isempty(label)
      label = inputname(1);
    end
    if isempty(label)
      label = 'input';
    end
    error('%s must be a vector; got a %s', ...
      label, size2str(size(x)));
  end
end
