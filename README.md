# save2pdf
save MATLAB Figure as a pdf, as same as shown in the Window.

## Requirements: 
This function Requires [export_fig](https://jp.mathworks.com/matlabcentral/fileexchange/23629-export_fig).

## Example: 

```matlab
save2pdf; % 現在のFigureをそのまま保存
save2pdf(figure(1), 'fig1.pdf'); % figure(1)をfig1.pdfとして保存
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
この関数をdefaultFigureCreatedFcnに追加することで、デフォルトのfigureにメニューを追加できます。



----------

# See also

[export_fig - Matlab central](https://jp.mathworks.com/matlabcentral/fileexchange/23629-export_fig)

