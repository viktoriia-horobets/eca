cells = 41
height = 1000
rule = 2

res =  sprintf("%08b", rule)
binary_map = res.to_s.reverse.chars.map(&:to_i)
first_row = gets.chomp.to_s.chars.map(&:to_i)

grid = []

i = 0
row = []
while i < cells
  row << (first_row.include?(i) ? 1 : 0)
  i += 1
end
grid << row

def print_grid(grid)
  system "clear"
  grid.each do |row|
    row.each do |el|
      print "#{el} "
    end
    puts
  end
  sleep 0.1
end

i = 0
while i < height
  j = 0
  row = []
  while j < cells
    left = (j - 1) % cells
    middle = j
    right = (j + 1) % cells
    coord = 4 * grid[i][left]  + 2 * grid[i][middle] + grid[i][right]
    row[j] = binary_map[coord]

    j += 1
  end
  grid << row
  
  print_grid(grid)
  i += 1
end
