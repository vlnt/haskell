    module Main where

    import Rec_set

    loop :: IO ()
    loop = do
        line <- getLine
        print(Rec_set.palindromify line)
        case line of
            "quit"    -> return ()
            otherwise -> loop
        --  num <- getLine
        --  let n = read num :: Integer
        --  print ( Rec_set.vlog3 n )

   
    main = do
        loop
        --  GHC automatically adds Rem_v for compiling and linking since is specified Main.hs on the command line.
        --  Since if also specify Rem_v.o, this causes Rem_v.o to be linked twice, resulting in many duplicate definitions.
        --  Use just 
        --     $~ ghc -o ilog3 main.hs