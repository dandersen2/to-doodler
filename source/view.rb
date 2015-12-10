require_relative 'list'
require_relative 'Task'
require_relative 'controller'
class View
  def initialize

  end
  def introduction
    puts "Hello and welcome to Edward's Eccentric To-Do list!, here is your current list: #{@task_array}"
  end
  def user_interface
    puts "Would you like to: Update your list? Remove a task from your list? Complete an item from your list?"
    @user_response = gets.chomp
    if @user_response = "Update"

    elsif @user_response = "Remove"

    elsif @user_response = "Complete"

    else
      p "I'm sorry, I don't recognize that request."
      return View.user_interface
    end
  end
  def update_task
     p "Which task would you like to update?"
      p "Task one? #{@task_array[0]}, Task two? #{@task_array[1]}, Task three? #{@task_array[2]}, Task four? #{@task_array[3]}, Task five? #{@task_array[4]}, Task six? #{@task_array[5]}, Task seven? #{@task_array[6]}, Task eight? #{@task_array[7]}, Task nine? #{@task_array[8]}, Task ten? #{@task_array[9]}, Task eleven? #{@task_array[10]}, Task twelve? #{@task_array[11]}, Task thirteen? #{@task_array[12]} Please type exactly which class you want to update (i.e. for task 1 type 'one')"
      @update_task_response = gets.chomp
  end

end
x = View.new()
x.introduction
