% Displays phone as a string
% Input: *array of phone numbers
function dispPhone(phone)
    try
        if any(ismember([100, 102], phone))
            number = replace(num2str(phone),{'100', '102',' '},{'*', '#',''});
            disp(strcat("The phone is: ", number));
        elseif (phone(2) == 5 || phone(2) == 7)
            disp(strcat("The phone is: ", num2str(phone(1:3),"%d"),"-", num2str(phone(4:end),"%d")));
        else
            disp(strcat("The phone is: ", num2str(phone(1:2),"%d"),"-", num2str(phone(3:end),"%d")));
        end
    catch
        disp('Failed!')
    end
end