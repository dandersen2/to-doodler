require 'pry'
# EXAMPLE
# $ ruby todo.rb add Bake a delicious blueberry-glazed cheesecake
# $ ruby todo.rb list
# $ ruby todo.rb delete <task_id>
# $ ruby todo.rb complete <task_id>

# Initialize an empty TODO list
# list = List.new

# Add a task to a TODO list
# list.add(Task.new("walk the dog"))

# Get all the tasks on a TODO list
# tasks = list.tasks

# Delete a particular task from a TODO list
# tasks.delete_at(task_id)

# Complete a particular task on a TODO list
# tasks.completed? = true

# Parse the command-line arguments and take the appropriate action
# input = "new list", "add", "list", "delete", "complete" + task_id for add, delete, and complete
require 'CSV'
require_relative 'task_list'

class Todo #CONTROLLER

  def initialize
    @tdl = TaskList.new
    @view = View.new
    run_interface
  end

  def run_interface #MAKE THIS A CASE STATEMENT???
    input = ""
    @view.display_message
    until input == 'quit'
      input = @view.get_input
      if input == 'list'
        @view.display(@tdl.list)
      else
        @view.display("Sorry") unless input == 'quit'
      end
    end
  end

end


class View

  def display(output)
    puts output
    end

  def get_input
    gets.chomp
  end

  def display_message
    puts "      -----------TO DO LIST----------
    Commands: \"list\" displays your to-do list
              \"quit\" quits the program"
  end

end

Todo.new



