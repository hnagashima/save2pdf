function save2pdf_menu(src,event)
% Add save2pdf menu to figure menubar.
%
% This function is called when figure is created.
% Run following script at first.
% set(0, 'DefaultFigureCreateFcn',@save2pdf_menu);
% 

f = src;
% Check if figure is numberless ( = appdesigner or some GUI apps)
if isempty(f.Number)
    return;
end
if strcmp(f.MenuBar,'figure') == 0
    return;
end


%% add menu

mh = uimenu(f,'Text' ,'exportPDF');
mh.HandleVisibility = 'off'; % undeletable object.

% —á
% eh0 = uimenu(mh,'text','test');
% fun0 = @(src,event,varargin) disp('test');
% eh0.MenuSelectedFcn = fun0;

% src event is reserved inputs.
% You need to specify as a 1st and 2nd inputs, 
% even though you don't need src and event.

eh1 = uimenu(mh,'text','Export to PDF');
fun = @(src,event,varargin) save2pdf(mh.Parent);
eh1.MenuSelectedFcn = fun;

eh2 = uimenu(mh, 'text', 'Export to transparent PDF');
fun = @(src,event, varargin) save2pdf_transparent(mh.Parent);
eh2.MenuSelectedFcn = fun;
end