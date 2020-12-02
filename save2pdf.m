% save2pdf saves a figure as a pdf file, as same as shown on screen.
% annoying background will be transparented
%
% Usage:
% save2pdf; 
% save2pdf(figure_handle);
% save2pdf(figure_handle, filename)
% 
% Input:
% figure_handle : default is current figure.
% filename : name of pdf file. If filename is not specified, GUI will be shown.
% 
% #Dependency
% This function depends on the export_fig in file exchange at MATLAB
% central.



function save2pdf(f,fileName,varargin)
narginchk(0,2);
if nargin < 1
    f = gcf;
end
if nargin < 2
    if isempty(f.Name)
        defaultname = 'untitled.pdf';
    else
        defaultname = f.Name;
    end
    
    % avoid MATLAB crash
    if strcmp(defaultname(end-3:end),'.pdf') == 0
        defaultname = [defaultname, '.pdf'];
    end
    
    [fileName,pathName] = uiputfile('*.pdf',...
        'Save to PDF file:',...
        [getuserdir, '/Desktop/', defaultname]);
    if fileName == 0
        return;
    end
    pdfFileName = [pathName,fileName];
else
    pdfFileName = fileName;
end

%{
switch numel(varargin)
    case 1
        f = varargin{1};
    case 0
        f = gcf;
end
%}
fn = {'PaperPositionMode';'PaperUnits';'PaperPosition';'PaperSize';'Color'};
for k = 1:numel(fn)
    fn{k,2} = f.(fn{k});
end


f.PaperPositionMode = 'auto';
f.PaperUnits = 'inches';
f.PaperPosition = [0 0 f.Position(3:4)/72];
f.PaperSize = f.PaperPosition(3:4);
%print(pdfFileName,'-dpdf','-r300');
f.Color = 'none';
export_fig(pdfFileName,'-pdf','-nocrop','-transparent','-painters',f);

for k = 1:size(fn,1)
    if isequal(fn{k,2}, f.(fn{k,1})) ~= 1
        f.(fn{k}) = fn{k,2};
    end
end


end

function userDir = getuserdir
%GETUSERDIR   return the user home directory.
%   USERDIR = GETUSERDIR returns the user home directory using the registry
%   on windows systems and using Java on non windows systems as a string
%
%   Example:
%      getuserdir() returns on windows
%           C:\Documents and Settings\MyName\Eigene Dateien
if ispc
    userDir = winqueryreg('HKEY_CURRENT_USER',...
        ['Software\Microsoft\Windows\CurrentVersion\' ...
         'Explorer\Shell Folders'],'Personal');
else
    userDir = char(java.lang.System.getProperty('user.home'));
end
end