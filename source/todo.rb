require 'csv'
require 'pry'
require_relative 'view'
require_relative 'todolist'
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")(controller)

# 4. Manipulating the in-memory objects that model a real-life TODO list (model)
class Controller
  attr_reader :file
  attr_accessor :to_do_list, :list_displayed

  def initialize(file)
    input_command = ARGV.shift
    type_of_input = ARGV.join(" ")
    self.to_do_list = ToDoList.new(file)
    self.to_do_list.read
    self.list_displayed = View.new(self.to_do_list.file_as_array)
    if input_command == 'add'
      self.add(type_of_input)
    elsif input_command == 'delete'
      delete(type_of_input.to_i)
    elsif input_command == 'complete'
      complete(type_of_input.to_i)
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