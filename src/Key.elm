module Key exposing
    ( Key (..)
    , fromString
    , decoder
    )

{-| Represents a physical *key*. Note that this is *not* the same as which *character* is produced by a key (or combination of keys). This is a very important distinction to make to ensure that controls still work as intended no matter what keyboard layout the user is using.

For example, in a game where the player moves the character around with the `W`, `A`, `S`, and `D` keys, you'd want the controls to work no matter what keyboard layout the player is using. On a qwerty keyboard, these keys produce the characters 'w', 'a', 's', and 'd', but on a dvorak keyboard, these keys produce the characters ',', 'a', 'o', and 'e'. Therefore, binding the controls to the *characters* produced by the keys instead of the physical *keys* themselves would make the controls effectively unusable for a player using a dvorak keyboard (or any other keyboard, for that matter).

# Build
@docs Key, fromString

# Decode
@docs decoder
-}

import Side

import Json.Decode

{-| Represents a key.

Note that keys that don't have a dedicated constructor can still be used by using the `Other` constructor, as long as you know what string `event.code` produces.
-}
type Key
    -- Row 1
    = Escape
    | F1
    | F2
    | F3
    | F4
    | F5
    | F6
    | F7
    | F8
    | F9
    | F10
    | F11
    | F12

    -- Row 2
    | Backquote
    | Digit1
    | Digit2
    | Digit3
    | Digit4
    | Digit5
    | Digit6
    | Digit7
    | Digit8
    | Digit9
    | Digit0
    | Minus
    | Equal
    | Backspace

    -- Row 3
    | Tab
    | Q
    | W
    | E
    | R
    | T
    | Y
    | U
    | I
    | O
    | P
    | BracketLeft
    | BracketRight
    | Backslash

    -- Row 4
    | CapsLock
    | A
    | S
    | D
    | F
    | G
    | H
    | J
    | K
    | L
    | Semicolon
    | Quote
    | Enter

    -- Row 5
    | Shift Side.Side
    --| ShiftLeft
    | IntlBackslash
    | Z
    | X
    | C
    | V
    | B
    | N
    | M
    | Comma
    | Period
    | Slash
    --| ShiftRight

    -- Row 6
    | Control Side.Side
    | Meta Side.Side
    | Alt Side.Side
    --| ControlLeft
    --| MetaLeft
    --| AltLeft
    | Space
    --| AltRight
    --| MetaRight
    | ContextMenu
    --| ControlRight

    -- Home Bunch
    | PrintScreen
    | ScrollLock
    | Pause
    | Insert
    | Home
    | PageUp
    | Delete
    | End
    | PageDown

    -- Arrow Bunch
    | ArrowUp
    | ArrowLeft
    | ArrowDown
    | ArrowRight

    -- Numpad Bunch
    | NumLock
    | NumpadDivide
    | NumpadMultiply
    | NumpadSubtract
    | Numpad7
    | Numpad8
    | Numpad9
    | NumpadAdd
    | Numpad4
    | Numpad5
    | Numpad6
    | Numpad1
    | Numpad2
    | Numpad3
    | NumpadEnter
    | Numpad0
    | NumpadDecimal

    -- Other/Undefined
    | Other String

{-| Converts a string to a key.
-}
fromString : String -> Key
fromString s =
    case s of
        "Escape" -> Escape
        "F1" -> F1
        "F2" -> F2
        "F3" -> F3
        "F4" -> F4
        "F5" -> F5
        "F6" -> F6
        "F7" -> F7
        "F8" -> F8
        "F9" -> F9
        "F10" -> F10
        "F11" -> F11
        "F12" -> F12

        -- Row 2
        "Backquote" -> Backquote
        "Digit1" -> Digit1
        "Digit2" -> Digit2
        "Digit3" -> Digit3
        "Digit4" -> Digit4
        "Digit5" -> Digit5
        "Digit6" -> Digit6
        "Digit7" -> Digit7
        "Digit8" -> Digit8
        "Digit9" -> Digit9
        "Digit0" -> Digit0
        "Minus" -> Minus
        "Equal" -> Equal
        "Backspace" -> Backspace

        -- Row 3
        "Tab" -> Tab
        "KeyQ" -> Q
        "KeyW" -> W
        "KeyE" -> E
        "KeyR" -> R
        "KeyT" -> T
        "KeyY" -> Y
        "KeyU" -> U
        "KeyI" -> I
        "KeyO" -> O
        "KeyP" -> P
        "BracketLeft" -> BracketLeft
        "BracketRight" -> BracketRight
        "Backslash" -> Backslash

        -- Row 4
        "CapsLock" -> CapsLock
        "KeyA" -> A
        "KeyS" -> S
        "KeyD" -> D
        "KeyF" -> F
        "KeyG" -> G
        "KeyH" -> H
        "KeyJ" -> J
        "KeyK" -> K
        "KeyL" -> L
        "Semicolon" -> Semicolon
        "Quote" -> Quote
        "Enter" -> Enter

        -- Row 5
        "ShiftLeft" -> Shift Side.Left
        "IntlBackslash" -> IntlBackslash
        "KeyZ" -> Z
        "KeyX" -> X
        "KeyC" -> C
        "KeyV" -> V
        "KeyB" -> B
        "KeyN" -> N
        "KeyM" -> M
        "Comma" -> Comma
        "Period" -> Period
        "Slash" -> Slash
        "ShiftRight" -> Shift Side.Right

        -- Row 6
        "ControlLeft" -> Control Side.Left
        "MetaLeft" -> Meta Side.Left
        "AltLeft" -> Alt Side.Left
        "Space" -> Space
        "AltRight" -> Alt Side.Right
        "MetaRight" -> Meta Side.Right
        "ContextMenu" -> ContextMenu
        "ControlRight" -> Control Side.Right

        -- Home Bunch
        "PrintScreen" -> PrintScreen
        "ScrollLock" -> ScrollLock
        "Pause" -> Pause
        "Insert" -> Insert
        "Home" -> Home
        "PageUp" -> PageUp
        "Delete" -> Delete
        "End" -> End
        "PageDown" -> PageDown

        -- Arrow Bunch
        "ArrowUp" -> ArrowUp
        "ArrowLeft" -> ArrowLeft
        "ArrowDown" -> ArrowDown
        "ArrowRight" -> ArrowRight

        -- Numpad Bunch
        "NumLock" -> NumLock
        "NumpadDivide" -> NumpadDivide
        "NumpadMultiply" -> NumpadMultiply
        "NumpadSubtract" -> NumpadSubtract
        "Numpad7" -> Numpad7
        "Numpad8" -> Numpad8
        "Numpad9" -> Numpad9
        "NumpadAdd" -> NumpadAdd
        "Numpad4" -> Numpad4
        "Numpad5" -> Numpad5
        "Numpad6" -> Numpad6
        "Numpad1" -> Numpad1
        "Numpad2" -> Numpad2
        "Numpad3" -> Numpad3
        "NumpadEnter" -> NumpadEnter
        "Numpad0" -> Numpad0
        "NumpadDecimal" -> NumpadDecimal

        -- Other/Undefined
        _ -> Other s

{-| Decodes which key triggered an event.
-}
decoder : Json.Decode.Decoder Key
decoder =
    Json.Decode.map fromString <|
    Json.Decode.field "code" Json.Decode.string
