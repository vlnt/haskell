--Write a function lastButOne, that returns the element before the last

lastButOne :: [a] -> a

lastButOne a = head (drop 1 (reverse a) )
