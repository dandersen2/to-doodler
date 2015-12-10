require_relative 'task_parser'
require_relative 'task'
require_relative 'list'
require_relative 'view'

class Controller

  def initialize
    @list = List.new(TaskParser.parse('todo.csv'))
    @view = View.new
  end

  def run_interface
    input = ''

    @view.welcome_msg
      if @list.empty?
        @view.display("Your list is empty! Add to it by typing in 'add' and then your task.")
      else
        @view.diplay(@list)
      end

    if input ==

    end
  end



end
