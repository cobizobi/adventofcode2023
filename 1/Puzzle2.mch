MACHINE Puzzle2
DEFINITIONS
    "LibraryIO.def"; "LibraryStrings.def";
    replaceNumbers(String) == STRING_REPLACE(STRING_REPLACE(STRING_REPLACE(STRING_REPLACE(STRING_REPLACE(STRING_REPLACE(STRING_REPLACE(STRING_REPLACE(STRING_REPLACE(String,"nine","nine9nine"),"eight","eight8eight"),"seven","seven7seven"),"six","six6six"),"five","five5five"),"four","four4four"),"three","three3three"),"two","two2two"),"one","one1one")
VARIABLES
    sum
INVARIANT
    sum : NATURAL
INITIALISATION
    sum := 0
OPERATIONS
    inc_sum(input) =
        ANY convertedInput, chars, first_str, last_str
        WHERE            
            not(EOF("input.txt"))
            & input = READ_LINE("input.txt")
            & convertedInput = replaceNumbers(input)
            & chars = STRING_CHARS(convertedInput)
            & {first_str, last_str} <: chars
            & STRING_IS_INT(prj2(first_str)) & STRING_IS_INT(prj2(last_str))
            & prj1(first_str) <= prj1(last_str)
            & !prev_str.(prev_str : chars & prj1(prev_str) < prj1(first_str) => not(STRING_IS_INT(prj2(prev_str))))
            & !succ_str.(succ_str : chars & prj1(succ_str) > prj1(last_str) => not(STRING_IS_INT(prj2(succ_str))))
        THEN
            sum := sum + STRING_TO_INT(prj2(first_str)^prj2(last_str))
        END
END
