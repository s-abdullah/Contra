# Contra
My first ever coding experience. I recreated a childhood game (Contra) that I played on NES. It is made in Matlab.

# Summary
This Program tries to mimic the Legendary 1990’s game “CONTRA”. In this Matlab version of the game you try to destroy three different types of tanks that have invaded your territory. You have unlimited amount of ammunition and each tank is destroyed by a different number of successful bullet strikes. One strike from any of the tank’s bazookas will kill your player. The controls of the game are basic:
S: Crouch                 D: Run Forward
W: Jump up                F: Stand and Fire
Q: Jump Back              R: Reload, Stand and Fire
E: Jump Forward           P: Pauses the game for 15 seconds

(There is also the “Instructions” button, if the controls are hard to remember, in the main menu.)

You win the game when you have destroyed all the tanks. There will be three different difficulty levels when you press play. In the Easy Level, the player only has to destroy 1 tank. In the Medium Level, the player has to destroy the first tank as in the Easy Level and after that, has to run forward and destroy three additional tanks (the last one takes a lot of bullets to get destroyed). In the Hard Level, the player has to destroy the first tank as in the Easy Level and the next three tanks in the Medium Level and after that, the player has to destroy the “Mega-Tank” that fires three bazookas.

(Please be patient with the game, after winning or losing it will return to main menu after some pause. Please watch the whole Video especially the end which has the “Mega-Tank”)

The Matlab programming of the game was very hard. Basically the whole game is a big “While-loop”. The animation uses sprites. The image is defined before the loop and its ‘alpha-data’ ‘x-data’ y-data’ ‘c-data’ ‘Height’ ‘Width’ are changed in a “For-loop” that is initiated according to the key pressed. The Bullets and Bazookas are also preset before the loop and their positions are changed according in every “For-loop” and in the “While-loop”. If the player Wins or Loses, the “While-loop” is broken. All the images used in the game are edited specifically for the project by me. The sprite image was particularly hard to make since the spacing had to be kept constant.

![alt text](https://github.com/s-abdullah/Contra/blob/master/images/1.png)
![alt text](https://github.com/s-abdullah/Contra/blob/master/images/2.png)
![alt text](https://github.com/s-abdullah/Contra/blob/master/images/3.png)
![alt text](https://github.com/s-abdullah/Contra/blob/master/images/4.png)
