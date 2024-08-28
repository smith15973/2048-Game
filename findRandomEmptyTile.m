function [R,C] = findRandomEmptyTile(gameTable)
%findRandomEmptyTile Finds an empty tile on the board
%   a random number generate runs until a row and column combination on the
%   board is empty. It then reports those coordinates
rng("shuffle");
foundTile = false;

while ~foundTile
    R = randi(4) + 3;
    C = randi(4) + 1;
    if (gameTable(R,C) == 2)
        foundTile = true;
    end
end
end