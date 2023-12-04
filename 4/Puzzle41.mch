MACHINE Puzzle41
DEFINITIONS
    "LibraryIO.def"; "LibraryStrings.def"
VARIABLES
    sum, i
INVARIANT
    {sum, i} <: NATURAL
INITIALISATION
    sum := 0; i := 0
OPERATIONS
    inc_sum(input) =
        ANY win, numbers, lucky
        WHERE
            not(EOF("input.txt"))
            & input = READ_LINE("input.txt")
            & win = STRING_SPLIT(STRING_SPLIT(STRING_SPLIT(input, "|")(1), ":")(2), " ") |>> {""}
            & numbers = STRING_SPLIT(STRING_SPLIT(input, "|")(2), " ") |>> {""}
            & lucky = { pos, l | l : ran(win) & pos |-> l : numbers }
        THEN
            sum := sum + IF card(lucky) > 0 THEN 2**(card(lucky)-1) ELSE 0 END; i := i + 1
        END
END
