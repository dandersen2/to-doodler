require 'pry'
require 'csv'
require_relative 'task'
require_relative 'list'


module TaskParser
  def self.parse(file)
    CSV.read(file).map { |task_row| Task.new(task_row) }
  end
end

# TaskParser.parse("some_file.csv")
# assuming this returns an array of task objects
# and assuming we are going to pass those in as we instantiate a list object
# where should we be calling this line?
# A: Wherever we're instantiating the new list... in this case in the controller

