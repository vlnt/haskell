 module Main where
 import System.Environment

 import List_vset
 
 main :: IO ()
 main = do
     args <- getArgs
     putStrLn ("Hello, " ++ show (List_vset.buildList 1 2 3) )
