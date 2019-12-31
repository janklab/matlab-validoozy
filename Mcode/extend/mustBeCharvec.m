function mustBeCharvec (x, label)
  %MUSTBECHARVEC Require that input is a char row vector
  %
  % Raises an error if the input x is not a row vector of chars.
  % char row vectors are Octave's normal representation of single strings.
  % (They are what are produced by '...' string literals.) As a special
  % case, 0-by-0 empty chars (what is produced by the string literal '')
  % are also considered charvecs.
  %
  % label is an optional input that determines how the input will be described in
  % error messages. If not supplied, inputname (1) is used, and if that is
  % empty, it falls back to 'input'.
  if ~(ischar(x) && (isrow(x) || isequal(size(x), [0 0])))
    if isempty(label)
      label = inputname(1);
    end
    if isempty(label)
      label = 'input';
    end
    error('validoozy:validators:mustBeCharvec', ...
      '%s must be a char row vector; got a %s %s', ...
      label, size2str(size(x)), class(x));
  end
end
