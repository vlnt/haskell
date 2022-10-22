    module Main where

    import Rec_set
    -- vlog3 :: Integer -> Integer
    -- vlog3 1 = 1 
    -- vlog3 2 = 1
    -- vlog3 n = 1 + vlog3 (div n 3)

    -- processInput :: String -> IO ()
    -- processInput = do
    --         line <- getLine
    --         read $ line :: String
        

    

    loop :: IO ()
    loop = do
        line <- getLine
        print(Rec_set.palindromify line)
        case line of
            "quit"    -> return ()
            otherwise -> loop
        --  num <- getLine
        --  let n = read num :: Integer
        --  print ( Rec_set.v  log3 n )

   
    main = do
        loop
        -- line <- getLine
        -- print ( Rec_set.palindromify line )
        --Rec_set.palindromify line
        --  GHC automatically adds Rem_v for compiling and linking since is specified Main.hs on the command line.
        --  Since if also specify Rem_v.o, this causes Rem_v.o to be linked twice, resulting in many duplicate definitions.
        --  Use just 
        --     $~ ghc -o ilog3 main.hs