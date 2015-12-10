require_relative 'todo'
require_relative 'view'


test = Controller.new("todo.csv")

test.import_info
test.list
p test.save
