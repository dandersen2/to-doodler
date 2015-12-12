# requires ALL files that interact
require 'pry'

require_relative 'csv_parser'
require_relative 'task'
require_relative 'task_list'
require_relative 'view'

include CsvParser

  class Controller

  attr_reader :view

    def initialize
      @tdl = TaskList.new(csv_parse('todo.csv'))
      @view = View.new   # (ARGV)?
      run_interface
    end

    def run_interface
      input = ""
      self.view.start_menu
      input = self.view.get_user_input
      if input[:command] == "list"
        view.display_list(@tdl.print_tasks)
      elsif input[:command] == "add"
        @tdl.add_task(input[:task_item])
        view.display("You have added '#{input[:task_item]}' to your to do list.")
        view.display_list(@tdl.print_tasks)
      elsif input[:command] == "delete"
        @tdl.delete_task(input[:task_item])
        view.display("You have deleted '#{input[:task_item]}' from your to do list.")
        view.display_list(@tdl.print_tasks)
      elsif input[:command] == "completed"
        @tdl.check_off_task(input[:task_item])
        view.display("You have checked off '#{input[:task_item]}' on your to do list.")
        view.display_list(@tdl.print_tasks)
      end
      run_interface until input[:command] == 'exit'
    end

  end
