function x = mustBeMemberI(x, valid, label)
%MUSTBEMEMBERI Require input to be one of a list of valid values, case-insensitive
%
% x = mustBeMemberI(x, valid, label)
%
% Requires that all input elements are members of a given set of valid values,
% using case-insensitive comparison. Inputs must be string-y. ismember(lower(x),
% lower(valid)) is used to test membership.
%
% X is the input to check. It may be an array of multiple values.
%
% Valid is an array containing the valid values.
%
% If x is a char and valid is a cellstr, membership is tested stringwise. If x
% is a char and valid is a char, membership is tested characterwise. That means
% you probably want to always supply valid as a cellstr, not a charvec.

if nargin < 3; label = []; end
tf = ismember(lower(x), lower(valid));
if ~all(tf)
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  ix_bad = find(~tf);
  if numel(ix_bad) > 1
    term = 'values';
  else
    term = 'value';
  end
  x = cellstr(x);
  error('validoozy:validators:ValueError', ...
    'Invalid %s for %s: %s. Valid values are: %s (case-insensitive)', ...
    term, label, strjoin(x(ix_bad), ', '), strjoin(valid, ', '));
end
end
