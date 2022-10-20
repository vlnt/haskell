module Rem_v where

--ilog3 n function returns the number of times you can divide given
-- number by three (rounding down) before you get 0.

    vlog3 :: Integer -> Integer
    
    vlog3 1 = 1
    vlog3 2 = 2
    vlog3 n = 1 + vlog3 (div n 3)

    