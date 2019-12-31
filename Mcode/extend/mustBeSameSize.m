function mustBeSameSize(varargin)
%MUSTBESAMESIZE Require that the inputs are the same size.
%
% mustBeSameSize(x1, x2)
% mustBeSameSize(x1, x2, x3)
% mustBeSameSize(..., labels)
%
% Raises an error if the inputs a and b are not the same size. If inputs do
% not have the same dimensions, missing dimenions are considered to be of
% length 1. (The absence of those dimensions is not itself considered an
% error if the other inputs are of length 1 along those dimensions.)
%
% You can pass as many inputs as you want, and they are all compared to
% each other. You may also pass a validoozy.Label object as the final
% input; it is used to indicate what labels to use for the other inputs in
% the diagnostic message. (The validoozy.Label object is not itself
% validated for size against the other inputs; it is treated specially
% based on its type.)
%
% See also:
% mustBeCongruentSizes

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
szes = validoozy.internal.padSizes(szesIn);

if ~isequal(szes{:})
  for iArg = 1:numel(args)
    if isempty(labels{iArg})
      labels{iArg} = inputname(iArg);
    end
    if isempty(labels{iArg})
      labels{iArg} = sprintf('input %d', iArg);
    end
  end
  badIx1 = 0;
  badIx2 = 0;
  for i = 1:numel(args)-1
    for j = i+1:numel(args)
      if ~isequal(szes{i}, szes{j})
        badIx1 = i;
        badIx2 = j;
        break;
      end
    end
    if badIx1 ~= 0
      break;
    end
  end
  error('validoozy:validators:mustBeSameSize', ...
    'Inputs must be the same size; but %s is %s and %s is %s', ...
    labels{badIx1}, size2str(szesIn{badIx1}), ...
    labels{badIx2}, size2str(szesIn{badIx2}));
end
end
