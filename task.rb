require_relative 'todo_parser'
require 'pry'
class Task

  attr_reader :to_do, :completed
  def initialize(args = {})
    random_evil= ["steal lunch", "give a tourist wrong directions", "evil laugh", "kill kittens"]
    @to_do = args[:to_do] || random_evil.sample
    @completed = false
    @date_added = Time.now
  end
end

todo =Task.new()