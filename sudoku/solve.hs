solve :: Grid -> [Grid]

solve g = filter valid . collapse . choices g

type Choices  = [Value]

choices :: Grid -> Matrix Choices

choices g = map (map choice) g
        where 
            choice v = if v = "."
                            then ["1".."9"]
                        else [v] 


collapse :: Matrix [a] -> [Matrix a]
collapse m = cp  (map cp m)