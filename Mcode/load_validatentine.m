function load_validatentine(varargin)
%LOAD_VALIDATENTINE Load the Validatentine library
%
% load_validatentine
% load_validatentine -override
%
% This loads the Validatentine library and makes it ready for use.
%
% When you run this function, the appropriate paths from Validatene are added
% to your Matlab path.
%
% If the -override option is supplied, then the "compat" functions are added
% to your path, even if you're running Matlab R2017a or newer. This lets you
% use the "label" extension on Matlab-defined validator functions. Note that
% this is experimental and may break stuff.

do_override = ismember({'-override'}, varargin);

mcode_dir = fileparts(mfilename('fullpath'));
addpath(fullfile(mcode_dir, 'extend'));
if verLessThan('matlab', '9.2') || do_override % R2017a
  addpath(fullfile(mcode_dir, 'compat'));
end

end