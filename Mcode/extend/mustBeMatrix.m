function x = mustBeMatrix(x, label)
%MUSTBEMATRIX Require that input is 2-dimensional
%
% mustBeMatrix(x, label)
%
% Requires that input x has exactly 2 dimensions, as determined by ismatrix(x).

if nargin < 2; label = []; end

if ~ismatrix(x)
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('validoozy:validators:SizeError', ...
    '%s must be a matrix; got a %d-D array (%s)', label, ...
    numel(size(x)), size2str(size(x)));
end

end