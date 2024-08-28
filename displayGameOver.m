function [playAgain, bestScore] = displayGameOver(playAgain, score, bestScore)
%displayGameOver Summary of this function goes here
%   this will display the game over screen and will return the correct
%   values to either make it so the player can start a new game or quit.
%   This will also display the score and a nessage if it is a new high
%   score.


Title_Scenes = simpleGameEngine('Title_Screen.png', 84, 84, 2, [245,245,245]);

%indeces for sprite images
titleLoseBackground = 6;
titleTransparent = 7;
titleTryAgain = 8:10;
titleScore = 13:15;
titleGameOver = 16:19;
titleQuit  = 23:24;


%Game over foreground
gameOverForeground = [titleTransparent*ones(1,6);
                    titleTransparent*ones(1,1), titleGameOver,titleTransparent*ones(1,1);
                    titleTransparent*ones(2,6);
                    titleScore, titleTryAgain;
                    titleTransparent*ones(1,6);
                    titleTransparent*ones(1,2), titleQuit, titleTransparent*ones(1,2);
                    titleTransparent*ones(1,6);];

%Game over foreground
gameOverBackground = titleLoseBackground*ones(8,6);



close all hidden;
drawScene(Title_Scenes, gameOverBackground, gameOverForeground);

%checks to see if its a new high score
if score > bestScore
    bestScore = score;
    newHighScoreText = text(6*84, 6*84, "New High Score!","FontSize", 45, "FontWeight","bold", "HorizontalAlignment","center", "VerticalAlignment","middle", 'color', '#766F66');
end


%display Score
scoreText = text(3*84,9.1*84, int2str(score),"FontSize", 30, "FontWeight","bold", "HorizontalAlignment","center", "VerticalAlignment","middle", 'color', 'w');

validClick = false;
    while ~validClick
        %gets the mouse input
        [clickRow, clickCol, ~] = getMouseInput(Title_Scenes);
        
        %the user clicks try again
        if (gameOverForeground(clickRow, clickCol) == titleTryAgain(1) || ...
                gameOverForeground(clickRow, clickCol) == titleTryAgain(2) || ...
                gameOverForeground(clickRow, clickCol) == titleTryAgain(3))
            validClick = true;
    
        %if the user clicks quit
        elseif (gameOverForeground(clickRow, clickCol) == titleQuit(1) || ...
                gameOverForeground(clickRow, clickCol) == titleQuit(2))
            validClick = true;
            playAgain = false;

    
        %if they click on anything else continue the while loop
        else
            validClick = false;
            
        end
    end

close all hidden;


end