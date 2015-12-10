class View
  attr_reader :file, :completed

  def initialize(file)
    @file = file
    @completed = false
  end

  def completed!
    @completed = true
  end

  def display
    file.flatten.each do |string_to_do|
      if completed == false
        p "\[ \]: #{string_to_do}"
      elsif completed == true
        "\[X\]: #{string_to_do}"
      end
    end
  end
end