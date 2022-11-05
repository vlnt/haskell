module LR where

    import Data.List


    --f x = ax+c // y = mx + b
    -- m = (x1 - x2)/(y1 - y2) // b = y - mx

    lineGradient :: (Fractional a) => (a, a) -> (a, a) -> a
    lineGradient p1 p2 = do
        (fst p1 - fst p2)/(snd p1 - snd p2)

    lineOffset :: (Fractional a) => (a, a) -> a -> a 
    lineOffset p s = do 
        (snd p) / (fst p * s)

    arMean :: Fractional a => [a] -> a
    arMean ar = sum ar / fromIntegral (length ar)