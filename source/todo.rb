require_relative 'list_parser'
require 'pry'
#on initialize
# - create a new list object,
# - parse the data from the csv into task objects
# - add those task objects into my list object's task array
# - display list.tasks to my terminal

class Todo
attr_accessor :to_do

  def initialize
    @to_do = List.new
    tasks = ListParser.new("/Users/apprentice/Desktop/ruby-todos-1-0-core-features-challenge/source/todo.csv").list_parser
    tasks.each {|task| @to_do.add_task(task)}
    @to_do.tasks.each {|task| p task.to_s}
    # @view = View.new
  end
end

class View

  def get_input
    gets.chomp
  end

end



controller = Todo.new


