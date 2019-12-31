function x = mustBeMember(x, valid, label)
%MUSTBEMEMBER Require that input is a member of specified valid values
%
% x = mustBeMember (x, valid, label)
%
% Raises an error if the input x is not a member of valid, as determined
% by ismember(x, valid).
%
% label is an optional input that determines how the input will be described
% in error messages. If not supplied, `inputname(1)` is used, and if that is
% empty, it falls back to 'input'. 

if nargin < 3; label = []; end

tf = ismember(x, valid);
if ~all(tf)
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  n_bad = numel(find(~tf));
  % TODO: Fancy inclusion of bad & valid values in the error message.
  % Probably need dispstrs() for that.
  error ('MATLAB:validators:mustBeMember', ...
    '%s must be one of the specified valid values; got %d elements that weren''t', ...
    label, n_bad);
end
end
