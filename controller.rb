require 'csv'
require_relative 'task'
require_relative 'list'
require 'pry'
class Controller

  attr_reader :list, :to_dos
  def initialize
    @list = List.new('source/todo.csv')
    @list.add_list
  end
end
todo_list = Controller.new
# list.add({to_do: "Eat Sandwhich"})
binding.pry
p Controller


# list = List.new('source/todo.csv')
# list.add_list

# list.add({to_do: "Eat Sandwhich"})
# # list.delete("Lose Lil to Danny")
# list.add

# #NEED THIS.. changes false to true on the status
# list.done("Lose Lil to Danny")


# puts list
# binding.pry
# # list.delete("Move with Lil to the black mountain hills of Dakota")
# puts list
