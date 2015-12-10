ARGV.inspect
require_relative 'task_parser'
require_relative 'task'
require_relative 'list'
require_relative 'view'

class Controller

  def initialize
    @list = List.new(TaskParser.parse('todo.csv'))
    @view = View.new
    run_interface
  end

  def run_interface
    input = ''
    @view.show_welcome_msg
    sleep(1)
      if @list.tasks.empty?
        @view.display("Your list is empty! Add to it by typing in 'add' and then your task.")
      else
        @view.display(@list)
      end

    # until input == 'exit'
    if input.ARGV[0]='add'
      self.list.add(ARGV[1])
      @view.display(@list)
    end
    # end
    @view.display("Seeya")
  end



end

Controller.new
