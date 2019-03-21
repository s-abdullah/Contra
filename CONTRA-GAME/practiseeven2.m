%% Cleanup
clc
clear all
close all



%% Figure ans Axis
fig=figure;
set(fig, 'position', [80 80 800 500]);
hold on
AX1 = 0;
AX2 = 600;
axis equal;
axis([AX1 AX2 -200 180])
axis off
%% Images
skull = imread('skull.jpg');
LOSER = 0;
WINNER = 0;
klop = 0;
klop1 = 0;
klop2 = 0;
klop3 = 0;
klop4 = 0;
imgBackData = imread('bkg5.jpg');
im = imread('even3.bmp');

h_background = imagesc(imgBackData);
set(h_background,'xdata',[0 5000],'ydata',[-300 180]);


%%
imtank = imread('tank.jpg');
imtank1 = imread('tank1.jpg');
megatank = imread('megatank1.jpg');
Mega = imagesc(megatank);
Imtank = imagesc(imtank);
Imtank1 = imagesc(imtank);
Imtank2 = imagesc(imtank);
Imtank3 = imagesc(imtank1);
%% alpha
aFrontM = (double(megatank(:,:,1))+double(megatank(:,:,2))+...
    double(megatank(:,:,3)))./3;

aFrontM=1-(aFrontM==0);
set(Mega,'xdata',[4650 4850],'ydata',[-10 140],'alphadata',aFrontM(:,:,:));
set(Imtank,'xdata',[1500 1550],'ydata',[20 70]);
set(Imtank1,'xdata',[2500 2550],'ydata',[20 70]);
set(Imtank2,'xdata',[2580 2630],'ydata',[20 70]);
set(Imtank3,'xdata',[2660 2710],'ydata',[20 70]);

%% AlphaDAta
aFront = (double(im(:,:,1))+double(im(:,:,2))+...
    double(im(:,:,3)))./3;

aFront=1-(aFront==255);

% aFrontskull = (double(skull(:,:,1))+double(skull(:,:,2))+...
%     double(skull(:,:,3)))./3;
% 
% aFrontskull=1-(aFront==255);
%% other variables

M = 1;
MM = 1;
DIE = 0;
U1 = 35;
U2 = 45;
Ux =1;
Uy =1;
jj = 1500;
jj1 = 2500;
jj2 = 2580;
jj3 = 2660;
jj4 = 4650;
[h w d] = size(im);
Incre = [10 10];
Increj = [30 30];
xLoc = [1 1];
yLoc = [1 1];
jump = [10 10];
bulletincre = [50 43];
bulletcr = [50 22];
keyPressed = 'f';
blah = 0;
canon = 20;
YC = 35;
BL = 15;
%% rectangles
HJK = rectangle('Position',[0 0 1 1],'facecolor','r','curvature',[1 1]);
TKG = rectangle('Position',[jj YC canon canon],'facecolor','b','curvature',[1 1]);
TKG1 = rectangle('Position',[jj1 YC canon canon],'facecolor','b','curvature',[1 1]);
TKG2 = rectangle('Position',[jj2 YC canon canon],'facecolor','b','curvature',[1 1]);
TKG3 = rectangle('Position',[jj3 YC canon canon],'facecolor','k','edgecolor','b','curvature',[1 1]);
MTKG = rectangle('Position',[jj4 25 canon canon],'facecolor','k','edgecolor','r','curvature',[1 1]);
MTKG1 = rectangle('Position',[jj4 YC+25 canon canon],'facecolor','k','edgecolor','r','curvature',[1 1]);
MTKG2 = rectangle('Position',[jj4 3*YC canon canon],'facecolor','k','edgecolor','r','curvature',[1 1]);
huh = 1;
set(gcf, 'KeyPressFcn', 'keyPressed = get(gcf, ''CurrentCharacter'')');

%% Image
g = imagesc(im(1*h/8:1*h/8+h/8,1:w/8,:));
set(g,'alphaData',aFront(1*h/8:2*h/8,1:w/8,:))
%% sounds
stage = audioread('music.mp3');
stageplay = audioplayer(stage,44100);
play(stageplay)

