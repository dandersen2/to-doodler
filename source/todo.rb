require_relative 'list_parser'

class Todo

#on initialize
# - create a new list object,
# - parse the data from the csv into task objects
# - add those task objects into my list object's task array
# - display list.tasks to my terminal


def initialize
  @to_do = List.new
  tasks = ListParser.new("/Users/apprentice/Desktop/ruby-todos-1-0-core-features-challenge/source/todo.csv").list_parser
  @to_do.add_tasks(tasks)
end

end

p todo = Todo.new
