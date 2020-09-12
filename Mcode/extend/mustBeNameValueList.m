function x = mustBeNameValueList(x, label)
%MUSTBENAMEVALUELIST Require input to be a name/value cell vector list
%
% x = mustBeNameValueList(x, label)
%
% Requires that the input is a 2-N long cell vector containing name/value
% pairs. The "name" elements must be chars.

if nargin < 2; label = []; end

isNameValList = iscell(x) && (isvector(x) || isempty(x)) && (rem(numel(x), 2) == 0) ...
  && iscellstr(x(1:2:end));
if ~isNameValList
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  error('validoozy:validators:TypeError', ...
    '%s must be a name/value cell vector; got a %s %s', ...
    label, size2str(size(x)), class(x));
end

end