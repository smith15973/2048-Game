function [board,score] = combineTiles(board, key, score)
%combineTiles Combines all the tiles that should be
%   this will combine all the tiles in each appropriate row/column after
%   all the tiles are shifted to the far side of whatever key direction is
%   chosen

empty = 2;

if strcmp(key, 'w') || strcmp(key,'uparrow')
    for c=2:5
        %runs if the column isn't empty
        if board(4,c) ~= empty
            %if top two tiles are equal and not empty
            if board(4,c) == board(5,c) && board(4,c) ~= empty
                board(4,c) = board(4,c) + 1;            
                board(5,c) = empty;
                %add score
                score = addToScore(score, board(4,c));
                
    
                %if bottom two tiles are equal after top 2 equal and not
                %empty
                if board(6,c) == board(7,c) && board(6,c) ~= empty
                    board(5,c) = board(6,c) +1;
                    board(6,c) = empty;
                    board(7,c) = empty;
                    %add score
                    score = addToScore(score, board(5,c));

                %if the bottom two are not equal and top two are equal
                else
                    board(5,c) = board(6,c);
                    board(6,c) = board(7,c);
                    board(7,c) = empty;
                end
            %top two tiles aren't equal so top is set
            else
                %if the middle two tiles are equal and not empty
                if board(5,c) == board(6,c) && board(5,c) ~= empty
                    board(5,c) = board(5,c) + 1;
                    board(6,c) = board(7,c);
                    board(7,c) = empty;
                    %add score
                    score = addToScore(score, board(5,c));
                
                    %top two and middle two tiles are not equal 
                else
                    %if bottom two are equal and not empty and the rest are set
                    if board(6,c) == board(7,c) && board(6,c) ~= empty
                        board(6,c) = board(6,c) + 1;
                        board(7,c) = empty;

                        %add score
                        score = addToScore(score, board(6,c));
                    end
                end
            end
        end
    end
end

if strcmp(key, 's') || strcmp(key,'downarrow')
    for c=2:5
        %runs if the column isn't empty
        if board(7,c) ~= empty
            %if bottom two tiles are equal and not empty
            if board(7,c) == board(6,c) && board(7,c) ~= empty
                board(7,c) = board(7,c) + 1;
                board(6,c) = empty;
                
                %add score
                score = addToScore(score, board(7,c));
    
                %if top two tiles are equal after bottom two equal and not
                %empty
                if board(5,c) == board(4,c) && board(5,c) ~= empty
                    board(6,c) = board(5,c) +1;
                    board(5,c) = empty;
                    board(4,c) = empty;

                    %add score
                    score = addToScore(score, board(6,c));

                %if the top two are not equal and bottom two are equal
                else
                    board(6,c) = board(5,c);
                    board(5,c) = board(4,c);
                    board(4,c) = empty;
                end
            %bottom two tiles aren't equal so bottom is set
            else
                %if the middle two tiles are equal and not empty
                if board(6,c) == board(5,c) && board(6,c) ~= empty
                    board(6,c) = board(6,c) + 1;
                    board(5,c) = board(4,c);
                    board(4,c) = empty;

                    %add score
                    score = addToScore(score, board(6,c));
                
                    %bottom two and middle two tiles are not equal 
                else
                    %if just top two are equal and not empty and others are set
                    if board(5,c) == board(4,c) && board(5,c) ~= empty
                        board(5,c) = board(5,c) + 1;
                        board(4,c) = empty;

                        %add score
                        score = addToScore(score, board(5,c));
                    end
                end
            end
        end
    end
end

if strcmp(key, 'd') || strcmp(key,'rightarrow')
    for r=4:7
        %runs if the row isn't empty
        if board(r,5) ~= empty
            %if right two tiles are equal and not empty
            if board(r,5) == board(r,4) && board(r,5) ~= empty
                board(r,5) = board(r,5) + 1;
                board(r,4) = empty;
                %add score
                score = addToScore(score, board(r,5));
    
                %if left two tiles are equal after right 2 equal and are
                %not empty
                if board(r,3) == board(r,2) && board(r,3) ~= empty
                    board(r,4) = board(r,3) +1;
                    board(r,3) = empty;
                    board(r,2) = empty;
                    %add score
                    score = addToScore(score, board(r,4));

                    
                %if the left two are not equal and right two are equal
                else
                    board(r,4) = board(r,3);
                    board(r,3) = board(r,2);
                    board(r,2) = empty;
                end
            %right two tiles aren't equal so right is set
            else
                %if the middle two tiles are equal and not empty
                if board(r,4) == board(r,3) && board(r,4) ~= empty
                    board(r,4) = board(r,4) + 1;
                    board(r,3) = board(r,2);
                    board(r,2) = empty;
                    %add score
                    score = addToScore(score, board(r,4));
                
                    %right two and middle two tiles are not equal 
                else
                    %if left two are equal and not empty and the rest are set
                    if board(r,3) == board(r,2) && board(r,3) ~= empty
                        board(r,3) = board(r,3) + 1;
                        board(r,2) = empty;
                        %add score
                        score = addToScore(score, board(r,3));
                    end
                end
            end
        end
    end
end

if strcmp(key, 'a') || strcmp(key,'leftarrow')
    for r=4:7
        %runs if the row isn't empty
        if board(r,2) ~= empty
            if board(r,2) == board(r,3) && board(r,2) ~= empty
                board(r,2) = board(r,2) + 1;
                board(r,3) = empty;
                %add score
                score = addToScore(score, board(r,2));
    
                %if right two tiles are equal after left 2 equal
                if board(r,4) == board(r,5) && board(r,4) ~= empty
                    board(r,3) = board(r,4) +1;
                    board(r,4) = empty;
                    board(r,5) = empty;
                    %add score
                    score = addToScore(score, board(r,3));

                %if the right two are not equal and left two are equal
                else
                    board(r,3) = board(r,4);
                    board(r,4) = board(r,5);
                    board(r,5) = empty;
                end
            %left two tiles aren't equal so left is set
            else
                %if the middle two tiles are equal and not empty
                if board(r,3) == board(r,4) && board(r,3) ~= empty
                    board(r,3) = board(r,3) + 1;
                    board(r,4) = board(r,5);
                    board(r,5) = empty;
                    %add score
                    score = addToScore(score, board(r,3));
                
                    %left two and middle two tiles are not equal 
                else
                    %if right two are equal and not empty and the rest are set
                    if board(r,4) == board(r,5) && board(r,4) ~= empty
                        board(r,4) = board(r,4) + 1;
                        board(r,5) = empty;
                        %add score
                        score = addToScore(score, board(r,4));
                    end
                end
            end
        end
    end
end


end