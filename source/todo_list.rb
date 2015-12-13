require_relative 'controller'

view = View.new
list = TodoFileParser.new('todo.csv')

controller = Controller.new(list, view)

controller.user_action
