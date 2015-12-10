
require_relative 'todo'




sample_list = ToDo.new("todo.csv")
sample_list.parse_list
sample_list.add_task
sample_list.to_s
