function mustBeCongruentSizes(varargin)
% Requires that inputs all be the same size, or broadcast-compatible sizes
%
% mustBeCongruentSizes(x1, x2)
% mustBeCongruentSizes(x1, x2, x3, ...)
% mustBeCongruentSizes(..., labels)
%
% Requires that all its inputs are of broadcast-compatible sizes. This
% means that for each dimension, all arrays must be of either the same
% size, or scalar along that dimension.
%
% Raises an error if this requirement is not met.
%
% You can pass as many inputs as you want, and they are all compared to
% each other. You may also pass a validoozy.Label object as the final
% input; it is used to indicate what labels to use for the other inputs in
% the diagnostic message. (The validoozy.Label object is not itself
% validated for size against the other inputs; it is treated specially
% based on its type.)
%
% Examples:
%
% % This passes
% mustBeCongruentSizes(42, 3)
% % So does this
% mustBeCongruentSizes(1, 2, magic(3))
% % But this errors
% mustBeCongruentSizes(1, 2:5, magic(3))
% % And if you want to use labels:
% mustBeCongruentSizes(1, 2:5, magic(3), validoozy.Label({'foo', 'bar', 'baz'}))

if nargin == 0
  return
end
args = varargin;
if isa(args{end}, 'validoozy.Label')
  labelObj = args{end};
  args(end) = [];
  labels = labelObj.labels;
else
  labels = repmat({''}, size(args));
end

szesIn = cellfun(@(x) {size(x)}, args);
szes = padSizes(szesIn);
nDims = numel(szes{1});

for iDim = 1:nDims
  szForDim = cellfun(@(x) x(iDim), szes);
  needSz = szForDim(1);
  szFromArgNum = 1;
  for iArg = 2:numel(args)
    if szForDim(iArg) == 1
      continue
    end
    if needSz == 1
      needSz = szForDim(iArg);
      szFromArgNum = iArg;
    elseif needSz == szForDim(iArg)
      % It's okay
    else
      % Congruency violation!
      for iArg2 = 1:numel(args)
        if isempty(labels{iArg2})
          labels{iArg2} = inputname(iArg2);
        end
        if isempty(labels{iArg2})
          labels{iArg2} = sprintf('input %d', iArg2);
        end
      end
      error('validoozy:validators:mustBeCongruentSizes', ...
        ['Inputs must be congruent sizes, but %s is %s and %s is %s ' ...
        '(mismatch along dimension %d)'], ...
        labels{szFromArgNum}, size2str(szesIn{szFromArgNum}), ...
        labels{iArg}, size2str(szesIn{iArg}), ...
        iDim);
    end
  end
end
end

function out = padSizes(szes)
out = szes;
dimses = cellfun(@numel, szes);
maxdims = max(dimses);
for i = 1:numel(out)
  if numel(out{i}) < maxdims
    out{i}(end+1:maxdims) = 1;
  end
end
end