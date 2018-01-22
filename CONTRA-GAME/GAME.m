clc;
clear all;
close all;
hold on;

axis([0 600 -200 180])
axis off
%% SOUND
[y fs] = wavread('contra_title.wav');
handel = audioplayer(y,fs);
sound(y,fs)

%% IMAGE
im=imread('Screen.jpg');
im2=image(im, 'xdata', [0 600], 'ydata', [-200 180]);

%% BUTTONS
stu=uicontrol('style','pushbutton','FontAngle','normal','FontSize',30,'FontWeight','bold','BackgroundColor',[0.75 0.17 0.06],'ForegroundColor',[0.9 0.75 0.17],'String','Play','Position',[150,120,120,60], 'Callback', 'LEVELS;');
imn=uicontrol('style','pushbutton','FontAngle','normal','FontSize',12,'FontWeight','bold','BackgroundColor',[0 0 0],'ForegroundColor',[1 1 1],'String','Instructions','Position',[400,340,100,40],'Callback','Instructions;');
elx=uicontrol('style','pushbutton','FontAngle','normal','FontSize',14,'FontWeight','bold','BackgroundColor',[0 0 0],'ForegroundColor',[1 1 1],'String','Exit','Position',[80,53,60,30],'Callback','close all;');
