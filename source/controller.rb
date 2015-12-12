# requires ALL files that interact
require 'pry'

require_relative 'csv_parser'
require_relative 'task'
require_relative 'task_list'
require_relative 'view'

# here include csv_parser module
include CsvParser

class Controller

attr_reader :view

  def initialize
    @tdl = TaskList.new(csv_parse('todo.csv'))
    @view = View.new   # (ARGV)?
    run_interface
  end

  def run_interface # recursively call itself UNTIL input command is 'exit'
    input = ""
    self.view.start_menu
    # input = self.view.get_user_input  #returns an array of strings, [0] is command, [all others] are the task content
    # command = input[0]
    # task_item = input[1..input.length]
    # command = input.shift
    # task_item = input
    # binding.pry
    input = self.view.get_user_input
    # binding.pry
    # until command == "exit"
      "You have entered: #{input[:command]}"
      if input[:command] == "list"
        view.display("Here is your current to do list:")
        # p "Here is your current to do list:"
        # self.view.display(@tdl.print_tasks)
        view.display_list(@tdl.print_tasks)
      # elsif input[:command] == "add"
      #   self.view.display("You have added #{input[:task_item]} to your to do list.")
      #   self.view.display(@tdl.add_task(input[:task_item]))
      #   # binding.pry
      # elsif input[:command] == "delete"
      #   self.view.display("You have deleted #{input[:task_item]} from your to do list.")
      #   self.view.display(@tdl.delete_task(input[:task_item]))
      # elsif input[:command] == "completed"
      #   self.view.display("You have checked #{input[:task_item]} off of your to do list. Nice work!")
      #   self.view.display(@tdl.check_off_task(input[:task_item]))
      # else
      #   self.view.display("Sorry, I didn't understand you.") unless input[:command] == "exit"
      end
      # input = self.view.get_user_input
    # end
  end

end

# parsed_list = CsvParser.csv_parse('todo.csv')

# new_task_list = TaskList.new(parsed_list)

# p new_task_list

# new_task_list.print_tasks                            #(WORKING [X])

# new_task_list.add_task("Buy some bananas")           #(WORKING [X])

# new_task_list.print_tasks

# new_task_list.delete_task("Visit doctor")            #(WORKING [X])

# new_task_list.print_tasks

# new_task_list.check_off_task("Drink too much gin")     #(WORKING [X])

# new_task_list.print_tasks

