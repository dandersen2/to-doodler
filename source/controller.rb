# I AM JACK's BRAIN. I CONTROL ALL OF JACK's PARTS
require 'pry'
require 'csv'

require_relative 'task_list'
require_relative 'view'

class Controller
  attr_reader :my_todo_list

  def initialize
    @my_todo_list = TaskList.new
    @viewer = Viewer.new
    run_interface
  end

  def run_interface
    input = ""
    @viewer.display_welcome_message
    input = @viewer.get_input
    if input == "add"
      @viewer.display(self.my_todo_list.add(ARGV.drop(1).join(" ")))
      binding.pry
      puts my_todo_list
    elsif input == "delete"
      @viewer.display(self.my_todo_list.delete(ARGV[1]))
    elsif input == "complete"
      @viewer.display(self.my_todo_list.complete(ARGV[1]))
    # else
    #   @viewer.display()
    end
  end

end

# binding.pry

my_controller = Controller.new

puts 'bob'

# puts my_todo_list
