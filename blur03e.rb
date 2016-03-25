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
    ones.each do | sub_arr, cell |
      @array.each do |y,x|
        if x + y <= distance 
          @array[y][x] = 1
        end
      end
    end
  end

end

# use the manhattan distance to transform everything that is =< distance



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