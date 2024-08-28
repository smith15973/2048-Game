function board = newBoard(emptyBoard)
%newBoard starts a new board
%   Starts a new board with just 2 tiles
board = emptyBoard;
board = generateTile(board);
board = generateTile(board);
        
end