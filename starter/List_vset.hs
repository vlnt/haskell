module List_vset where

--Write a function lastButOne, that returns the element before the last
lastButOne :: [a] -> a
lastButOne a = head (drop 1 (reverse a) )

--Write a function that capitalize all words in the string
capitalizeS :: String -> String
capitalizeS = do
     unwords (map cap  (words s))
     where cap w = toUpper (head(take 1 w)):tail w

-- Use recursion and the : operator to build the list.
--
-- Examples:
--   buildList 1 5 2 ==> [1,1,1,1,1,2]
--   buildList 7 0 3 ==> [3]

buildList :: Int -> Int -> Int -> [Int]
buildList start count end = do
    if count > 0 
        then start:buildList start (count-1) end
    else (\x xs -> x:xs) end []
