% Choosing file with an input from the user
% Output: *name of recording as a string
function recordName = chooseFile
    recList = dir(fullfile('recordings','*.wav')); 
    numRec = numel(recList);
    recsName = {recList.name};
    
    disp('Available recordings:')
    for row = 1:numRec
        disp(['  ',num2str(row) ': ' recsName{row}]);
    end

    recordNum = input(['Select a recording between 1 and ' num2str(numRec) ': ']);
    recordNum = max(1, min(numRec, round(recordNum)));
    recordName = recsName{recordNum};
    disp(['Selected recording name: "', recordName '"']);
end