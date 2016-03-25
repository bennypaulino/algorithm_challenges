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
    ones.each do |vert,horiz| 
      @array.each do |sub_arr| 
        @array[vert-1][horiz] = 1 unless vert == 0
        @array[vert][horiz-1] = 1 unless horiz == 0
        @array[vert+1][horiz] = 1 unless vert >= (@array.length - 1)
        @array[vert][horiz+1] = 1 unless horiz >= (sub_arr.length - 1)
      end
    end
  end

end

# consider changing x and y to horiz & vert OR swapping them
# data and row are also good alt names



image = Image.new([
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 1],
  [1, 0, 0, 0]
])

image.blur!

image.output_image

