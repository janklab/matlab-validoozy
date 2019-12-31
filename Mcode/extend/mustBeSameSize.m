function [a, b] = mustBeSameSize(a, b, labelA, labelB)
%MUSTBESAMESIZE Require that the inputs are the same size.
%
% Raises an error if the inputs a and b are not the same size,
% as determined by isequal(size(a), size(b)).
%
% labelA and labelB are optional inputs that determine how
% the input will be described in error messages. If not supplied,
% inputname (...) is used, and if that is empty, it falls back to
% 'input 1' and 'input 2'.
%
% See also:
% mustBeCongruentSizes

if nargin < 3; labelA = []; end
if nargin < 4; labelB = []; end

if ~isequal(size(a), size(b))
  if isempty(labelA)
    labelA = inputname(1);
  end
  if isempty(labelA)
    labelA = 'input 1';
  end
  if isempty(labelB)
    labelB = inputname(2);
  end
  if isempty(labelB)
    labelB = 'input 2';
  end
  error('validoozy:validators:mustBeSameSize', ...
    '%s and %s must be the same size; got %s and %s', ...
    labelA, labelB, size2str(size(a)), size2str(size(b)));
end
end
