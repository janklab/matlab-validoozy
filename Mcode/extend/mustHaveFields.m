function mustHaveFields(x, requiredFieldNames, label)
%MUSTHAVEFIELDS Require that input has given fields
%
% mustHaveFields(x, requiredFieldNames, label)
%
% Requires that input x has at least the fields named in requiredFieldNames, as
% determined by fieldnames(x). Extra fields are not an error, and are silently
% ignored.

fields = fieldnames(x);
tf = ismember(requiredFieldNames, fields);
if ~all(tf)
    if nargin < 3 || isempty(label)
        label = inputname(1);
    end
    if isempty(label)
        valueLabel = 'Input';
    else
        valueLabel = sprintf('Input ''%s''', label);
    end
    missingFields = requiredFieldNames(~tf);
    error('validoozy:InvalidInput', '%s is missing required fields: %s', ...
        valueLabel, strjoin(missingFields));
end

end

