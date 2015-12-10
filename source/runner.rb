require_relative 'todo'
require_relative 'view'


test = Controller.new("todo.csv")

test.list
test.add("Hahahaha?")
test.list
test.complete(14)
test.list
