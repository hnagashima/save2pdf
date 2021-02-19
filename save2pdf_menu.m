function save2pdf_menu(src,event,menuhandle)
% Add save2pdf menu to figure menubar.
%
% save2pdf_menu(src, event,menuhandle)
% - src : object (target figure handle which is saved by this menu)
% - event : (not used.)
% - menuhandle : parent menu handle. obtained by ( = uimenu(figure_handle)).
%
% menuhandle specifies parent uimenu handle.
% If menuhandle is not given, parent uimenu is 'exportPDF'.
%
% This function can be called as a default.
% Run following script before figure creation.
% set(0, 'DefaultFigureCreateFcn',@save2pdf_menu);
%
% To add menu to existing figure:
% save2pdf_menu(figure_handle);
%
% To add menus in the present menu.
% mh = uimenu(gcf, 'Text', 'Custom'); % Create custom menu
% save2pdf_menu(gcf,[], mh); % Add sub menus of save2pdf to the menu, mh.
% 
% Save Figure without menu removes menu(mh) from figure to avoid errors
% when figure is shared with another computers. This menu function deletes
% menu data, and then run default FigureCreate function to restore menus
% and so on. If save2pdf is not set as default menu, save2pdf menu will
% be deleted parmanently.


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
    mh = uimenu(f,LabelName ,'exportPDF');
    mh.HandleVisibility = 'off'; % undeletable object.
else
    mh = menuhandle;
end

% —á
% eh0 = uimenu(mh,LabelName,'test');
% fun0 = @(src,event,varargin) disp('test');
% eh0.MenuSelectedFcn = fun0;

% src event is reserved inputs.
% You need to specify as a 1st and 2nd inputs,
% even though you don't need src and event.

eh1 = uimenu(mh,LabelName,'Export as PDF');
eh1.Callback = @(src,event,varargin) save2pdf(mh.Parent);

eh2 = uimenu(mh, LabelName, 'Export as transparent PDF');
eh2.Callback = @(src,event, varargin) save2pdf_transparent(mh.Parent);

eh3 = uimenu(mh, LabelName, 'Save Figure without menu');
eh3.Callback = @(src, event, varargin) saveAsFig(mh.Parent);
% eh3.Accelerator = 'T';  % Shortcut key

eh4 = uimenu(mh, LabelName, 'Export as SVG');
eh4.Callback = @(src, event, varargin) save2svg(mh.Parent);
% eh4.Accelerator = 'T';

eh4 = uimenu(mh, LabelName, 'Export as transparent SVG');
eh4.Callback = @(src, event, varargin) save2svg_transparent(mh.Parent);
% eh4.Accelerator = 'T';

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
            createFcn(fig,[]);
        end
        
        
    end

f.CreateFcn = [];% reset default figure function.

end

function pname = LabelName
% Return 'text' or 'label' depending on MATLAB version
V = version('-release');
if str2double(V(1:4)) < 2018        
    pname = 'label';
else
    pname = 'text';
end



end