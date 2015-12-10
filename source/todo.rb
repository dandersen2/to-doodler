require 'csv'
require 'pry'
require_relative 'view'
require_relative 'todolist'
# What classes do you need?

# controller - add, save, delete,

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)

# 2. Displaying information to the user (view)

# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive") (controller)

# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.

# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
class Controller
  attr_reader :file
  attr_accessor :to_do_list, :pass_on, :list_displayed

  def initialize(file)
    self.to_do_list = ToDoList.new(file)
  end

  def import_info
    self.to_do_list.read
  end

  def list
    self.list_displayed = View.new(self.to_do_list.file_as_array)
    self.list_displayed.display
  end

  def save
    self.to_do_list.save_changes
  end

end