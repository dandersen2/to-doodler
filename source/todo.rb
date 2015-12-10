# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

require 'pry'
require 'csv'
require_relative 'list'
require_relative 'view'



class Controller
  ARGV.inspect
  attr_reader :list, :view

  def initialize
    @list = List.new('todo.csv')
    @view = View.new
    run_interface
  end

  def run_interface
    input = @view.get_input
    if input[0] == 'add'
      task_string = input[1..-1].join(' ')
      self.list.add(task_string)
      self.view.display(task_string)
    elsif input[0] == 'list'
      self.view.display(self.list.to_s)
    elsif input[0] == 'delete'
      self.view.display(self.list.delete(input[1].to_i))
    elsif input[0] == 'complete'
      self.view.display(self.list.complete_task(input[1].to_i))
    end
  end
end


controller = Controller.new

binding.pry
puts
