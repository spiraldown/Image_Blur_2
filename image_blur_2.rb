class Image
  #accessor enables read and write, storing variable
  attr_accessor :array
    
  #intialize runs 
  def initialize (array)
    @array = array
  end
    
  # method output_image shows what's in array on screen
  def output_image
  # loop continues through each Row and outputs content
    @array.each do |row|
      puts row.join
    end
  end
    
  def blur
    coordinates = []
    
    @array.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        if value == 1
          coordinates << [row_index, value_index]
            coordinates.each do |coordinate|
              row_coordinate = coordinate[0]
              value_coordinate = coordinate[1]
              unless  @array[row_coordinate +1][value_coordinate] == 0
                @array[row_coordinate +1][value_coordinate] = 1
              end
              if @array[row_coordinate -1 ][value_coordinate] == 0
                @array[row_coordinate -1 ][value_coordinate] = 3
              end
              if @array[row_coordinate][value_coordinate +1] == 0  
              @array[row_coordinate][value_coordinate +1] = 3
              end
              if @array[row_coordinate][value_coordinate -1] == 0   
             @array[row_coordinate][value_coordinate -1] = 3
             end
            end
          end
        end
    end
         @array.each do |row|
        puts row.join
        end
  end
end

 image = Image.new([
   [0, 0, 0, 0],
   [0, 1, 0, 0],
   [0, 0, 0, 1],
   [0, 0, 1, 0]
   ])

image.blur