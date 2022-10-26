module List_vset where

--Write a function lastButOne, that returns the element before the last
lastButOne :: [a] -> a
lastButOne a = head (drop 1 (reverse a) )

--Write a function that capitalize all words in the string
capitalizeS :: String -> String
capitalizeS = do
     unwords (map cap  (words s))
     where cap w = toUpper (head(take 1 w)):tail w
