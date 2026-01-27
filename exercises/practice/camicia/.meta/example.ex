
include std/map.e
include std/sequence.e

function to_value(sequence card, object user_data = {})
    atom c = card[1]
    if c = 'J' then return 1 end if
    if c = 'Q' then return 2 end if
    if c = 'K' then return 3 end if
    if c = 'A' then return 4 end if
    return 0
end function

public function simulateGame(sequence playerA, sequence playerB)
    sequence handA = apply(playerA, routine_id("to_value"))
    sequence handB = apply(playerB, routine_id("to_value"))

    sequence pile = {}
    map seen = new()
    
    integer tricks = 0
    integer cards_played = 0
    integer current_debt = 0
    
    atom turn = 'A'
    
    while 1 do
        if length(pile) = 0 then
            sequence state_key = {handA, handB, turn}
            if map:has(seen, state_key) then
                return { {"status", "loop"}, {"cards", cards_played}, {"tricks", tricks} }
            end if
            map:put(seen, state_key, 1)
        end if
        
        sequence active_hand = handA
        if turn = 'B' then
            active_hand = handB
        end if
        
        if length(active_hand) = 0 then
            integer extra_trick = 0
            if length(pile) > 0 then
                extra_trick = 1
            end if
            return { {"status", "finished"}, {"cards", cards_played}, {"tricks", tricks + extra_trick} }
        end if
        
        integer card_val = active_hand[1]
        active_hand = remove(active_hand, 1)
        
        if turn = 'A' then
            handA = active_hand
        else
            handB = active_hand
        end if
        
        pile = append(pile, card_val)
        cards_played += 1
        
        if card_val > 0 then
            current_debt = card_val
            if turn = 'A' then
                turn = 'B'
            else
                turn = 'A'
            end if
        else
            if current_debt > 0 then
                current_debt -= 1
                if current_debt = 0 then
                    if turn = 'A' then
                        handB &= pile
                    else
                        handA &= pile
                    end if
                    pile = {}
                    tricks += 1
                    current_debt = 0
                    
                    if length(handA) = 0 or length(handB) = 0 then
                        return { {"status", "finished"}, {"cards", cards_played}, {"tricks", tricks} }
                    end if
                    
                    if turn = 'A' then
                        turn = 'B'
                    else
                        turn = 'A'
                    end if
                end if
            else
                if turn = 'A' then 
                    turn = 'B'
                else
                    turn = 'A'
                end if
            end if
        end if
    end while
    
    return {}
end function
