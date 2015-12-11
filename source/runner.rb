require 'csv'
require_relative 'task'
require_relative 'todo'
require 'pry'

list = List.new('todo.csv')

list.action