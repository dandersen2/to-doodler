require 'csv'
require 'pry'
require_relative 'todo'

class ToDoParser
  attr_reader :file, :parsed_list

  def initialize(file)
    @file = file
    @parsed_list = []
  end

  def parse_todos_to_todo_objects
    # Returns an array of Todo objects from todo.csv
    csv_file = CSV.open(file).map do |row|
    # csv_file = CSV.open(file).map do |row|
      binding.pry
      self.parsed_list << ToDo.new(row)

    end

    # (use this to check what is being shoveled into @parsed_list)
  end

   # def add_todo_to_list(todos=[])
  #   todos.each do |task|
  #     CSV.open(file, "a+") do |csv|
  #       csv << todo.combine_checkbox_and_content
  #     end
  #     @todo_list << task
  #   end
  # end
end

