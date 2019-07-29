class Image


    def initialize(array)
        @image_blur_array = array
    end
    
        
    def output_image
        @image_blur_array.each do |row|
            puts row.join
        end
    end
    
    def blur(blur_distance)
        coordinates_ones = []
        blur_distance.times do
        @image_blur_array.each_with_index do |row, row_index|
                row.each_with_index do |pixel, c_index|
                    coordinates_ones << [row_index, c_index] if pixel == 1
                end
            end
        
            coordinates_ones.each do |c_index|
                @image_blur_array[c_index[0] - 1][c_index[1]] = 1 if c_index[0] > 0
                @image_blur_array[c_index[0]][c_index[1] - 1] = 1 if c_index[1] > 0
                @image_blur_array[c_index[0] + 1][c_index[1]] = 1 if c_index[0] < @image_blur_array[c_index[0]].length - 1
                @image_blur_array[c_index[0]][c_index[1] + 1] = 1 if c_index[1] < @image_blur_array.count - 1
            end
        end 
    end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0]
])

image.blur
image.output_image