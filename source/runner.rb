
require_relative 'todo'




sample_list = ToDo.new("todo.csv")
sample_list.parse_list
sample_list.remove_task
