function x = makeItBeA(x, type)
%MAKEITBEA Convert input to given type
%
% x = makeItBeA(x, type)
%
% Converts input to given type if it is not one already.
%
% Ensures that the input x is of the given type type. If it is
% not already that type (as indicated by `isa (x, type)`), it is converted
% by calling the one-argument constructor or conversion function for type.
% (The conversion function is assumed to be the global function with that
% exact name. Callers are responsible for making good choices with type
% here.)

if ~isa(x, type)
  x = feval (type, x);
end
end