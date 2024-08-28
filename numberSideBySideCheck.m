function availableMove = numberSideBySideCheck(board)
%numberSideBySideCheck checks if there are any numbers that are equal to
%each other next to each other
%   double for loop to iterate through all the tiles. The first double for
%   loop compares all the block values that are side by side and the 2nd
%   one compares all the values vertically. If at any point 2 values are
%   equal, that means they could be combined, so a move is available and
%   the game wont end
availableMove = false;

%checks all blocks side by side horizontally
for r = 4:7
    for c = 2:4
        if (board(r,c) == board(r,c + 1))
            availableMove = true;
            break
        end
    end
end

%checks all blocks side by side vertically
for r = 4:6
    for c = 2:5
        if (board(r,c) == board(r+1,c))
            availableMove = true;
            break
        end
    end
end
end