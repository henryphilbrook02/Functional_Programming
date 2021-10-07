-module(CaesarCipher).
-export([encrypt/2, decrypt/2, solve/4, main/0]).

%Needed to shift the characters
shift(Char, Num) when (Char >= $A) and (Char =< $Z) ->
    Temp = Char + (Num rem 26),
    if Temp > 90 ->
        Ans = Temp - 26;
    true ->
        Ans = Temp
    end,
    Ans;
shift(Char, _Key) -> %goes here if condition isn't met
    Char.

encrypt(Text, Shift) ->
    Upcase = string:uppercase(Text),
    Cipher = lists:map(fun(Char) -> shift(Char, Shift) end, Upcase),
    io:fwrite("~s~n", [Cipher]).

decrypt(Text, Shift) ->
    encrypt(Text, 26-Shift).
    
solve(Text, Max, N, Inc) when N =< Max ->
    io:fwrite("Caesar "),
    io:fwrite("~w",[N]),
    io:fwrite(": "),
    encrypt(Text, N),
    [Inc|solve(Text, Max, N+1, Inc)];
solve(Text, Max, N, Inc) ->
    [].

main() ->
    encrypt("This is a test string from Alan", 8),
    decrypt("BPQA QA I BMAB ABZQVO NZWU ITIV", 8),
    solve("HAL", 26, 0, 1).
