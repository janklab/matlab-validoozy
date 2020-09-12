function out = isstringy(x)
% True if input is a string-like value

out = iscellstr(x) || ischar(x) || isstring(x);

end