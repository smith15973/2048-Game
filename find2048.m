function found= find2048(board)
%find2048 find if there is a 2048 tile
%   searches board to check if there is a 2048 tile. If there is it returns
%   true and if its not ther it returns false.
found = false;


for i = 4:7
    for j = 2:5
        if board(i,j) == 13
            found = true;
        end
    end
end

end