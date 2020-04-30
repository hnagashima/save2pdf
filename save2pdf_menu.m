function save2pdf_menu(src,event,menuhandle)
% Add save2pdf menu to figure menubar.
%
% save2pdf_menu(src, event,menuhandle)
% - src :
% - event :
% - menuhandle : parent handle. obtained by ( = uimenu(figure_handle)).
%
% menuhandle specifies parent uimenu handle.
% If menuhandle is not given, parent uimenu is 'exportPDF'.
%
% This function should be called when figure is created.
% Run following script at first.
% set(0, 'DefaultFigureCreateFcn',@save2pdf_menu);
%


narginchk(1,3);
f = src;
% Check if figure is numberless ( = appdesigner or some GUI apps)
if isempty(f.Number)
    return;
end
if strcmp(f.MenuBar,'figure') == 0
    return;
end


%% add menu
if nargin < 3
    mh = uimenu(f,'Text' ,'exportPDF');
    mh.HandleVisibility = 'off'; % undeletable object.
else
    mh = menuhandle;
end

% —á
% eh0 = uimenu(mh,'text','test');
% fun0 = @(src,event,varargin) disp('test');
% eh0.MenuSelectedFcn = fun0;

% src event is reserved inputs.
% You need to specify as a 1st and 2nd inputs,
% even though you don't need src and event.

eh1 = uimenu(mh,'text','Export to PDF');
eh1.MenuSelectedFcn = @(src,event,varargin) save2pdf(mh.Parent);

eh2 = uimenu(mh, 'text', 'Export to transparent PDF');
eh2.MenuSelectedFcn = @(src,event, varargin) save2pdf_transparent(mh.Parent);

eh3 = uimenu(mh, 'text', 'Save Figure');
eh3.MenuSelectedFcn = @(src, event, varargin) saveAsFig(mh.Parent);
eh3.Accelerator = 'T';

    function saveAsFig(fig,~)
        
        % save dialog
        if isempty(fig.FileName) == 0
            initialTitle = fig.FileName;
        else
            initialTitle = 'untitled.fig';
        end
        [fname, path] = uiputfile( initialTitle, 'save figure as .fig');
        if fname ~= 0
            % remove original UI menu from saved fig file.
            delete(mh);
            
            % save file
            savefig(fig, fullfile(path,fname));
            
            % Restore original menu
            createFcn = get(0,'defaultFigureCreateFcn');
            createFcn(fig);
        end
        
        
    end

f.CreateFcn = [];% reset default figure function.

end