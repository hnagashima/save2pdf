# save2pdf
save2pdf saves MATLAB Figure as a pdf, as same as shown in the Window.

save2pdf deletes background color from the figure.
save2pdf_transparent deletes the background color in the axes.
save2pdf_menu generates a menu in the figure menu bar.

## Requirements: 
This function Requires [export_fig](https://jp.mathworks.com/matlabcentral/fileexchange/23629-export_fig).


## Syntax
```matlab
save2pdf;
save2pdf(figure_handle);
save2pdf(___,filename);
save2pdf_transparent(___);
set(0, 'defaultFigureCreateFcn',@save2pdf_menu);
```
## Example: 

save current Figure as shown in the display.
```matlab
save2pdf;
```
save Figure1 as 'Fig1.pdf'
```matlab
f = figure(1);
save2pdf(f, 'fig1.pdf');
```



## setup UI

Following function adds UI menu in the default figure. Add following script to the startup.m .

```Matlab
set(0, 'defaultFigureCreateFcn', @save2pdf_menu);
```

If you have another UI menu function, you can add save2pdf menus as submenues of the present menu.
```Matlab
mh = uimenu(gcf, 'Text', 'Custom'); % Create UI menu and obtain a menu handle.
save2pdf_menu(gcf, [] mh); % Add save2pdf to the mh.

```



----------

# See also

[export_fig - Matlab central](https://jp.mathworks.com/matlabcentral/fileexchange/23629-export_fig)