%death
[y2 fs2] = audioread('explosion.wav');
%explosion
[Y FS] = audioread('explosion.wav');


%% Action
while 1
MM = MM + 1;


if keyPressed == 's'
    Uy = yLoc(1);
else
    Ux = xLoc(1) + U1;
    Uy = yLoc(1) + U2;
end


if keyPressed == 'r'
        blah = 1;
        keyPressed = 'f';
end
    if keyPressed == 'f'
        bul = 1;
        blah = blah + 1;
        
        Abul = xLoc(1) + bulletincre(1);
        Bbul = yLoc(1) + bulletincre(2);
        
            if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
            end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end

          for j=1*h/8:2*h/8:(2*h/8 - h/8)
            set(g,'Cdata',im(j:j+h/8,1:w/8,:));
           
            set(g,'alphaData',aFront(1*h/8:2*h/8,1:w/8,:))
            set(g,'xdata',xLoc,'ydata',yLoc);
            


            pause(0.1);


          end
    
 %% Run   
    elseif keyPressed == 'd'
        bul = 0;
        blah = 1;
%         g = imagesc(im(1*h/8:2*h/8,w/8:w/8+w/8,:)); 

                for r=w/8:w/8:(7*w/8-w/8)
                   set(g,'Cdata',im(1*h/8:2*h/8,r:r+w/8,:)); % display cropped image on the screen
                   set(g,'alphaData',aFront(1*h/8:2*h/8,r:r+w/8,:))
                   
                   xLoc = xLoc + Incre; 
                   set(g,'xdata',xLoc);
                   blah = blah + 1;
                   
                   set(TKG,'Position',[jj YC canon canon]);
                   
                   if AX2 < 5000
                   AX1 = AX1 + 9.8;
                   AX2 = AX2 + 9.8;
                   axis([AX1 AX2 -200 180]);
                   end
                   if xLoc(2) > 1000 && norm(Ux - jj) < 20 && norm(Uy - YC) < 20
                       keyPressed = 'k';
                   end
    if xLoc(2) > 2000 && norm(Ux - jj1) < 20 && norm(Uy - YC) < 20
        keyPressed = 'k';
    end
    if xLoc(2) > 2000 && norm(Ux - jj2) < 20 && norm(Uy - YC) < 20
        keyPressed = 'k';
    end
    if xLoc(2) > 2000 && norm(Ux - jj3) < 20 && norm(Uy - YC) < 20
        keyPressed = 'k';
    end

                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
                   
                   
                   if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
                   end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
                   pause(0.1);

                end
            
            
%% jump        
    elseif keyPressed == 'w'
        bul = 0;
        blah = 1;
        for T = 1:3
            
            if T == 1
          for j=2*h/8:h/8:(5*h/8)
%             g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
            set(g,'Cdata',im(j:j+h/8,1:w/8,:));
            set(g,'alphaData',aFront(j:j+h/8,1:w/8,:))
            yLoc = yLoc + Increj;
            
            set(g,'xdata',xLoc,'ydata',yLoc);
            
            if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
            end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
            
            
            

                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
            
             
             
            pause(0.1);
          end
          
            elseif T == 2
              for j=2*h/8:h/8:(5*h/8)
%                g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
               set(g,'Cdata',im(j:j+h/8,1:w/8,:));
               set(g,'alphaData',aFront(j:j+h/8,1:w/8,:))
               yLoc = yLoc - Increj; 
            
               set(g,'xdata',xLoc,'ydata',yLoc);
               
                       
            if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
            end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
               
                

                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
                
                
                
               pause(0.1);
             end
            elseif T == 3
               for j=1*h/8:2*h/8:(2*h/8 - h/8)
