function out = size2str (sz)
  %SIZE2STR Format an array size for display.
  %
  % out = size2str (sz)
  %
  % Formats an array size as a human-readable string suitable for display.
  %
  % sz is an array of dimension sizes, in the format returned by size().
  %
  % Returns a char row vector.
  strs = cell(size(sz));
  for i = 1:numel(sz)
    strs{i} = sprintf('%d', sz(i));
  end
  out = strjoin (strs, '-by-');
end
