% Phone Decoder
% Input: *Matrix of DTMF values over sampling windows
% Output: *Phone number
function phone = decode_phone(hits)
    hits = hits.*[1;4;7;100;0;1;2];
    phone = sum(hits);
    phone(phone == 101) = 0;
end