lines = File.read_lines("input")

# | digit | number of segments |
# | ---   | ---                |
# | 1     | 2                  |
# | 4     | 4                  |
# | 7     | 3                  |
# | 8     | 7                  |

p lines.map(&.split(" | ").last).map(&.split).sum(&.count(&.size.in?(2, 4, 3, 7)))
# => 375
