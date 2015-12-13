require_relative 'task'
require 'csv'

require 'pry'

class TodoFileParser

attr_reader :file, :todo_list_array

  def initialize(file)
    @file = file
    @todo_list_array = generate_task
  end

#read each line of the file and pass it into the task class

  def generate_task
    CSV.foreach(@file).map{|row| (Task.new(row).task)}
  end

end

#todo = TodoFileParser.new('todo.csv')
#todo.todo_list_array => array of tasks
