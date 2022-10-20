    module Main(main) where

    import Rem_v
    -- vlog3 :: Integer -> Integer
    -- vlog3 1 = 1 
    -- vlog3 2 = 1
    -- vlog3 n = 1 + vlog3 (div n 3)

   -- main :: IO()
    main = do 
         num <- getLine
         let n = read num :: Integer
         print ( Rem_v.vlog3 n )

        --  GHC automatically adds Rem_v for compiling and linking since you specified Main.hs on the command line.
        --  Since you also specified Rem_v.o, this causes Rem_v.o to be linked twice, resulting in many duplicate definitions.
        --  Use just 
        --     $~ ghc -o ilog3 main.hs