%export body feet

||Extension to head and tail

body :: [*] -> [*]
body l=take (#l-1) l

feet :: [*] -> [*]
feet l=drop (#l-1) l
