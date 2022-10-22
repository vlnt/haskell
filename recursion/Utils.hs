module Utils where

    isPalindrome :: String -> Bool
    isPalindrome str = 
        if str == reverse str
            then True
        else False