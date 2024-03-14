
function c = redblue(m)
%REDBLUE    Shades of red and blue color map
%   REDBLUE(M), is an M-by-3 matrix that defines a colormap.
%   The colors begin with bright blue, range through shades of
%   blue to white, and then through shades of red to bright red.
%   REDBLUE, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(redblue)
%
%   See also HSV, GRAY, HOT, BONE, COPPER, PINK, FLAG, 
%   COLORMAP, RGBPLOT.

%   Adam Auton, 9th October 2009


if nargin < 1, m = size(get(gcf,'colormap'),1); end

if (mod(m,2) == 0)
    % From [0 0 1] to [1 1 1], then [1 1 1] to [1 0 0];
    m1 = m*0.5;
    r = (0:m1-1)'/max(m1-1,1);
    g = r;
    r = [r; ones(m1,1)];
    g = [g; flipud(g)];
    b = flipud(r);
else
    % From [0 0 1] to [1 1 1] to [1 0 0];
    m1 = floor(m*0.5);
    r = (0:m1-1)'/max(m1,1);
    g = r;
    r = [r; ones(m1+1,1)];
    g = [g; 1; flipud(g)];
    b = flipud(r);
end

c = [b g r]; 

end


%Instead of this function, I write a new function




%{
function cmap = redblue(m)

if nargin < 1
    m = size(get(gcf,'colormap'),1);
end

if m <= 0
    cmap = [];
    return;
end

if (mod(m,2) == 0)
    % From [0 0 1] to [1 1 1], then [1 1 1] to [1 0 0];
    m1 = m*0.5;
    r = (0:m1-1)'/max(m1-1,1);
    g = r;
    r = [r; ones(m1,1)];
    g = [g; flipud(g)];
    b = flipud(r);
else
    % From [0 0 1] to [1 1 1] to [1 0 0];
    m1 = floor(m*0.5);
    r = (0:m1-1)'/max(m1,1);
    g = r;
    r = [r; ones(m1+1,1)];
    g = [g; 1; flipud(g)];
    b = flipud(r);
end

% Map values outside of -60 to +60 range to black
%indices = r < 0 | r > 1;
%r(indices) = 0;
%g(indices) = 0;
%b(indices) = 0;

% Map values between -60 and +60 to red and blue
%{
midpoint = (60 + abs(-60)) / 2;
r(r >= 0 & r <= midpoint) = 0;
g(r >= 0 & r <= midpoint) = 0;
b(r >= 0 & r <= midpoint) = 1;
r(r >= -midpoint & r < 0) = 1;
g(r >= -midpoint & r < 0) = 0;
b(r >= -midpoint & r < 0) = 0;
%}
cmap = [r, g, b];

end

%}



%{
function cmap = redblue(m)

if nargin < 1, m = size(get(gcf,'colormap'),1); end

c = zeros(m, 3);
r = linspace(-60, 60, m);

% Map values between -60 and 0 to shades of blue
blue_indices = r >= -60 & r < 0;
c(blue_indices, :) = repmat(linspace(1,0,sum(blue_indices)), 3, 1)';

% Map values between 0 and +60 to shades of red
red_indices = r >= 0 & r <= 60;
c(red_indices, :) = repmat(linspace(0,1,sum(red_indices)), 3, 1)';

cmap = c;

end

%}

