import Data.Time.Clock.POSIX

main :: IO ()
--putStrLn "Hello from Haskell!"
main = getPOSIXTime >>= print

