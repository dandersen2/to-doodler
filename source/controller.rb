# requires ALL files that interact
require 'pry'

require_relative 'csv_parser'
require_relative 'task'
require_relative 'task_list'
require_relative 'view'

  class Controller
  include CsvParser

  attr_reader :view
  attr_writer :view

    def initialize
      @my_todo_list = TaskList.new(csv_parse('updated_todo.csv'))
      # @my_todo_list = TaskList.new(csv_parse('todo.csv'))
      @view = View.new   # (ARGV)?
      run_interface
    end

    def run_interface
      self.view.start_menu
      input = self.view.get_user_input

      case input[:command]
      when "list"
        view.display_list(@my_todo_list.print_tasks)
      when "add"
        @my_todo_list.add_task(input[:task_item])
        view.display_list(@my_todo_list.print_tasks)
      when "delete"
        @my_todo_list.delete_task(input[:task_item])
        view.display_list(@my_todo_list.print_tasks)
      when "completed"
        @my_todo_list.check_off_task(input[:task_item])
        view.display_list(@my_todo_list.print_tasks)
      when "exit"
        view.display("Thanks for using To-Doodler! Goodbye.")
      else
        view.display("I'm sorry, I didn't understand that command. Make sure you have entered a valid command and task item.
          ")
      end
      # @my_todo_list.csv_write('updated_todo.csv')  #???
      unless input[:command] == 'exit'
        @updated_file = TaskList.new(csv_write('updated_todo.csv'))
        @view = View.new
      end
      if input[:command] == 'exit'
        return false
      else
        run_interface
      end
    end

  end
