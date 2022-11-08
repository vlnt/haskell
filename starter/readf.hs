import System.IO

main = do
    handle <- openFile "Safediv.hs" ReadMode
    contents <- hGetContents handle
    putStrLn ( "There are " ++ show(length(lines contents)) ++ " lines" )
    hClose handle