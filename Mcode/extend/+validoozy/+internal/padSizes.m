function out = padSizes(szes)
% padSizes pad size vectors by filling missing trailing dims with ones
%
% out = padSizes(szes)
%
% szes is a cell array of size vectors.

out = szes;
dimses = cellfun(@numel, szes);
maxdims = max(dimses);
for i = 1:numel(out)
  if numel(out{i}) < maxdims
    out{i}(end+1:maxdims) = 1;
  end
end
end