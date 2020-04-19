# save2pdf
save2pdf saves MATLAB Figure as a pdf, as same as shown in the Window.

Background color is deleted.
save2pdf_transparent deletes the background in the axes.

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



### setup UI

Following function adds UI menu in the default figure. Add following script to the startup.m .

```Matlab
set(0, defaultFigureCreatedFcn, @save2pdf_menu);
```



----------

# See also

[export_fig - Matlab central](https://jp.mathworks.com/matlabcentral/fileexchange/23629-export_fig)

