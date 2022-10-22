module Rec_set where

--ilog3 n function returns the number of times you can divide given
-- number by three (rounding down) before you get 0.

    vlog3 :: Integer -> Integer
    
    vlog3 1 = 1
    vlog3 2 = 2
    vlog3 n = 1 + vlog3 (div n 3)   

    isPalindrome :: String -> Bool
    isPalindrome str = 
        if str == reverse str
            then True
        else False

    palindromify :: String -> String

    palindromify s = 
        let trunc = tail ( init s ) 
        in 
            if isPalindrome trunc == False
            then palindromify trunc
        else trunc
    