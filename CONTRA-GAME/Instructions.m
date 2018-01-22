clc;
clear all;
close all;
hold on;

axis([0 600 -200 180]);
axis off;

im1 = imread('Instructions.jpg');
im2 = imagesc(im1);
set(im2,'xdata',[0 600],'ydata',[-200 180]);

for G = 1:1
    pause(10)
    GAME
end