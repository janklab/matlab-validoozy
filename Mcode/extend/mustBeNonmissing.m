function mustBeNonmissing(x, label)
% Require input to be all non-missing

if nargin < 2; label = []; end

if any(ismissing(x))
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('validoozy:validators:ValueError', ...
    '%s must be non-missing', ...
    label);
end

end