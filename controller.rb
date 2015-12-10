require 'csv'
require_relative 'task'
require_relative 'list'
require 'pry'
class Controller
  attr_reader :list, :to_dos
  def initialize
    @list = List.new('source/todo.csv')
    @list.add_list
  end
  def to_s
    "You got so much to do! #{@list.to_dos.to_do}"
  end
end
Controller.new
binding.pry
p Controller


