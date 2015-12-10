class View
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def display
    counter = 1
    file.flatten.each do |string_to_do|
      p "#{counter}: #{string_to_do}"
      counter += 1
    end
  end
end