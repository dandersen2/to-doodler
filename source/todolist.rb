require 'pry'
require_relative 'parser'

class ToDoList
  include Parser
  attr_reader :file, :file_as_array, :complete

  def initialize(file)
    @file = file
    @file_as_array = []
    @complete = false
  end

  def add_to_list(number = -1, string)
    file_as_array.insert(number, [string]).to_a
    save_changes
  end

  def delete_from_list(number)
    unless number >= 1 && number <= file_as_array.length
    raise ArgumentError.new("Only numbers present on the list may be used.")
    end
    file_as_array.delete_at(number - 1)
    save_changes
  end

  def complete(number)
    unless number >= 1 && number <= file_as_array.length
    raise ArgumentError.new("Only numbers present on the list may be used.")
    end
    p"congratulations on completing your task: #{file_as_array.flatten[number - 1].to_s}."
    save_changes
  end

end