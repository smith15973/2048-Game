function [canMove, found_2048, wantPlay, newGame] = displayYouWin(canMove, found_2048, wantPlay)
%displayYouWin displays the you win menu
%   this message is only dipslayed once and it is immediately after the
%   player creates their first 2048 tile. In this menu, the palyer has the
%   option to keep playing with the same board, start a new game, or quit.

%%title screens
Title_Scenes = simpleGameEngine('Title_Screen.png', 84, 84, 2, [245,245,245]);

%indeces for sprite images
titleWinBackground = 1;
titleKeepGoing = 3:5;
titleTransparent = 7;
titleTryAgain = 8:10;
titleYouWin = 11:12;
title2048Tile = 21:22;
titleQuit  = 23:24;

newGame = false;


%You win foreground and background
youWinBackground = titleWinBackground*ones(8,6);

youWinForeground = [titleTransparent*ones(1,6);
                    titleTransparent*ones(1,2), titleYouWin,titleTransparent*ones(1,2);
                    titleTransparent*ones(1,2), title2048Tile,titleTransparent*ones(1,2);
                    titleTransparent*ones(1,6);
                    titleKeepGoing, titleTryAgain;
                    titleTransparent*ones(1,6);
                    titleTransparent*ones(1,2), titleQuit, titleTransparent*ones(1,2);
                    titleTransparent*ones(1,6);];


close all hidden
drawScene(Title_Scenes, youWinBackground, youWinForeground);

                
    validClick = false;
    while ~validClick
        %gets the mouse input
        [clickRow, clickCol, ~] = getMouseInput(Title_Scenes);

        %the user clicks keep going
        if (youWinForeground(clickRow, clickCol) == titleKeepGoing(1) || ...
                youWinForeground(clickRow, clickCol) == titleKeepGoing(2) || ...
                youWinForeground(clickRow, clickCol) == titleKeepGoing(3))
                validClick = true;
        %the user clicks try again
        elseif (youWinForeground(clickRow, clickCol) == titleTryAgain(1) || ...
                youWinForeground(clickRow, clickCol) == titleTryAgain(2) || ...
                youWinForeground(clickRow, clickCol) == titleTryAgain(3))
            validClick = true;
            canMove = false;
            found_2048 = false;
            newGame = true;

        %if the user clicks quit
        elseif (youWinForeground(clickRow, clickCol) == titleQuit(1) || ...
                youWinForeground(clickRow, clickCol) == titleQuit(2))
            validClick = true;
            canMove = false;
            found_2048 = false;
            wantPlay = false;
            newGame = true;
            return

        %if they click on anything else continue the while loop
        else
            validClick = false;
            
        end
    end
close all hidden




end