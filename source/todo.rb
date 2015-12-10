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
      @tdl.add(task: ARGV[1], id:14)
      @view.display(@tdl.list)
    when 'delete'
      @tdl.delete_by_id(ARGV[1].to_i)
      @view.display(@tdl.list)
    else
      @view.display("Sorry, not a valid command")
    end


    #   when 'list'
    #     @view.display(@tdl.list)
    #   when 'add'
    #     @tdl.add(task_id: 14, task: "Listen to The Beatles")
    #     @view.display(@tdl.list)
    #   else
    #     @view.display("Sorry, not a valid command") unless command == 'quit'
    #   end

  end

end

Todo.new


