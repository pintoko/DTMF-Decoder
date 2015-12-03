% Copyright (C) 2015 Tinotenda Chemvura
% 
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

% -*- texinfo -*- 
% @deftypefn {Function File} {@var{retval} =} makeFrames (@var{input1}, @var{input2})
%
% @seealso{}
% @end deftypefn

%Author: Tinotenda Chemvura @tino1b2be
%Created: 2015-12-02

function frames = makeFrames (data, frameSize)
	%This function makes frames each of size "frame size" and returns
    %a matrix with each of the columns as a seperate frame for processing
    
    % must preallocate memory for the output
    numFrames = floor(length(data)/frameSize);
    frames = zeros(frameSize,numFrames);   % number of frames (columns)
    frames(:,1) = data(1:frameSize);                         % slice off the first frame
    
    col = 2;
    for i= frameSize+1 : frameSize : length(data)
        new =  data(i:i+frameSize-1);
        frames(:,col) = new;
        if (col == numFrames) % break when all the frames have been created
            break;
        end
        col = col+1;
    end % end of for loop
end % end of function
