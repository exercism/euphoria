include std/math.e
include std/rand.e
include std/sort.e

public function modifier(integer score)
  return floor((score - 10) / 2)
end function

public function ability()
  sequence rolls = sample({1, 2, 3, 4, 5, 6}, 4, 0)
  rolls = sort(rolls, ASCENDING)
  rolls = tail(rolls, 3)
  return sum(rolls)
end function

public function new_character()
  integer constitution = ability()

  return {
      ability(),
      ability(),
      constitution,
      ability(),
      ability(),
      ability(),
      10 + modifier(constitution)
  }
end function

public function get_strength(sequence character)
  return character[1]
end function

public function get_dexterity(sequence character)
  return character[2]
end function

public function get_constitution(sequence character)
  return character[3]
end function

public function get_intelligence(sequence character)
  return character[4]
end function

public function get_wisdom(sequence character)
  return character[5]
end function

public function get_charisma(sequence character)
  return character[6]
end function

public function get_hitpoints(sequence character)
  return character[7]
end function
