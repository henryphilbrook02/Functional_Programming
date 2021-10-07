module Main (encrypt, decrypt, solve, main) where

import Data.Char

encrypt, decrypt :: (Integral a) => a -> String -> String
encrypt k = map f
    where f c = case generalCategory c of
        LowercaseLetter -> shiftChar 'a' k c
        UppercaseLetter -> shiftChar 'A' k c
        _ -> c

decrypt k = encrypt (-k)

solve :: Integer -> Integer -> String -> IO ()
solve s e t = if s < e
    then do
        putStrLn("Caesar " ++ show s ++ ": " ++ show (encrypt s t))
        temp <- return (s+1)
        solve temp e t
    else putStrLn("Caesar " ++ show s ++ ": " ++ show (encrypt s t))
    
shiftChar :: (Integral a) => Char -> a -> Char -> Char
shiftChar b o c = chr $ fromIntegral (b' + (c' - b' + o) `mod` 26)
    where b' = fromIntegral $ ord b
        c' = fromIntegral $ ord c

main = do
    print (encrypt 8 "This is a test string from Alan")
    print (decrypt 8 "Bpqa qa i bmab abzqvo nzwu Itiv")
    solve 0 26 "HAL"

Output: (different initial encrypt because it’s no capitalized)