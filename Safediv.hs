
data Expr = Val Int | Div Expr Expr

eval :: Expr -> Maybe Int

eval (Val n) = Just n

eval (Div x y) = case eval x of Nothing -> Nothing
                                Just x  -> case eval y of Nothing -> Nothing
                                                          Just y  -> safeDiv x y                                                        

e :: Expr

e = Div (Val 6) (Val 3)

safeDiv :: Int -> Int -> Maybe Int

safeDiv _ 0 = Nothing
safeDiv n m = Just (n `div` m)