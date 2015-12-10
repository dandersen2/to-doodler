require_relative 'todo'
require_relative 'view'


test = Controller.new("todo.csv")

test.import_info
# test.add("Hahahaha?")
test.list
test.complete(14)
test.list
