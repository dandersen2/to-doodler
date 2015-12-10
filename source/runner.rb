require 'pry'
require_relative 'task_parser'
require_relative 'task'

# Parse the data in the todo.csv file into ruby todo objects
parsed_csv = TaskParser.new('todo.csv')

my_to_do_list = parsed_csv.populate_task_list

# urgent_task = Task.new(task_list)
# p urgent_task

# binding.pry



p my_to_do_list

# puts urgent_task
