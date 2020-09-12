function mustBeNonNan(x, label)
%MUSTBENONNAN Require that input does not have any NaN values

if nargin < 2; label = []; end

tfNan = isnan(x(:));
if any(tfNan)
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  ixNan = find(tfNan);
  error('validoozy:validators:InvalidInput', ...
    '%s must be non-NaN; found a NaN in element %s', ...
    label, ixNan(1));
end
  
end