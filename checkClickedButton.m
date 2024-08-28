function [canMove,found_2048, wantPlay, newGame, clickHappened] = checkClickedButton(backGroundSheet, rowClick, columnClick, canMove,found_2048, wantPlay, newGame, clickHappened)
%checkClickedButton Summary of this function goes here
%  if one of the buttons is pressed, checks the value and returns the
%  appropriate values to make the function happen

tNewGame = 21;
tQuit = 22;

if backGroundSheet(rowClick, columnClick) == tNewGame
    canMove = false;
    found_2048 = false;
    newGame = true;
    clickHappened = true;

elseif backGroundSheet(rowClick, columnClick) == tQuit
    canMove = false;
    found_2048 = false;
    wantPlay = false;
    newGame = true;
    clickHappened = true;
else
    return
end
end