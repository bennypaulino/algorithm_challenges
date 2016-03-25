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
    range = (1..distance).to_a
    ones = get_ones # ones = [[1, 1], [2, 3]]
    ones.each do |i|
      x = i.first
      y = i.last
      @array.each do |sub_arr|
        range.each do |value|
          @array[ x - value ][y] = 1
        end
      end
    end
  end

end

# 



image = Image.new([
  [0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0],
  [0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0]
])

image.blur!(3)

image.output_image