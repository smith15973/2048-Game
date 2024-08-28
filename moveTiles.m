function [board, score, boardChanged] = moveTiles(board, key, score)
%moveTiles moves all the tiles from the key input and creates the new board
%   this function simply calls the functions shiftTiles and combine tiles
%   to give move the tiles and combine appropriately

originalBoard = board;
boardChanged = true;

%for shifting all tiles up
if (strcmp(key, 'w') || strcmp(key, 'uparrow'))
    for c = 2:5
        for r = 5:7
        board = shiftTiles(board, r, c, key);
        end
    end
    [board,score] = combineTiles(board, key,score);
end

%for shifting all tiles down
if (strcmp(key, 's') || strcmp(key, 'downarrow'))
    for c = 2:5
        for r = 6:-1:4
        board = shiftTiles(board, r, c, key);
        end
    end
    [board,score] = combineTiles(board, key,score);
end

%for shifting all tiles right
if (strcmp(key, 'd') || strcmp(key, 'rightarrow'))
    for r = 4:7
        for c = 4:-1:2
        board = shiftTiles(board, r, c, key);
        end
    end
    [board,score] = combineTiles(board, key,score);
end

%for shifting all tiles left
if (strcmp(key, 'a') || strcmp(key, 'leftarrow'))
    
    for r = 4:7
        for c = 3:5
        board = shiftTiles(board, r, c, key);
        end
    end
    [board,score] = combineTiles(board, key,score);
end


if isequal(originalBoard,board)
    boardChanged = false;
end

end


