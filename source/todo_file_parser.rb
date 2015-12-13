require_relative 'task'
require 'csv'

class TodoFileParser

attr_reader :file, :todo_list_array

  def initialize(file)
    @file = file
    @todo_list_array = generate_task
  end

  def generate_task
    CSV.foreach(@file).map{|row| (Task.new(row).task)}
  end

end
