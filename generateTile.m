function board = generateTile(board)
%generateTile generates a 2 or 4 tile on the board
%   generates a 2 or 4 tile in empty location on board. It gets the
%   location from the findEmptyTile function and then gets the value from
%   Get2or4. Then reports the board with this change.
[rTileLocation,cTileLocation] = findRandomEmptyTile(board);
tileValue = Get2or4;
board(rTileLocation, cTileLocation) = tileValue;

end