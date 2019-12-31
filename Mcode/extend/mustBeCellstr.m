function mustBeCellstr(x, label)
%MUSTBECELLSTR Require that input is a cellstr
%
% x = mustBeCellstr(x, label)
%
% Raises an error if the input x is not a cellstr, as determined by iscellstr(x).
%
% TODO: Decide whether to require the contained char arrays be rowvec/empty.
%
% label is an optional input that determines how the input will be described
% in error messages. If not supplied, `inputname(1)` is used, and if that is
% empty, it falls back to 'input'. 

if nargin < 2; label = []; end

if ~iscellstr(x) %#ok<ISCLSTR>
  if isempty(label)
    label = inputname(1);
  end
  if isempty(label)
    label = 'input';
  end
  if iscell(x)
    el_classes = cellfun(@(e) {class(e)}, x);
    type_descr = sprintf('cell array containing %s', strjoin(el_classes, ', '));
  else
    type_descr = class(x);
  end
  error('validoozy:validators:mustBeCellstr', ...
    '%s must be a cellstr; got a %s', ...
    label, type_descr);
end
end
