--- Haskell ---
-- swap.hs
swap :: a -> a -> (a, a)
swap a b = (b, a)

main = do
    let (a, b) = swap 5 3
    putStrLn $ "a = " ++ show a ++ ", b = " ++ show b
