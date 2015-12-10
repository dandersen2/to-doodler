require 'pry'
ARGV.inspect
require_relative 'task_parser'
require_relative 'task'
require_relative 'list'
require_relative 'view'

class Controller
attr_reader :list

  def initialize
    @list = List.new(TaskParser.parse('todo.csv'))
    @view = View.new
    run_interface
  end

  def run_interface
    input = ''

    if @list.tasks.empty?
      @view.display("Your list is empty! Add to it by typing in 'add' and then your task.")
    end

    if ARGV[0] == 'list'
      @view.display(self.list)
    elsif ARGV[0] == 'add'
      self.list.add(ARGV[1..-1].join(' '))
      @view.display(self.list)
    elsif ARGV[0] == 'delete'
      self.list.delete(ARGV[1..-1].join(' '))
      @view.display(self.list)
    elsif ARGV[0] == 'complete'
      self.list.complete(ARGV[1..-1].join(' '))
      @view.display(self.list)
    else
      @view.display("Sorry, I don't understand that command.")
    end
  end
end

Controller.new
