require 'csv'
require 'pry'
require_relative 'task'

class TaskParser
  attr_reader :file, :parsed_list, :list

  def initialize(file)
    @file = file
    @parsed_list = []
    @list = []
  end

  def populate_task_list
    # Returns an array of Todo objects from todo.csv
    csv_file = CSV.open(file).map do |row|
    # csv_file = CSV.open(file).map do |row|

      # binding.pry
      self.parsed_list << row[0]
      # self.parsed_list << ToDo.new(row)

    end
    self.parsed_list.each do |task_content_string|
      self.list << Task.new({task_content: task_content_string, task_id: rand.to_s[2..15].to_i})
    end
    # binding.pry
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

