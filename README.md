# save2pdf
save2pdf saves MATLAB Figure as a pdf, as same as shown in the Window.
Background color is deleted.
save2pdf_transparent deletes the background in the axes.

## Requirements: 
This function Requires [export_fig](https://jp.mathworks.com/matlabcentral/fileexchange/23629-export_fig).

## Example: 

save current Figure as shown in the display.
```matlab
save2pdf;
```
save Figure1 as 'Fig1.pdf'
```
f = figure(1);
save2pdf(f, 'fig1.pdf');
```





## Special Example: SettingUI

```Matlab
function UIaddFunction(varargin)
  mh = uimenu(figure_handle,'Text' ,'MyFun');
  eh1 = uimenu(mh,'text','Export to PDF');
  fun = @(src,event,varargin) save2pdf(mh.Parent);
  eh1.MenuSelectedFcn = fun;
end
```

This script adds "MyFun" in the FIGURE UI menu, then adds save2pdf command. 
You can add above menu on the default Figure function by following script
```Matlab
set(0, defaultFigureCreatedFcn, UIaddFunction);
```



----------

# See also

[export_fig - Matlab central](https://jp.mathworks.com/matlabcentral/fileexchange/23629-export_fig)

