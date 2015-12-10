ARGV.inspect
require 'pry'
require 'csv'
require_relative 'task_parser'
require_relative 'task'
require_relative 'list'
require_relative 'view'


new_list = List.new(TaskParser.parse('todo.csv'))

binding.pry

new_list.delete(0)

puts new_list
