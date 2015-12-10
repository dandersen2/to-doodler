# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
require 'csv'
require_relative 'ListParser'
require 'byebug'
# require 'byebug'

include ListParser

class List
attr_reader :list

  def initialize
    @list = []
  end

  def add(task_string)
    @list << Task.new(task_string)
  end

  def delete(list_index)
    @list.delete_at(list_index - 1)
    @list
  end

  def complete(list_index)
    completed_task = @list[list_index - 1].task
    @list[list_index - 1] = Task.new("<complete> " +completed_task)
    @list
  end

  def to_s
  @list.map.with_index{|task, task_i| "#{task_i + 1}. #{task}"}.join("\n")
  end
end


class Task
attr_reader :task
  def initialize(task)
    @task = task
  end

  def to_s
    @task
  end
end


  todo = List.new
  my_task = "Visit doctor"

  todo.add(my_task)
  p todo.to_s
  puts todo
  puts todo.to_s.class
  puts todo.to_s == "1. Visit doctor"


# class Controller

#   def initialize
#     @list = List.new(build_list)
#     @view = View.new()
#     #run_interface
#   end

#  Parse the todo.csv file and wrap each entry in easier-to-manipulate
# Ruby objects
#   CSV.foreach(read in file)



#   def run_interface
#     based on input, this function is called
#     Use command line args to take appropriate action in controller class, interpret argument as one of the functions

#   Call functions to modify list

#   if no input file given, default to filename todo.csv

#   end
# end


# class View

#   def get_input

#   end

#   def display(output)
#     puts output
#   end
#       Display list to user
#   print list to user using a puts function
#   end
# end


#   Parse the command-line arguments
#   in view class, take argument and feed to controller file


# end

