MACHINE Puzzle31
DEFINITIONS
    "LibraryIO.def"; "LibraryStrings.def"; "SORT.def"
CONSTANTS
    complete_input, nr_chars, symb_chars
PROPERTIES
    complete_input = READ_FILE_AS_STRINGS("input.txt")
    & nr_chars = %l.(l : dom(complete_input) | { nr_char | nr_char : STRING_CHARS(complete_input(l)) |>> {"."} & STRING_IS_INT(prj2(nr_char)) } )
    & symb_chars = %l.(l : dom(complete_input) | { symb_char | symb_char : STRING_CHARS(complete_input(l)) |>> {"."} & not(STRING_IS_INT(prj2(symb_char))) } )
VARIABLES
    sum, line
INVARIANT
    {sum, line} <: NATURAL
INITIALISATION
    sum, line := 0, 1
OPERATIONS
    inc_sum =
        PRE
            line : dom(complete_input)
        THEN
            sum := sum + SIGMA(nrs).(nrs :
                { nr_seq1, nr | #nr_seq2.(
                    {nr_seq1, nr_seq2} <: nr_chars(line) & prj1(nr_seq1) <= prj1(nr_seq2)
                    & nr_chars(line)[{pred(prj1(nr_seq1)), succ(prj1(nr_seq2))}] = {}
                    & prj1(nr_seq1)..prj1(nr_seq2) <: dom(nr_chars(line))
                    & union(symb_chars[pred(line)..succ(line)])[pred(prj1(nr_seq1))..succ(prj1(nr_seq2))] /= {}
                    & nr = STRING_TO_INT(STRING_CONC(SQUASH(prj1(nr_seq1)..prj1(nr_seq2) <| nr_chars(line))))
                 )} | prj2(nrs));
            line := succ(line)
        END
END
