require_relative 'todo'

rocky_raccoon_todo_list = TodoList.new(path: 'todo.csv')

binding.pry

puts rocky_raccoon_todo_list