%                 g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
                set(g,'Cdata',im(j:j+h/8,1:w/8,:));
                set(g,'xdata',xLoc,'ydata',yLoc);
                set(g,'alphaData',aFront(1*h/8:2*h/8,1:w/8,:))
                
              if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
              end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
                       
                       Abul = Abul + BL;
                       set(HJK,'Position',[Abul Bbul 10 10])
            
                pause(0.1);
                keyPressed = 'd';

                end
          
            end
        end
          
          
 %%down         
    elseif keyPressed == 's'
        bul = 0;
        blah = 1;
%         delete(hjk);
%         blah = blah + 1;
%         cr = 0;
          for j=1:h/8:((h/8 + 1) - h/8)
%             g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
            set(g,'Cdata',im(j:j+h/8,1:w/8,:));
            set(g,'alphaData',aFront(j:j+h/8,1:w/8,:))
            set(g,'xdata',xLoc);
            
                if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
                end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
            
             

                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
            
            


            pause(0.1);

          end
          
   
          
          
%%jumpfront
    elseif keyPressed == 'e'
        bul = 0;
        blah = 1;
         for T = 1:3
            
            if T == 1
          for j=2*h/8:h/8:(5*h/8)
%             g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
            set(g,'Cdata',im(j:j+h/8,1:w/8,:));
            set(g,'alphaData',aFront(j:j+h/8,1:w/8,:))
            yLoc = yLoc + Increj;
            xLoc = xLoc + jump;
            set(g,'xdata',xLoc,'ydata',yLoc)
            if AX2 < 5000
            AX1 = AX1 + 8.5;
                   AX2 = AX2 + 8.5;
                   axis([AX1 AX2 -200 180]);
            end
            if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
            end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
            
                   
                   

                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
                    
            pause(0.1);
          end
          
            elseif T == 2
              for j=2*h/8:h/8:(5*h/8)
%                g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
               set(g,'Cdata',im(j:j+h/8,1:w/8,:));
               set(g,'alphaData',aFront(j:j+h/8,1:w/8,:))
               yLoc = yLoc - Increj; 
               xLoc = xLoc + jump;
               set(g,'xdata',xLoc,'ydata',yLoc)
               if AX2 < 5000
               AX1 = AX1 + 8.5;
                   AX2 = AX2 + 8.5;
                   axis([AX1 AX2 -200 180]);
               end
            if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
            end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
            
                   
                    

                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
                   
               pause(0.1);
              end
            elseif T == 3
               for j=1*h/8:2*h/8:(2*h/8 - h/8)
%                 g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
                set(g,'Cdata',im(j:j+h/8,1:w/8,:));
                set(g,'xdata',xLoc,'ydata',yLoc)
                if AX2 < 5000
                AX1 = AX1 + 8.5;
                   AX2 = AX2 + 8.5;
                   axis([AX1 AX2 -200 180]);
                end
               if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
               end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
                   
                set(g,'alphaData',aFront(1*h/8:2*h/8,1:w/8,:))
                pause(0.1);
                keyPressed = 'd';

                end
          
            end
         end
         
         
         
         
%%jumpback
            elseif keyPressed == 'q'
                bul = 0;
                blah = 1;
         for T = 1:3
            
            if T == 1
          for j=2*h/8:h/8:(5*h/8)
%             g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
            set(g,'Cdata',im(j:j+h/8,1:w/8,:));
            set(g,'alphaData',aFront(j:j+h/8,1:w/8,:))
            yLoc = yLoc + Increj;
            xLoc = xLoc - jump;
            set(g,'xdata',xLoc,'ydata',yLoc)
            if AX2 < 5000
            AX1 = AX1 - 8.5;
                   AX2 = AX2 - 8.5;
                   axis([AX1 AX2 -200 180]);
            end
            if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
            end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
            
                   

                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
                    
            pause(0.1);
          end
          
            elseif T == 2
              for j=2*h/8:h/8:(5*h/8)
