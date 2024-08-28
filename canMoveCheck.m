function availableMove = canMoveCheck(board)
%canMoveCheck Checks if there is an available move
%   Checks if there is an available move. If there is a move available,
%   reports true, and if there is not then it reports false.
availableMove = true;

%checks if the board is full
boardFull = boarFullCheck(board);

%checks for neighboring tile
availableCombine = neighborTileEqual(board);

if boardFull && ~availableCombine
    availableMove = false;
end
end