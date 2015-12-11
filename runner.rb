require 'csv'
require_relative 'task'
require_relative 'doable'
require_relative 'doable'
require_relative 'list'

require 'pry'


todo = ARGV
binding.pry
ARGV.inspect
if ARGV[0] == "add" || ARGV[0] == "delete" || ARGV[0] == "done"
  option = ARGV[0]
  task = ARGV[1..-1].join(" ")
else
  list_of_todos = []
  ARGV.each do |task|
    each_task = {}
    each_task[:to_do] = task
    list_of_todos << each_task
  end
end
