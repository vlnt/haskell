module Rec_set where

import Utils

   --import Utils
   --ilog3 n function returns the number of times you can divide given
   -- number by three (rounding down) before you get 0.

vlog3 :: Integer -> Integer
    
vlog3 1 = 1
vlog3 2 = 2
vlog3 n = 1 + vlog3 (div n 3)   

    --function palindromify that chops a character
    -- off the front _and_ back of a string until the result is a
    -- palindrome.


palindromify :: String -> String

palindromify s = do
    let trunc = tail ( init s ) 
    if Utils.isPalindrome trunc == False
        then palindromify trunc
    else trunc
    