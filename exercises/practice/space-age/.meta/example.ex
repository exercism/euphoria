include std/map.e

integer EARTH_SECONDS = 31557600

map ORBITAL_RATIOS = new()
put(ORBITAL_RATIOS, "Earth", 1.0)
put(ORBITAL_RATIOS, "Mercury", 0.2408467)
put(ORBITAL_RATIOS, "Venus", 0.61519726)
put(ORBITAL_RATIOS, "Mars", 1.8808158)
put(ORBITAL_RATIOS, "Jupiter", 11.862615)
put(ORBITAL_RATIOS, "Saturn", 29.447498)
put(ORBITAL_RATIOS, "Uranus", 84.016846)
put(ORBITAL_RATIOS, "Neptune", 164.79132)


public function ageOn(sequence planet, integer seconds) 
  if not has(ORBITAL_RATIOS, planet) then
    return 0
  end if

  return seconds / EARTH_SECONDS / get(ORBITAL_RATIOS, planet)
end function
