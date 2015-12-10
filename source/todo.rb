require_relative 'list_parser'
require_relative 'view'
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
    while input != 'exit'
      case input
      when "list"
        @view.display_to_do_list
        @to_do.tasks.each {|task| p task.to_s}
        @view.display_welcome_message
      when "add"
        @view.display_add_task
        @view.display_welcome_message
      when "update"
        @view.display_update_task
        @view.display_welcome_message
      when "delete"
        @view.display_delete_task
        @view.display_welcome_message
      else
        puts "I don't know that command."
        @view.display_welcome_message
     end
      input = @view.get_input
    end
    puts "Thanks for using To-Do List!"
  end
end


controller = Todo.new
controller.run_interface

