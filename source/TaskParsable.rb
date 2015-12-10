module TaskParsable

 def self.read
    # Convert CSV file to list of tasks by line
      #For each line in file, make new task instance, add to @tasks as string
    array_representation = []
    CSV.foreach('todo.csv') do |row|
      array_representation << Task.new(row.join(' ')) # Use #join in case of in-line comma
    end
    array_representation
  end

  def self.rewrite(array)
    CSV.open('todo.csv', 'wb') do |file|
      array.each{|row| file << [row]}
    end
  end
end
