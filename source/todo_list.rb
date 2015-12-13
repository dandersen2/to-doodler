require_relative 'controller'

view = View.new
list = TodoFileParser.new('todo.csv').todo_list_array

controller = Controller.new(list, view)

controller.user_action
