require 'CSV'
require_relative 'todo'

class TodoListParser
  attr_reader :file

  def initialize(file)
    @file = file
  end

  private

  def parse_tasks_objects_from_file(file)
    CSV.read(file).map.with_index do |row, index|
    Task.new(task_id: index+1, task: row)
    end
  end

end
