require 'csv'
require_relative 'task'
require_relative 'list'
require 'pry'


class View
  def display(output)
    puts output
  end

  def get_input
    gets.chomp
  end

  def display_welcome_message
    display("Welcome to this Gumball Machine! Type 'insert quarter' to get a gumball.")
  end
end

class Controller

  attr_reader :list, :to_dos
  def initialize
    @list = List.new('source/todo.csv')
    @list.add_list
    run_interface
  end
  def run_interface
    input = ""
    @view.display_welcome_message
    until input == "exit"
      input = @view.get_input
      if input == "insert quarter"
        @view.display(@gbm.insert_quarter)
      else
        @view.display("Sorry, I don't know that command.") unless input == "exit"
      end
    end
    @view.display("Yum! Thanks for p(l)aying?")
  end
end
todo_list = Controller.new

binding.pry

p Controller

# somewhere over here I will do
# to_do_list.list(add) it might even be on a method inside my controller
# after I add the viewer part
# I will grab my to dos to add with an ARGV thing that will give me an array of strings
# that array of string I will have to modify with the same format I used for the csv
# to ["","",""] becomes an array of hashes with every staring having a key of :to_do so I can feed it in to my method
