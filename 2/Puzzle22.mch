MACHINE Puzzle22
DEFINITIONS
    "LibraryIO.def"; "LibraryRegex.def"; "LibraryStrings.def";
    filterNumbers(Seq) == dom({ nr, str | str : ran(Seq) & #nr_str.(nr_str = REGEX_SEARCH_STR(str, "[[:d:]]+") & nr = STRING_TO_INT(nr_str)) })
VARIABLES
    sum
INVARIANT
    sum : NATURAL
INITIALISATION
    sum := 0
OPERATIONS
    inc_sum(input) =
        ANY red, green, blue
        WHERE
            not(EOF("input.txt"))
            & input = READ_LINE("input.txt")
            & red = max(filterNumbers(REGEX_SEARCH_ALL(input, "[[:d:]]+ red")))
            & green = max(filterNumbers(REGEX_SEARCH_ALL(input, "[[:d:]]+ green")))
            & blue = max(filterNumbers(REGEX_SEARCH_ALL(input, "[[:d:]]+ blue")))
        THEN
            sum := sum + (red * green * blue)
        END
END
