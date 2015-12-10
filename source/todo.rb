# What classes do you need?
# 1. Gathering user input and taking the appropriate action (controller)
# Class Controller
# 2. Displaying information to the user (view)
# Class View
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# "Doable" module
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)
# Class List ( encapsulates class Task)


#responsibilities:
# Initialize an empty TODO list list = List.new
# Add a task to a TODO list list.add(Task.new("walk the dog"))
# Get all the tasks on a TODO list  tasks = list.tasks
# Delete a particular task from a TODO list tasks =  list.delete
# Complete a particular task on a TODO list tasks = task.complete
# Parse the command-line arguments and take the appropriate action  ???
# Parse the todo.csv file and wrap each entry in easier-to-manipulate Ruby objects  ???

require 'csv'
require 'pry'

module CSVParsable
 def get_tasks_from_csv(file)
    CSV.foreach(file) do |row|
      @tasks << row
    end
  end

def save_tasks_to_csv(file)
  CSV.open(file, "w")
    @tasks.each do |row|
    file  <<  row
    end
  end

end

class List
  attr_reader  :file
  attr_accessor  :tasks
  include CSVParsable

  def initialize
    @file = file
    @tasks = []
  end

  def add(task_object)
    self.tasks << task_object

  end

  def list_tasks(tasks)
    tasks.each do |task|
    p tasks
    # .join("" +"\n")
    end

  end


 # def delete_tasks
 #  tasks.delete_at((index.to_i.)+1)
 #  end

end

class Task
  attr_accessor  :name, :complete

  def initialize(name)
  @name = name
  @complete = false
  end

  def mark_complete
    if complete == "true"
      puts ["X"]
    else
      [" "]
   end
 end


end


class Controller
  def initialize
    @list = List.new
    @task = Task.new
    @view = View.new
    run_todo
  end




  # def run_todo
  #   puts "Hello! Everything's doable!"
  #   case
  #   when input = "list"
  #   @view.show_tasks
  #   when input == ""
  #     if input == true
  #     @list.add
  #       @view.display("xxxxxx")
  #     else
  #       @view.display("XXX") unless input == "exit"
  #     end
  #   end
  #   @view.display("xxxxxx")
  # end


end


class View

  def show_tasks(list)
    puts list
  end

  def add_task(task)
    gets.chomp
  end

  # def display_add_message
  #   display("Please add a task")
  #   if input == true

  # end

end

list = List.new
file = "todo.csv"
