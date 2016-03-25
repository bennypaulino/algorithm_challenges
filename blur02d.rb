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

  def blur!
    ones = get_ones # ones = [[1, 1], [2, 3]]
    ones.each do |i|
      x = i.first
      y = i.last
      @array.each do |sub_arr| 
        @array[x-1][y] = 1
        @array[x][y-1] = 1
        @array[x+1][y] = 1
        unless y != sub_arr.last
          @array[x][y+1] = 1  
        end
      end
    end
  end

end

# how do you express a condition so that a 1 doesn't appear out of bounds
# execute the code UNLESS sub-array.length is exceeded



image = Image.new([
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 1],
  [1, 0, 0, 0]
])

image.blur!

image.output_image

