require_relative 'todo.rb'
require_relative 'view.rb'
require 'pry'


class Controller
  attr_reader :list, :view

  def initialize
    @list = List.new('todo.csv')
    @view = View.new
    run_interface
  end

  def run_interface
    input = ''
    until input == "exit"
      input = @view.get_input
      if input.split(' ')[0] == 'add'
        task_string = input.split[1..-1].join(' ')
        self.list.add(task_string)
        self.view.display(task_string)
      end
    end
  end
end
