function boardFull = boardFull(board)
%boardFull Reports if the board is full of tiles
%   Reports true if the board is full and reports false if the board has
%   empty spaces. Double for loop iterates and checks each tile and if it
%   is empty then it reports that the board is not full

boardFull = true;

emptyTile = 2;

%nested for loops iterate through entire game board
for i = 4:7
    for j = 2:5
        if board(i,j) == emptyTile
            boardFull = false;
        end
    end

end

end