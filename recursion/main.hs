    vlog3 :: Integer -> Integer
    vlog3 1 = 1 
    vlog3 2 = 1
    vlog3 n = 1 + vlog3 (div n 3)

    main :: IO()
    main = do 
         num <- getLine
         let n = read num :: Integer
         print ( vlog3 n )