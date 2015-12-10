require 'pry'
require_relative 'todo_parser'
require_relative 'todo'

# Parse the data in the todo.csv file into ruby todo objects
parser = ToDoParser.new('todo.csv')

todo_list = parser.parse_todos_to_todo_objects

urgent_task = ToDo.new(todo_list)


# binding.pry


p urgent_task

p todo_list

# puts urgent_task
