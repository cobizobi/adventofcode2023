MACHINE Puzzle1
DEFINITIONS
    "LibraryIO.def"; "LibraryStrings.def"
VARIABLES
    sum
INVARIANT
    sum : NATURAL
INITIALISATION
    sum := 0
OPERATIONS
    inc_sum(input) =
        ANY chars, first_str, last_str
        WHERE            
            not(EOF("input.txt"))
            & input = READ_LINE("input.txt")
            & chars = STRING_CHARS(input)
            & {first_str, last_str} <: chars
            & STRING_IS_INT(prj2(first_str)) & STRING_IS_INT(prj2(last_str))
            & prj1(first_str) <= prj1(last_str)
            & !prev_str.(prev_str : chars & prj1(prev_str) < prj1(first_str) => not(STRING_IS_INT(prj2(prev_str))))
            & !succ_str.(succ_str : chars & prj1(succ_str) > prj1(last_str) => not(STRING_IS_INT(prj2(succ_str))))
        THEN
            sum := sum + STRING_TO_INT(prj2(first_str)^prj2(last_str))
        END
END
