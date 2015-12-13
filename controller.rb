require 'csv'
require_relative 'task'
require_relative 'list'
require_relative 'todo_parser'

class View
  def display(output)
    puts output
  end
  def get_input
    ARGV
  end
end
class Controller
  ARGV.inspect
  attr_reader :list, :view

  def initialize
    @list = List.new
    @view = View.new
    run_interface
  end

  def run_interface
    @view.display("Welcome to your to do list \n So far")
    puts self.list
    @view.display("To add .... and more instructions add, done, delete, check")
    input = @view.get_input
    todo = input[1..-1].join(' ')
    if input[0] == "add"
      self.list.delete(todo)
    elsif input[0] == "done"
      self.list.done(todo)
    elsif input[0] == "delete"
      self.list.delete(todo) 
    elsif input[0] == "check"
      puts list  
    end
  end
end
Controller.new
