require_relative 'view'
require_relative 'list'
require 'csv'
require 'pry'

class Controller

  def initialize
    @viewer = View.new()
    @new_list = ""
  end

  def start
    @viewer.intro_message
    option = @viewer.gets_input
    # option = "1" #TRIAL VALUES
    if option == "1"
      # @viewer.add_file_message
      # file = @viewer.gets_input
      create_list('todo.csv')
      # create_list(file)
    elsif option == "2"
      create_list
      add_task
      add_task
      add_task
      print_list
      delete_task
      print_list
      complete_task
      print_list
      store_file
    else
      @viewer.error_message
    end
  end

  def create_list(file="")
    @new_list = List.new(file)
  end

  def parse_list
    @new_list.parse_tasks_from_file if @newlist.file != ""
  end

  def add_task
    @viewer.add_task_message
    new_task = @viewer.gets_input
    @new_list.add_task(new_task)
  end

  def delete_task
    @viewer.delete_task_message
    deleted_task = @viewer.gets_input
    @new_list.delete_task(deleted_task)
  end

  def print_list
    p "PRINTING LIST"
    @new_list.to_s
  end

  def complete_task
    @viewer.complete_task_message
    completed_task = @viewer.gets_input
    @new_list.complete_task(completed_task)
  end

  def store_file
    list = []
    list << @new_list.task_listing
    CSV.open("Todo_List.csv", "wb") do |csv|
      list.each do |list_element|
      csv << list_element
    end
  end
  end
  end

  runner = Controller.new
  runner.start


