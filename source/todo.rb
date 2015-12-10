require_relative 'list_parser'
require 'pry'

class Todo
attr_accessor :to_do

  def initialize
    @to_do = List.new
    tasks = ListParser.new("/Users/apprentice/Desktop/ruby-todos-1-0-core-features-challenge/source/todo.csv").list_parser
    tasks.each {|task| @to_do.add_task(task)}
    @view = View.new
  end

  def run_interface
    @view.display_welcome_message
    input = @view.get_input
    case input
    when input == "list"
      @view.display_to_do_list
      @to_do.tasks.each {|task| p task.to_s}
      @view.display_welcome_message
    when input == "add"
      @view.display_add_task
      @view.display_welcome_message
    when input == "update"
      @view.display_update_task
      @view.display_welcome_message
    when input == "delete"
      @view.display_delete_task
      @view.display_welcome_message
    when input == "exit"
      @view.display("Thanks for using To-Do List!")
    end
  end
end


class View

  def get_input
    gets.chomp
  end

  def show_output(output)
    puts output
  end

  def display_to_do_list
    puts "Here's your To_do List"
  end

  def display_add_task
    puts "Thanks for adding a task"
  end

  def display_update_task
    puts "Thanks for updating your task"
  end

  def display_delete_task
    puts "Thanks for updating your task"
  end

  def display_welcome_message
    puts "Welcome to To-Do List! To view your list:
      type list, to add a new item: type add,
      to update the status of a current item: type update,
      to delete an item: type Delete, to exit the program: type exit"
  end
end

controller = Todo.new


