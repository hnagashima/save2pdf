clf;

f = figure(1);
subplot(1,2,1);
x = -2*pi:.01: 2*pi;
y1 = sin(x);
y2 = sin(x) .* exp(-x/pi);
plot(x,y1);
subplot(1,2,2);
plot(x,y2);
% save2pdf_transparent(gcf,'untitled2.pdf');
save2svg_transparent(gcf, '~/Desktop/untitled3.svg');