require_relative 'list_parser'
require_relative 'list'
require_relative 'view'
require 'pry'

class Todo
  attr_accessor :to_do

  def initialize
    @to_do = List.new
    tasks = ListParser.new("todo.csv").list_parser
    tasks.each {|task| @to_do.add_task(task)}
    @view = View.new
  end

  def write_to_csv
    CSV.open("new.csv", 'w') do |writer|
      @to_do.tasks.each do |task|
        writer << [task.number, task.status, task.item]
      end
    end
  end

  def write_to_text
    File.open("to_do.txt",'w+') do |file|
      @to_do.tasks.each do |task|
        task.task_change_status_format
        file << task.format_task_for_txt
      end
    end
  end

  def show_to_do_list
    @view.display_to_do_list
    @to_do.tasks.each {|task| p task.to_s}
    @view.display_welcome_message
  end

  def add_to_do_list_item
    @view.display_add_task
    item = @view.get_input
    @to_do.add_task(Task.new(item: item, status: "Pending", number: (@to_do.tasks.length + 1)))
    @view.display_welcome_message
  end

  def update_to_do_list_item
    @view.display_update_task
    number = @view.get_input
    task = @to_do.find_task(number)
    task.update_task
    @view.display_welcome_message
  end

  def delete_to_do_list_item
    @view.display_delete_task
    number = @view.get_input
    @to_do.tasks.delete(task = @to_do.find_task(number))
    @view.display_welcome_message
    @view.display_welcome_message
  end

  def run_interface

    @view.display_welcome_message

    input = @view.get_input
    while input != 'exit'
      case input
      when "list"
        show_to_do_list
      when "add"
        add_to_do_list_item
      when "update"
        update_to_do_list_item
      when "delete"
        delete_to_do_list_item
      else
        puts "I don't know that command."
        @view.display_welcome_message
      end
      input = @view.get_input
    end
    puts "Thanks for using To-Do List!"
    write_to_csv
    write_to_text
  end

end

controller = Todo.new
controller.run_interface

