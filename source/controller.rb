require_relative "list"
require_relative "task"
require_relative "view"
require_relative "parser"
require 'pry'

class Controller
  # include Parser
  # attr_reader :file

  def initialize
    @view = View.new
    @list = List.new
    # @list.read("todo.csv")
    @list.add("kick the dog")
    @list.add("get a cat instead")
    @list.add("kick the cat")
    run_interface
    binding.pry
  end


  def run_interface

    if ARGV[0] == "add"
      @list.add(ARGV[1..-1].join(" "))
      # @view.display(@list)
    elsif ARGV[0] == "remove"
      @list.delete(ARGV[1].to_i)
      # @view.display(@list)
      binding.pry
    elsif ARGV[0] == "list"
      @view.display(@list)
    elsif ARGV[0] == "complete"
      binding.pry
      @list.complete(ARGV[1].to_i)
      @view.display(@list)
    end
  end
end

Controller.new



