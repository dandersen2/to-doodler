require_relative 'view'
require_relative 'todo'

class Controller
  def initialize
    @jessies_todo_list = ToDo.new("todo.csv")
    @view = View.new
  end

  def run_interface
   # @jessies_todo_list.parse_list
  @view.display_welcome_message
  input = gets.chomp
  until input == "exit"
    if input == 'add'
      puts "Add new task"
      task = gets.chomp
      @jessies_todo_list.add_task(task)
      @view.show_task(@jessies_todo_list.task_array)
    end
    input = gets.chomp
  end
end

end
