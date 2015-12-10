class Controller
  def initialize
    @jessies_todo_list = ToDo.new("todo.csv").map { Task.new }
  end
end
