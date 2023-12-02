MACHINE Puzzle21
DEFINITIONS
    "LibraryIO.def"; "LibraryRegex.def"; "LibraryStrings.def"
VARIABLES
    sum, i
INVARIANT
    {sum, i} <: NATURAL
INITIALISATION
    sum := 0; i := 0
OPERATIONS
    inc_sum(input) =
        ANY `id`, valid
        WHERE
            not(EOF("input.txt"))
            & input = STRING_SPLIT(READ_LINE("input.txt"), ";")
            & `id` = REGEX_SEARCH_STR(input(1), "[[:d:]]+")
            & valid = bool(!(game,r,g,b).((game : ran(input)
                    & r = IF REGEX_SEARCH_ALL(game, "[[:d:]]+ red") /= [] THEN STRING_TO_INT(REGEX_SEARCH_STR(REGEX_SEARCH_STR(game, "[[:d:]]+ red"), "[[:d:]]+")) ELSE 0 END
                    & g = IF REGEX_SEARCH_ALL(game, "[[:d:]]+ green") /= [] THEN STRING_TO_INT(REGEX_SEARCH_STR(REGEX_SEARCH_STR(game, "[[:d:]]+ green"), "[[:d:]]+")) ELSE 0 END
                    & b = IF REGEX_SEARCH_ALL(game, "[[:d:]]+ blue") /= [] THEN STRING_TO_INT(REGEX_SEARCH_STR(REGEX_SEARCH_STR(game, "[[:d:]]+ blue"), "[[:d:]]+")) ELSE 0 END)
                => r <= 12 & g <= 13 & b <= 14))
        THEN
            sum := sum + IF valid = TRUE THEN STRING_TO_INT(`id`) ELSE 0 END; i := i+1
        END
END
