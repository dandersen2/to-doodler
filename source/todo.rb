require 'csv'
require 'pry'
require_relative 'view'
require_relative 'todolist'
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
    var1 = ARGV.shift
    var2 = ARGV.join(" ")
    self.to_do_list = ToDoList.new(file)
    self.to_do_list.read
    self.list_displayed = View.new(self.to_do_list.file_as_array)
    # binding.pry
    if var1 == 'add'
      self.add(var2)
    elsif var1 == 'delete'
      delete(var2.to_i)
    elsif var1 == 'complete'
      complete(var2.to_i)
    end
    self.list
  end

  def list
    self.list_displayed.display
  end

  def add(string)
    self.to_do_list.add_to_list(string)
  end

  def delete(number)
    self.to_do_list.delete_from_list(number)
  end

  def complete(number)
    self.to_do_list.complete(number)
  end

end