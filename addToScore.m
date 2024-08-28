function score = addToScore(score, tile)
%addToScore Adds score of new made tile to total score
%   Whatever tile that is passed in is the value of the neew tile made.
%   That tiles value is then added to the total score which is returned.


%index values for all the tile types
t4 = 4;
t8 = 5;
t16 = 6;
t32 = 7;
t64 = 8;
t128 = 9;
t256 = 10;
t512 = 11;
t1024 = 12;
t2048 = 13;
t4096 = 14;
t8192 = 15;

%adds tile value to score
if (tile == t4)
    score = score + 4;
elseif (tile == t8)
    score = score + 8;
elseif (tile == t16)
    score = score + 16;
elseif (tile == t32)
    score = score + 32;
elseif (tile == t64)
    score = score + 64;
elseif (tile == t128)
    score = score + 128;
elseif (tile == t256)
    score = score + 256;
elseif (tile == t512)
    score = score + 512;
elseif (tile == t1024)
    score = score + 1024;
elseif (tile == t2048)
    score = score + 2048;
elseif (tile == t4096)
    score = score + 4096;
elseif (tile == t8192)
    score = score + 8192;
else
    score = 0;


end