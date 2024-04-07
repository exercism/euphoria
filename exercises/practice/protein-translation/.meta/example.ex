public function proteins(sequence strand)
    sequence result = {}

    while length(strand) >= 3 do
        sequence rna = strand[1..3]
        strand = strand[4..$]

        sequence protein = rna_to_protein(rna)
        switch protein do
            case "ERR" then
                return {}
            case "STOP" then
                return result
            case else
                result = append(result, protein)
        end switch
    end while

    if length(strand) > 0 then
        -- invalid rna
        return {}
    end if

    return result
end function

function rna_to_protein(sequence rna)
    switch rna do
        case "AUG"                      then return "Methionine"
        case "UUU", "UUC"               then return "Phenylalanine"
        case "UUA", "UUG"               then return "Leucine"
        case "UCU", "UCC", "UCA", "UCG" then return "Serine"
        case "UAU", "UAC"               then return "Tyrosine"
        case "UGU", "UGC"               then return "Cysteine"
        case "UGG"                      then return "Tryptophan"
        case "UAA", "UAG", "UGA"        then return "STOP"
        case else                            return "ERR"
    end switch
end function
