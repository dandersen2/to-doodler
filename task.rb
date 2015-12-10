require_relative 'todo_parser'
require 'pry'
class Task

  attr_reader :to_do, :completed
  def initialize(args = {})
    @to_do = args[:to_do]
    @completed = false
  end
end

todo =Task.new()
