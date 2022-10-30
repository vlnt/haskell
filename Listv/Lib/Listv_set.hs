{-# OPTIONS_HADDOCK prune #-}

-- | >>> This module contains the list utility function set 

module Listv_set where

import Data.Char

-- | Returns the element before the last

lastButOne :: [a] -> a
lastButOne a = head (drop 1 (reverse a) )

----------------------------------------------------------------------------

-- | Capitalizes all words in the string
--
-- >  capitalizeS "capitalize all words in the string"
-- >  "Capitalize All Words In The String"

capitalizeS :: String -> String
capitalizeS s = do
     unwords (map cap  (words s))
     where cap w = toUpper (head(take 1 w)):tail w

-----------------------------------------------------------------------------

-- | Uses recursion and the : operator to build the list.
--
--  Examples:
--  
-- >  buildList 1 5 2 ==> [1,1,1,1,1,2]
-- >  buildList 7 0 3 ==> [3]
-- 

buildList :: Int -> Int -> Int -> [Int]
buildList start count end = do
    if count > 0 
        then start:buildList start (count-1) end
    else (\x xs -> x:xs) end []

-------------------------------------------------------------------------------

--   The function allEqual which 
-- | returns True if all
--   values in the list are equal.

allEqual :: Eq a => [a] -> Bool
allEqual [] = True
allEqual (_:[]) = True 
allEqual xs 
    | take 1 xs == take 1 (drop 1 xs)  = allEqual  (drop 1 xs) 
    | otherwise                        = (head $ tail xs) == head xs


--------------------------------------------------------------------------------

-- | countNothings implemented using foldr. 
--
--  Examples:
--
-- >  countNothings []  ==>  0
-- >  countNothings [Just 1, Nothing, Just 3, Nothing]  ==>  2

countNothings :: [Maybe a] -> Int

countHelper   :: Maybe a -> Int -> Int

countNothings xs = foldr countHelper 0 xs

countHelper Nothing y =  y + 1
countHelper (Just _) y = y

---------------------------------------------------------------------------------

-- | vMaximum finds max value with a fold.
--
--   Examples:
-- >  myMaximum []  ==>  0
-- >  myMaximum [1,3,2]  ==>  3

vMaximum  :: [Int] -> Int
maxHelper :: Int -> Int -> Int 
vMaximum [] = 0
vMaximum (x:xs) = foldr maxHelper x xs

maxHelper x y =
    if  x > y
        then x
    else y

-------------------------------------------------------------------------------------

-- | The function computes the average of a list of values of the Fractional
--   class.

averageF :: Fractional a => [a] -> a
averageF xs = do
    sum xs / x
      where x = fromIntegral (length xs) 

--------------------------------------------------------------------------------------

-- | The function incrementKey, that takes a list of
--   (key,value) pairs, and adds 1 to all the values that have the given key.
--
--   The function is generic and handle all compatible types,
--   see the examples.
--
--   Examples:
--
-- >   incrementKey True 1 [(True,1),(False,3),(True,4)] ==> [(True,2),(False,3),(True,5)]
-- >   incrementKey 'a' 3 [('a',3.4)] ==> [('a',6.4)]

incrementKey :: Eq key => Num v => key -> [(key,v)] -> [(key,v)]
incrementKey _ [] = []
incrementKey key (x:xs)  =
        if fst x == key
            then (key, snd x + 1):incrementKey key xs
        else x:incrementKey key xs

--------------------------------------------------------------------------------------------

-- | The generic function which returns True if all
--   values in a list are different.
--
--   Examples:
--
-- >   distinct [] ==> True
-- >   distinct [1,1,2] ==> False
-- >   distinct [1,2] ==> True

distinct :: Eq a => [a] -> Bool
distinct [] = True
distinct (_:[]) = True
distinct (x:xs) = do
    if elem x xs
        then False
    else distinct xs