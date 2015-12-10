class Controller
  def initialize
    @jessies_todo_list = ToDo.new("todo.csv").map { Task.new }
    @view = View.new
  end

  def run_interface
  input = ""
end
