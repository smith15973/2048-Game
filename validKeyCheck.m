function validInput = validKeyCheck(input)
%validKeyCheck Checks if a valid key was clicked
%   a valid input is considered that to be either any of the arrow keys or
%   wasd because those are the typical gaming keys
validInput = false;

if (strcmp(input, 'w') || strcmp(input, 'uparrow') || ...
        strcmp(input, 'a') || strcmp(input, 'leftarrow') || ...
        strcmp(input, 's') || strcmp(input, 'downarrow') || ...
        strcmp(input, 'd') || strcmp(input, 'rightarrow'))
    validInput = true;
end
end