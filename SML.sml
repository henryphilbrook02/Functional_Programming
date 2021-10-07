fun shiftChar (ch : char, shftAmt : int) : char =
    case ch of #" " => #" "
    | _ => c (ord (Char.toUpper ch) + (shftAmt mod 26));
    
fun encrypt (text : string, shftAmt : int) : string =
    String.implode(map (fn x => shiftChar (x, shftAmt)) (String.explode(text)));
    
fun decrypt (text : string, shftAmt : int) : string =
    encrypt (text, 26 - shftAmt);
    
fun solve (text : string, maxShftAmt : int) =
    map (fn x => print("Caesar "^(Int.toString x)^": "^encrypt(text, x)^"\n"))
(List.tabulate(maxShftAmt, fn x => x + 1));

print(encrypt("This is a test string from Alan", 8));
print(decrypt("BPQA QA I BMAB ABZQVO NZWU ITIV", 8));
solve("HAl", 26);