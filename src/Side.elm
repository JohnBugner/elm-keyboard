module Side exposing
    ( Side (..)
    )

{-| Represents which side of the keyboard a key is on.

It's used by only the `shift`, `control`, `meta` (aka `windows` or `super`), and `alt` keys.

# Build
@docs Side
-}

{-| Represents which side of the keyboard a key is on.
-}

type Side
    = Left
    | Right
