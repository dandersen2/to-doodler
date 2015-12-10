require_relative 'list'
require_relative 'Task'
require_relative 'view'
class Controller
  def initialize()
    @list = List.new('todo.csv')
    @view = View.new()
  end

  def run_everything
    @list.parse_csv
    @view.introduction
    @view.user_interface
    get_user_command
  end
    def get_user_command
      input = gets.chomp
      until input == "Quit"
      case input
      when "Remove"
        @view.remove_index
        remove_task_index = gets.chomp.to_i - 1
        @list.remove_task(remove_task_index)
      when "Complete"
        @view.complete_index
        complete_task_index = gets.chomp.to_i
        @list.task_array[complete_task_index].im_done
      when"Add"
        @view.add_task
        task_to_add = gets.chomp
        @list.add_task(Task.new(task_to_add))
      when "Print"
        system("clear")
        @view.show(@list.task_array)
      else
        p "I'm sorry, I don't recognize that request. Please try again."
        @view.user_interface
        input = gets.chomp
      end
        @view.user_interface
        input = gets.chomp
      end
    end
end
x = Controller.new
x.run_everything
#controller should only call methods from other places
      # if input == "Update"
      #   View.update_instructions
      #   user_task_update = gets.chomp
      #   View.update_task(@task_hash)
      #   user_task_new_input = gets.chomp
      #   @list.update_task(user_task_update, user_task_new_input)

    # def get_user_index #DRY IT Up
    #   @user_task_update = gets.chomp
    #   @user_task_remove = gets.chomp
    #   @user_task_complete = gets.chomp
    # end
    # def get_user_input
    #     @user_task_new_input = gets.chomp
    # end
  # def print_tasks
  #   puts list
  # end
  # def update_task
  #   @task_hash[@user_task_update].update(@user_task_new_input)
  #   # CSV.open('todo.csv') do |add_update|
  #   #   add_update << @task_hash[@user_task_update].update(@user_task_new_input)
  # end
  # def remove_task
  #   list.remove_task(@user_task_remove)
  # end
  # def complete_task
  #   list.task_array[@user_task_complete].im_done
  # end
