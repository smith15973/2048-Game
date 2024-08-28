bestScoreFile = fopen("BestScore.txt");
formatSpec = '%i';

bestScore = fscanf(bestScoreFile, formatSpec);

%%gameplay screen visuals

%the simpleGameEngine object that runs the whole game
Game_Scene = simpleGameEngine('Tiles_2048.png', 84, 84, 2, [245,245,245]);

%index values for all the tile types
tNothing = 1;
tBlank = 2;
t2 = 3;
t4 = 4;
t8 = 5;
t16 = 6;
t32 = 7;
t64 = 8;
t128 = 9;
t256 = 10;
t512 = 11;
t1024 = 12;
t2048 = 13;
t4096 = 14;
t8192 = 15;
tScore = 16;
tBest = 17;
tbrown = 18;
tbackground = 19;
t2048Header = 20;
tNewGame = 21;
tQuit = 22;



%sets the game background
blankBackground = tbackground*ones(8,6);
backgroundSheet = blankBackground;
backgroundSheet(2,2) = t2048Header;
backgroundSheet(2,4) = tScore;
backgroundSheet(2,5) = tBest;
backgroundSheet(3,4) = tNewGame;
backgroundSheet(3,5) = tQuit;


%the borders that go around
topBorder = tNothing*ones(3,6);
sideBorder = tNothing*ones(1,1);
bottomBorder = tNothing*ones(1,6);

%a value for an empty board
emptyBoard = [topBorder; 
        sideBorder, tBlank*ones(1,4), sideBorder;
        sideBorder, tBlank*ones(1,4), sideBorder; 
        sideBorder, tBlank*ones(1,4), sideBorder; 
        sideBorder, tBlank*ones(1,4), sideBorder; 
        bottomBorder];

%%gameplay

%initialized so the game will start
wantPlay = true;


%while the player wants to play
while wantPlay       
    
    %start board with just two tiles
    board = newBoard(emptyBoard);
    score = 0;
    canMove = true;
    found_2048 = false;
    newGame = false;

    

    %while there is a legal move
    while canMove

        %draws the gameboard
        drawScene(Game_Scene,backgroundSheet, board);        

        %update Score
        scoreText = text(7*84,3.15*84, int2str(score),"FontSize", 20, "FontWeight","bold", "HorizontalAlignment","center", "VerticalAlignment","middle", 'color', 'w');
        
        %updates high score if it is passed in the game
        if (score > bestScore)
            bestScore = score;
        end
        bestScoreText = text(9*84,3.15*84, int2str(bestScore),"FontSize", 20, "FontWeight","bold", "HorizontalAlignment","center", "VerticalAlignment","middle", 'color', 'w');
            
        tilesMoved =false;
        %loop continues to get input until the a valid key was pressed that
        %made a change to the board
        while ~tilesMoved
            
            clickHappened = false;
            validKey = false;
            while ~validKey && ~clickHappened
                %waits for user input
                userInput = waitforbuttonpress;
                %if the user inputs a key
                if userInput == 1
                    key = get(Game_Scene.my_figure,'CurrentKey');
                    validKey = validKeyCheck(key);
                
                %if the mouse is clicked
                else 
                %get mouse clicked location
                [row,col] = getMouseInput(Game_Scene);
                
                %gets the value of the location clicked
                [canMove,found_2048, wantPlay, newGame, clickHappened] = checkClickedButton(backgroundSheet, row, col, canMove,found_2048, wantPlay, newGame, clickHappened);
                end
            end
            
            %move the tiles and returns the new board, the score, and if
            %the board actually changed
            [board, score,tilesMoved] = moveTiles(board, key, score);          
            
        end

        %delete old score
        delete(scoreText);
        delete(bestScoreText);
        
        %show new board after move
        drawScene(Game_Scene, backgroundSheet, board);        
        
        %add a new tile in random empty location
        board = generateTile(board);

        %short pause so you can see which tile is added but short enough to
        %still play fast
        pause(0.05);

        %show new board after move and new tile
        drawScene(Game_Scene, backgroundSheet, board);        
        
        %if the board if full
        if boardFull(board)
            %if there are no tiles to combine
            if ~neighborTileEqual(board)
                canMove = false;
            end
        end
        
        %shows the you win message after 2048 but only the first time it is
        %found
        if ~found_2048
            found_2048 = find2048(board);
            
            %shows the you win message
            if (found_2048 && ~clickHappened)
                [canMove, found_2048, wantPlay, newGame] = displayYouWin(canMove, found_2048, wantPlay);
            end
        end  
    end

    %game over now unless user wants to play again
       if ~newGame && ~clickHappened
       [wantPlay, bestScore] = displayGameOver(wantPlay, score, bestScore);

       end


end

%saves bestScore to file so it can be saved for next time it is played
writematrix(bestScore,"BestScore.txt");
fclose(bestScoreFile);

%closes all figures once the player is done playing
close all hidden
clear
clc
