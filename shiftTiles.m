function board = shiftTiles(board,r, c, key)
%shiftTiles shifts all tiles to respective side
%   this recursive function shifts all the tiles in whatever
%   direction the key chosen is. So if they pressed up, then all the tiles
%   in each column should occupy the spaces from the top down and if they 
%   pressed left alltiles should be occuppied in the rows from left to
%   right, etc..

%the value of an empty tile
empty = 2;

%shift all tiles up
if (strcmp(key, 'w') || strcmp(key, 'uparrow'))
    if board(r-1, c) == empty
        %border check
        if board(r-1,c) ~= 19
            board(r-1,c) = board(r,c);
            board(r,c) = empty;
            %recursive call
            board = shiftTiles(board,r-1, c, key);
        end
    end
end

%shift all tiles down
if (strcmp(key, 's') || strcmp(key, 'downarrow'))
    if board(r+1, c) == empty
        %border check
        if board(r+1,c) ~= 19
            board(r+1,c) = board(r,c);
            board(r,c) = empty;
            %recursive call
            board = shiftTiles(board,r+1, c, key);
        end
    end
end

%shift all tiles right
if (strcmp(key, 'd') || strcmp(key, 'rightarrow'))
    if board(r, c+1) == empty
        %border check
        if board(r,c+1) ~= 19
            board(r,c+1) = board(r,c);
            board(r,c) = empty;
            %recursive call
            board = shiftTiles(board,r, c+1, key);
        end
    end
end

%shift all tiles left
if (strcmp(key, 'a') || strcmp(key, 'leftarrow'))
    if board(r, c-1) == empty
        %border check
        if board(r,c-1) ~= 19
            board(r,c-1) = board(r,c);
            board(r,c) = empty;
            %recursive call
            board = shiftTiles(board,r, c-1, key);
        end
    end
end


end




