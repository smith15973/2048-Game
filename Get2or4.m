function tileValue = Get2or4()
% Gives the index value for a 2 or 4 tile
%   Reports the index vallue of either a 2 or 4 tile for when after a
%   player does a move. There is a 90% chance of it being a 2 and a 10%
%   chance of it being a 4.

%generates random number between 1 and 10
rng("shuffle");
randomChance = randi(10);

if randomChance == 10
    %would be a 4 tile
    tileValue = 4;
else
    %would be a 2 tile
    tileValue = 3;
end