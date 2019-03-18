clc;
clear all;
close all;
hold on;

axis([0 600 -200 180])
axis off
%% SOUND
[y fs] = audioread('level.wav');

handel = audioplayer(y,fs);

sound(y,fs)
%% IMAGE
im=imread('second.jpg');

im2=image(im, 'xdata', [0 600], 'ydata', [-200 180]);
%% BUTTONS
ls=uicontrol('style','pushbutton','FontAngle','normal','FontSize',30,'FontWeight','bold','ForegroundColor',[1 1 1],'String','Easy','Position',[200,300,200,60], 'Callback', 'practiseeven2;');
ls1=uicontrol('style','pushbutton','FontAngle','normal','FontSize',30,'FontWeight','bold','ForegroundColor',[0.9 0.75 0.17],'String','Medium','Position',[200,200,200,60], 'Callback', 'practiseeven1;');
lt2=uicontrol('style','pushbutton','FontAngle','normal','FontSize',30,'FontWeight','bold','String','Hard','Position',[200,100,200,60], 'Callback', 'practiseeven;');

lx=uicontrol('style','pushbutton','FontAngle','normal','FontSize',14,'FontWeight','bold','BackgroundColor',[0 0 0],'ForegroundColor',[1 1 1],'String','Back','Position',[80,53,60,30],'Callback','GAME;');
