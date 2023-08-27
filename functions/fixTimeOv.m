% Fix Time-Overlaps
% Input: *Matrix of captrued frequenciies for each window
% Output: *Same Matrix - deleted duplicate clicks due to short sampling window
function mat = fixTimeOv(mat)
    for i=1:size(mat,2)-1
        if all(mat(:,i+1) == mat(:,i))
            mat(:,i+1) = 0;
        end
    end
end