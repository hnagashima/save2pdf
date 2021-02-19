% save2svg saves a figure as a svg file, as same as shown on screen.
% annoying background will be transparented
%
% Usage:
% save2svg_transparent; 
% save2svg_transparent(figure_handle);
% save2svg_transparent(figure_handle, filename)
% 
% Input:
% figure_handle : default is current figure.
% filename : name of svg file. If filename is not specified, GUI will be shown.
% 
% #Dependency
% This function depends on the export_fig in file exchange at MATLAB
% central.
%
% See also save2svg



function save2svg_transparent(varargin)
narginchk(0,2);
if nargin < 1
    f = gcf;
else
    f = varargin{1};
end

% search all axes object in the target figure.
A = arrayfun(@(obj) isa(obj, 'matlab.graphics.axis.Axes'),f.Children);
axobj = f.Children(A);% axes object

% memory background color, and change to transparent.
savedColor = cell(1,numel(axobj));
for k = 1:numel(axobj)
    savedColor{k} = axobj(k).Color;
    axobj(k).Color = 'none';
end

% Run save2svg
save2svg(varargin{:});

% Restore to the original background color
for k = 1:numel(axobj)
   axobj(k).Color = savedColor{k}; 
end
end
