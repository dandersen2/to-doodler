require 'pry'

require 'CSV'
require_relative 'task_list'
require_relative 'view'

class Todo #CONTROLLER

  def initialize
    @tdl = TaskList.new
    @view = View.new
    run_interface
  end

  def run_interface
    case ARGV[0]
    when 'list'
      @view.display(@tdl.list)
    when 'add'
      @tdl.add(ARGV[1])
      @view.display('Success! You added: '+ ARGV[1])
    when 'delete'
      @tdl.delete(ARGV[1].to_i)
      @view.display(@tdl.list)
    else
      @view.display("Sorry, not a valid command")
    end
  end

end

Todo.new