%                g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
               set(g,'Cdata',im(j:j+h/8,1:w/8,:));
               set(g,'alphaData',aFront(j:j+h/8,1:w/8,:))
               yLoc = yLoc - Increj; 
               xLoc = xLoc - jump;
               set(g,'xdata',xLoc,'ydata',yLoc);
               if AX2 < 5000 
               AX1 = AX1 - 8.5;
                   AX2 = AX2 - 8.5;
                   axis([AX1 AX2 -200 180]);
               end

            if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
            end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
                   
                

                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
                
               pause(0.1);
              end
            elseif T == 3
               for j=1*h/8:2*h/8:(2*h/8 - h/8)
%                 g = imagesc(im(j:j+h/8,1:w/8,:)); % display cropped image on the screen
                set(g,'Cdata',im(j:j+h/8,1:w/8,:));
                set(g,'xdata',xLoc,'ydata',yLoc)
                   if AX2 < 5000
                   AX1 = AX1 - 8.5;
                   AX2 = AX2 - 8.5;
                   axis([AX1 AX2 -200 180]);
                   end
                if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
                end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
                   Abul = Abul + BL;
                   set(HJK,'Position',[Abul Bbul 10 10])
                   
                set(g,'alphaData',aFront(1*h/8:2*h/8,1:w/8,:))
                pause(0.1);
                keyPressed = 'd';

                end
          
            end
        end
        

                    
%%DIE                   
    elseif keyPressed == 'k'
        bul = 0;
        blah = 1;
                for r=w/8:w/8:(7*w/8-w/8)
%                    g = imagesc(im(2*h/8:3*h/8,r:r+w/8,:)); % display cropped image on the screen
                   set(g,'Cdata',im(2*h/8:3*h/8,r:r+w/8,:));
                   set(g,'alphaData',aFront(2*h/8:3*h/8,r:r+w/8,:))
                   xLoc = xLoc - 3*Incre;
                   set(g,'xdata',xLoc);
                   if AX2 < 5000
                   AX1 = AX1 - 28.5;
                   AX2 = AX2 - 28.5;
                   axis([AX1 AX2 -200 180]);
                   end
                   
                   pause(0.1);

                end
                stop(stageplay)
                LOSER = 1;

                break
    end


if bul == 1
for K = 1:blah

    Abul = Abul + BL;
    set(HJK,'Position',[Abul Bbul 10 10])
end
end

if AX2 < 5000
axis([AX1 AX2 -200 180]);
end
if AX2 > 5000
    AX1 = 4400;
    AX2 = 5000;
    axis([AX1 AX2 -200 180]);
end
if keyPressed == 's'
    Uy = yLoc(1);
else
    Ux = xLoc(1) + U1;
    Uy = yLoc(1) + U2;
