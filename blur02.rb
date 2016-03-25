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
    @array.each_with_index do |subarray, arr_index|
      subarray.each_with_index do |cell, sub_index|
        if cell == 1
          new_array << [arr_index, sub_index]
        end
      end
    end
    new_array
  end

  def blur!
    ones = get_ones.last # ones = [1,1] this was previously get_ones.first
    x = ones.first
    y = ones.last
    @array[x-1][y] = 1
    @array[x][y-1] = 1
    @array[x][y+1] = 1
    @array[x+1][y] = 1
  end

end

# how do you express a condition so that a 1 doesn't appear out of bounds?
# can you use array.length and use that as a boundary?
# if the number is the last one in the sub-array, then DO NOT put a number after it

# get_ones = [[1, 1], [2, 3]]






image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.blur!

image.output_image




# The indices for the number 1 are: 1,1 AND 2,3
# maybe this can be expressed as x,y

# I'm interested in 0,1 ; 1,0 ; 1,2 ; 2,1 ; ALSO 1,3 ; 2,2 ; and 3,3
# I'm interested in those particular index values because they are adjacent to the #1 and I want to transform those 0s into 1s
# How can I translate that into an algorithm?



# Loop over each row array.
