recipes = 824501

scoreboard = [3, 7]

elf1_pos = 0
elf2_pos = 1
sum = scoreboard[elf1_pos] + scoreboard[elf2_pos]

new_recipe1 = sum / 10
new_recipe2 = sum % 10

scoreboard << new_recipe1 if new_recipe1 != 0
scoreboard << new_recipe2

while scoreboard.size < recipes + 10
  elf1_pos = (scoreboard[elf1_pos] + elf1_pos + 1) % scoreboard.size
  elf2_pos = (scoreboard[elf2_pos] + elf2_pos + 1) % scoreboard.size

  sum = scoreboard[elf1_pos] + scoreboard[elf2_pos]

  new_recipe1 = sum / 10
  new_recipe2 = sum % 10

  scoreboard << new_recipe1 if new_recipe1 != 0
  scoreboard << new_recipe2
end

puts scoreboard[recipes...recipes + 10].join
