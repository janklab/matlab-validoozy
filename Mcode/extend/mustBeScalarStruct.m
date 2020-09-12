function x = mustBeScalarStruct(x, label)
if nargin < 2; label = []; end

if ~(isscalar(x) && isstruct(x))
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('validoozy:validators:TypeError', ...
    '%s must be a scalar struct; got a %s %s', ...
    label, size2str(size(x)), class(x));
end

end