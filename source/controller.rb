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
    option = ""
    until option == "exit" do
      @viewer.intro_message
      option = @viewer.gets_input.downcase
      if option == "1"
        @viewer.add_file_message
        file = @viewer.gets_input
        mod_file(create_list(file))
        break
      elsif option == "2"
        mod_file(create_list)
        break
      elsif option == "exit"
      else
        @viewer.error_message
      end
    end
  end

  def mod_file(file)
    option = ""
    @viewer.space
    @viewer.options_intro_message
    @viewer.options_message
    until option == "exit" do
      option = @viewer.gets_input.downcase if option == ""
      case option
      when "add"
        add_task
      when "delete"
        delete_task
      when "complete"
        complete_task
      when "print"
        print_list
      when "save"
        save_file
      when "exit"
        break
      else
        @viewer.error_message
      end
      @viewer.options_end_message
      option = @viewer.gets_input.downcase
      break if option == "n" || option == "exit"
    end
  end

  def create_list(file="")
    @new_list = List.new(file)
    parse_list if file != ""
  end

  def parse_list
    @new_list.parse_tasks_from_file
  end

  def add_task
    @viewer.add_task_message
    new_task = @viewer.gets_input
    @new_list.add_task(new_task)
  end

  def delete_task
    @viewer.delete_task_message
    deleted_task = @viewer.gets_input.to_i
    @new_list.delete_task(deleted_task)
  end

  def print_list
    @viewer.space
    @viewer.list_title
    list_print =  @new_list.to_s
    puts list_print
  end

  def complete_task
    @viewer.space
    print_list
    @viewer.complete_task_message
    completed_task = @viewer.gets_input.to_i
    @new_list.complete_task(completed_task)
  end

  def save_file
    @new_list.save_list
  end

end
