require_relative 'list'
require_relative 'task'
require_relative 'view'
class Controller
  def initialize()
    @list = List.new('todo.csv')
    @view = View.new()
  end

  def get_user_command
    @list.parse_csv
    @view.introduction
    @view.user_interface
    until @view.input == "quit"
      case @view.input
      when "remove"
        @view.remove_index
        remove_task_index = @view.input.to_i - 1
        @list.remove_task(remove_task_index)
      when "complete"
        @view.complete_index
        complete_task_index = @view.input.to_i - 1
        @list.finish_task(complete_task_index)
      when"add"
        @view.add_task
        task_to_add = @view.input
        @list.add_task(Task.new(task_to_add))
      when "print"
        system("clear")
        @view.show(@list.task_array)
      else
        puts "I'm sorry, I don't recognize that request. Please try again."
        @view.user_interface
        @view.input
      end
      @view.user_interface
      @view.input
    end
  end
end
x = Controller.new
x.get_user_command
