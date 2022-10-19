module Main where

     vlog3 :: Integer -> Integer
    
    vlog3 n = 1 + vlog3 (div n 3)

    main :: IO()
    main = do 
         num <- getLine
         let n = read num :: Integer
         print ( Demo_v.vlog3 n )