end

    
            if xLoc(2) > 1000
               jj = jj - 10;
               set(TKG,'Position',[jj YC canon canon]);
            end
            if xLoc(2) > 2100
                jj1 = jj1 - 10;
                jj2 = jj2 - 10;
                jj3 = jj3 - 10;
                set(TKG1,'Position',[jj1 YC canon canon]);
                set(TKG2,'Position',[jj2 YC canon canon]);
                set(TKG3,'Position',[jj3 YC canon canon]);
            end
            
            if jj < 1000 && DIE < 3
               jj = 1500;
            end
            if jj1 < 2100 && DIE < 12
               jj1 = 2500;
            end
            if jj2 < 2100 && DIE < 18
               jj2 = 2580;
            end
            if jj3 < 2100 && DIE < 24
               jj3 = 2660;
            end
            if jj4 < 3900 && DIE < 60
                jj4 = 4650;
                M = mod(MM,2);
            end
            if xLoc(2) > 3900 && M ~= 1
                jj4 = jj4 - 10;
                set(MTKG,'Position',[jj4 25 canon canon]);
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
            elseif xLoc(2) > 3900 && M == 1
                jj4 = jj4 - 10;
                set(MTKG1,'Position',[jj4 YC+25 canon canon]);
                set(MTKG2,'Position',[jj4 3*YC canon canon]);
            end
    
    
    if norm(Abul - 1520) < 30 && DIE < 3
        DIE = DIE + 0.3;
    end
    if norm(Abul - 2520) < 30 && DIE < 12
        DIE = DIE + 0.2;
    end
    if norm(Abul - 2600) < 30 && DIE < 18
        DIE = DIE + 0.2;
    end
    if norm(Abul - 2680) < 30 && DIE < 24
        DIE = DIE + 0.1;
    end
    if norm(Abul - 4750) < 100 && DIE < 60
        DIE = DIE + 0.5;
    end
    
    
    if DIE > 3
        set(Imtank,'xdata',[0 0],'ydata',[0 0]);
        klop = klop +1;

    end
    if klop == 1
              sound(Y,FS);
              WINNER = 1;
              pause(5)
              stop(stageplay)
              break
              
    end

    
    
    if DIE > 12
        set(Imtank1,'xdata',[0 0],'ydata',[0 0]);
        klop1 = klop1 +1;
    end
    
    if klop1 == 1
              sound(Y,FS);
    end
    if DIE > 18
        set(Imtank2,'xdata',[0 0],'ydata',[0 0]);
        klop2 = klop2 +1;
    end
    
    if klop2 == 1
              sound(Y,FS);
    end
    if DIE > 24
        set(Imtank3,'xdata',[0 0],'ydata',[0 0]);
        klop3 = klop3 +1;
    end
    if DIE > 60
        set(Mega,'xdata',[1 1],'ydata',[1 1],'alphadata',aFrontM(:,:,:));
        klop4 = klop4 + 1;
    end
    if klop4 == 1
              sound(Y,FS);
    end

    if klop3 == 1
              sound(Y,FS);
    end
    if klop4 == 1
        sound(Y,FS);
        WINNER = 1;
        pause(5);
        break
    end
    
    
    if xLoc(2) > 1000 && norm(Ux - jj) < 20 && norm(Uy - YC) < 20
        keyPressed = 'k';
        
        
    end
    if xLoc(2) > 2000 && norm(Ux - jj1) < 20 && norm(Uy - YC) < 20
        keyPressed = 'k';
    end
    if xLoc(2) > 2000 && norm(Ux - jj2) < 20 && norm(Uy - YC) < 20
        keyPressed = 'k';
    end
    if xLoc(2) > 2000 && norm(Ux - jj3) < 20 && norm(Uy - YC) < 20
        keyPressed = 'k';
    end
    
    
    if xLoc(2) > 3900 && norm(Ux - jj4) < 20 && (norm(Uy - 25) < 25 || norm(Uy - 3*YC) < 20 || norm(Uy - (YC + 25)) < 20)
        keyPressed = 'k';
    end
%     if xLoc(2) > 3900 && norm(Ux - jj4) && norm(Uy - 25) < 30
%         keyPressed = 'k';
%     end
%     
    if keyPressed == 'p'
        pause(15)
        keyPressed = 'f';
    end
    if keyPressed ~= 'q' && keyPressed ~= 'w' && keyPressed ~= 'e' && keyPressed ~= 'r' && keyPressed ~= 's' && keyPressed ~= 'd' && keyPressed ~= 'f' && keyPressed ~= 'p' && keyPressed ~= 'k' 
        keyPressed = 'f';
        
    end


end
if LOSER == 1
stop(stageplay);
aFront = (double(skull(:,:,1))+double(skull(:,:,2))+...
    double(skull(:,:,3)))./3;

aFront=1-(aFront==255);

SKULL = imagesc(skull);
fghj = (AX1 + AX2)/2;
set(SKULL,'xdata',[(fghj - 150) (fghj + 150)],'ydata',[-200 180],'alphadata',aFront);

[y1 fs1] = audioread('contra_gameover.wav');
handel1 = audioplayer(y1,fs1);
sound(y1,fs1)
pause(10);
GAME;
end


if WINNER == 1
    winner = imread('winner.jpg');
    Winner = imagesc(winner);
    set(Winner,'ydata',[-200 180],'xdata',[AX1 AX2]);
    [Y1 FS1] = audioread('winn.wav');
    sound(Y1,FS1);
    pause(15);
    GAME;
end