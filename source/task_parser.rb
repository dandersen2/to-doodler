require 'pry'

module TaskParser
  def self.parse(file)
    CSV.foreach(file).map { |task_row| Task.new(task_row) }
    binding.pry
  end
end

# TaskParser.parse("some_file.csv")
# assuming this returns an array of task objects
# and assuming we are going to pass those in as we instantiate a list object
# where should we be calling this line?
# A: Wherever we're instantiating the new list... in this case in the controller

p TaskParser.parse('todo.csv')
