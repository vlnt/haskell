add :: Int -> ( Int -> Int )
add x y = x + y

main :: IO()
main = do 
         num1 <- getLine
         num2 <- getLine
         let j = read num1 :: Int
         let k = read num2 :: Int
         print (add j k)
