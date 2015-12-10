require 'pry'
require 'csv'
require_relative 'task_parser'
require_relative 'task'
require_relative 'list'
require_relative 'view'

# parsed_tasks = TaskParser.new
# x = parsed_tasks.parse_tasks_from_file

my_list = List.new
p my_list

walk_task = Task.new('walk the dog')
p walk_task

my_list.add(walk_task)
p my_list

my_list.delete(walk_task)
p my_list
