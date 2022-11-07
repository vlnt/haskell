import System.IO

main = do
    handle <- openFile "main.hs" ReadMode
    contents <- hGetContents handle
    putStrLn ( "There are " ++ show(length(lines contents)) ++ " words" )
    hClose handle