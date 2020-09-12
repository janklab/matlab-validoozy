function mustBeScalarNumeric(x, label)
%MUSTBESCALARNUMERIC Require that input is a scalar numeric

if nargin < 2; label = []; end

if ~(isscalar(x) && isnumeric(x))
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('validoozy:validators:TypeError', ...
    '%s must be a scalar numeric; got a %s %s', ...
    label, size2str(size(x)), class(x));
end
end