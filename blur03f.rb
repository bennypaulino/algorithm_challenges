class Image

  def initialize (array)
    @array = array
  end

  def output_image
    @array.each do |subarray|
      puts subarray.join
    end
  end

  def get_ones # helper method
    new_array = []
    @array.each_with_index do |subarray, sub_index|
      subarray.each_with_index do |cell, cell_index|
        if cell == 1
          new_array << [sub_index, cell_index]
        end
      end
    end
    new_array
  end

  def blur!(distance)
    ones = get_ones # [ [4, 3], [11, 8] ]
    ones.each do | row, index |
      @array.each do |y,x|
        if row - distance == 0
          @array[y] = 1
        end
      end
    end
  end

end

# use the manhattan distance to transform everything that is < or > distance



image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1],
])

image.blur!(3)

image.output_image


# The indices for the number 1 are: [ [4, 3], [11, 8] ]
# ...... this can be expressed as [row][index]

# How far is [y][x] from [row][index] ?
# How can you use the argument of distance?

# you are interested in transforming [8][8], it is 3 steps away in the y-axis
# [y - distance]

# what about [1][3]? This should be transformed as well...

# if row == y && y < distance || y > distance