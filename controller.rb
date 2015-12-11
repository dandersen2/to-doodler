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
end

class Controller

  attr_reader :list, :to_dos
  def initialize
    tasks = get_tasks_from_csv
    @list = List.new('source/todo.csv')
    @list.add_list
  #   run_interface(option, text)
  end

  def get_tasks_from_csv #parserwe are not good friends yet CSV
    csv_file = CSV.read(@file)
     csv_file.map do |row|
      Task.new({to_do: row.first})
     end
   end
  # def run_interface(option, text)
      @view.display("welcome to your to do list \n the first short cut is to add a ton of 1work task to your list \n you can do so by just typing the task \n ie : run sleep drinkwine")
      @view.display("Otherwise use the following commands \n delete add done followed by the description of the task \n add buy a pony"
  #   case option
  #   when "list"
  #     @view.display(puts @list)
  #   when "add"
  #     @list.add(text)
  #     @view.display()
  #   when "delete"
  #     @list.delete(text)
  #     @view.display()
  #   when "complete"
  #     @list.done(text)
  #     @view.display("")
  #   end
  # end
end
todo_list = Controller.new



p Controller

# did not finish this
# I will eventually call all of this from my runner, right now it only works
# if you polute the global scope in the list file.
