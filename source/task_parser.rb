require 'CSV'
require_relative 'task'

class TaskParser
  attr_reader :file

  def initialize(file)
    @file = file

  end

  def list
    @list ||= parse_tasks_objects_from_file #Q: in what situation would a list exist pre-parse?
  end

  private

  def parse_tasks_objects_from_file
    CSV.read(file).map.with_index do |row, index|
    Task.new(id: index+1, task: row.join)
    end
  end

end

# test = TaskParser.new('todo.csv')
# p test.list

