# I AM JACK's BRAIN. I CONTROL ALL OF JACK's PARTS

class Controller
  def initialize
    @my_todo_list = TaskList.new.populate_task_list_from_csv('todo.csv')
    @viewer = Viewer.new
    run_interface
  end

  def run_interface
    input = ""
    @viewer.display_welcome_message
    input = @viewer.get_input
    if input == "add"
      @viewer.display(my_todo_list.add(ARGV.drop(1).join(" ")))
    elsif input == "delete"
      @viewer.display(my_todo_list.delete(ARGV.drop(1)))


