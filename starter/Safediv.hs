module Main where
import Data.Maybe


data Expr = Val Int | Div Expr Expr

eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Div x y) = do n <- eval x
                    m <- eval y 
                    safeDiv n m
    
    
                        --   eval x >>= (f n -> 
                        --     eval y >>= ( f m ->
                        --     safeDiv n m ))                              --pure safeDiv (*) eval x (*) eval y 





-- eval (Div x y) = case eval x of Nothing -> Nothing
--                                 Just x  -> case eval y of Nothing -> Nothing
--                                                           Just y  -> safeDiv x y                                                        

e :: Expr

e = Div (Val 6) (Val 3)

safeDiv :: Int -> Int -> Maybe Int

safeDiv _ 0 = Nothing
safeDiv n m = Just (n `div` m)


main :: IO () 
main = 
    return (safeDiv 18 6) >>= print