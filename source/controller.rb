require_relative 'list'
require_relative 'Task'
require_relative 'view'
class Controller
  # attr_reader :new_list
  def initialize()

  end

  def print_tasks
    puts list
  end
  def update_task
    list.task_array[]
  end
  def remove_task
    list.remove_task(user_input)
  end

  def organize_list
    @one = @task_array[0]
    @two = @task_array[1]
    @three = @task_array[2]
    @four = @task_array[3]
    @five = @task_array[4]
    @six = @task_array[5]
    @seven = @task_array[6]
    @eight = @task_array[7]
    @nine = @task_array[8]
    @ten = @task_array[9]
    @eleven = @task_array[10]
    @twelve = @task_array[11]
    @thirteen = @task_array[12]
  end

end
x = List.new("todo.csv")
x.add_tasks
x.task_array[0].update("hi im new")
puts x
