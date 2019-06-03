%export shrink

shrink :: [char] -> [char]
shrink s = mkset (sort s)
