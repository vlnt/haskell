type Grid = Matrix Value

type Matrix a = [Row a]

type Row a = [a]

type Value = [[Char]]

rows :: Matrix a -> [Row a]
rows = id

cols :: Matrix a -> [Row a]
cols m = transpose m
--Property: cols . cols = id

-- boxs :: Matrix a -> [Row a]
-- boxs m = 

valid :: Grid -> Bool
valid g = allm nodups (rows g) &&
          allm nodups (cols g) -- &&
         -- allm nodups (boxs g)

allm :: (a -> Bool) -> [a] -> Bool
allm p xs = and [p x | x <- xs]

nodups :: Eq a => [a] -> Bool
nodups [] = True
nodups (x:xs) = not(elem x xs) && nodups xs

main = do 
    nodups [2,4,5,7,1,9]