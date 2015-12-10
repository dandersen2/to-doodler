require 'pry'
require 'csv'
require_relative 'task_parser'
require_relative 'task'
require_relative 'list'
require_relative 'view'

# parsed_tasks = TaskParser.new
# x = parsed_tasks.parse_tasks_from_file


# TaskParser.parse('todo.csv')
# new_list = List.new(TaskParser.parse('todo.csv'))

# p new_list.tasks.to_s

TaskParser.parse('todo.csv')
new_list = List.new(TaskParser.parse('todo.csv'))

new_list.tasks

puts new_list

