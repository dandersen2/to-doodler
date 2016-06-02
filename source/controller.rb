require 'pry'
require_relative 'parsable'
require_relative 'task'
require_relative 'task_list'
require_relative 'view'
require_relative 'colored'

class Controller
  include Parsable

  def initialize
    system("clear")
    @my_todo_list = TaskList.new(csv_parser('task_list_output.csv'))
    @my_view = View.new
    run_interface(@my_todo_list)
  end

  def run_interface(current_todo_list)

    @my_view.start_menu
    input = @my_view.get_user_input

    case input[:command]
      when "list", "outstanding", "completed", "sorted", "inclusive-filter", "exclusive-filter", "1", "6", "7", "8", "10", "11"
      when "add", "2"
        current_todo_list.add_task(input[:task_item])
      when "delete", "3"
        current_todo_list.delete_task(input[:task_item])
      when "check", "4"
        current_todo_list.check_off_task(input[:task_item])
      when "uncheck", "5"
        current_todo_list.uncheck_task(input[:task_item])
      when "add-tag", "add-tags", "9"
        current_todo_list.add_tags(input[:task_item], input[:tags] )
      when "remove-tag", "remove-tags", "12"
        current_todo_list.remove_tags(input[:task_item], input[:tags] )
      when "exit", "13"
        @my_view.display("Thanks for using To-Doodler! Goodbye.".bold.yellow.underline)
      else
        @my_view.display("I'm sorry, I didn't understand that command. Make sure you have entered a valid command and task item. \n".bold.yellow.underline)
        sleep(2.5)
    end

    unless input[:command] == 'exit' || input[:commmand] == '13'
      case input[:command]
        when "outstanding", "6"
          system("clear")
          @my_view.display("Here are your outstanding to-do items, sorted by creation date, most recent first:\n".bold.yellow.underline)
          @my_view.display(@my_todo_list.outstanding)
        when "completed", "7"
          system("clear")
          @my_view.display("Here are your completed to-do items, sorted by completion date, most recent first:\n".bold.yellow.underline)
          @my_view.display(@my_todo_list.completed)
        when "sorted", "8"
          system("clear")
          @my_view.display("Here are all of your to-do items, sorted by creation date, most recent first:\n".bold.yellow.underline)
          @my_view.display(@my_todo_list.sorted)
        when "inclusive-filter", "10"
          system("clear")
          @my_view.display("Here are all your to-do items that contain any of the tags that you entered (".bold.yellow.underline + "#{input[:tags].join(', ')}".cyan + "), sorted by creation date, most recent first:\n".bold.yellow.underline)
          @my_view.display(@my_todo_list.inclusive_filter_by_tags(input[:tags]))
        when "exclusive-filter", "11"
          system("clear")
          @my_view.display("Here are all your to-do items that contain all of the tags that you entered (".bold.yellow.underline + "#{input[:tags].join(', ')}".cyan + "), sorted by creation date, most recent first:\n".bold.yellow.underline)
          @my_view.display(@my_todo_list.exclusive_filter_by_tags(input[:tags]))
      else
        csv_write(current_todo_list.all_tasks, 'task_list_output.csv')
        @my_todo_list = TaskList.new(csv_parser('task_list_output.csv'))
        system("clear")
        @my_view.display("")
        @my_view.display("Here are all of your to-do items:\n".bold.yellow.underline)
        @my_view.display("Your completed tasks are listed in GREEN".green)
        @my_view.display("Your incomplete (outstanding) tasks are listed in PURPLE".magenta)
        @my_view.display("Your important tasks (tagged with 'important') are listed in WHITE".white)
        @my_view.display("")
        @my_view.display(@my_todo_list.all_tasks)
      end
    end

    if input[:command] == 'exit' || input[:commmand] == '13'
      return false
    else
      run_interface(@my_todo_list)
    end
  end

end
