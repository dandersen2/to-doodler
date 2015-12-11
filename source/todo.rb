# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

require 'csv'
require 'pry'
require_relative 'task'



class List

attr_reader :task_file
attr_writer :set_of_tasks

  def initialize(task_file)
    @task_file = task_file
    @set_of_tasks = []
    @set_of_tasks += parse_list_items_from_file
  end


  def parse_list_items_from_file
    CSV.foreach(@task_file).map{|row| Task.new({:task_item => row[0]}).to_s}
  end


  def action
    case
      when ARGV[0] == "list" then self.display_list
      when ARGV[0] == "delete" then self.delete_list_item
      when ARGV[0] == "add" then self.add_list_item
    end
  end


  def display_list
      @set_of_tasks.each_with_index {|item, index| puts "#{index + 1}. #{item}"}
  end


  def add_list_item
    new_item = []
    new_item << ARGV[1..-1].join(" ")
    @set_of_tasks = @set_of_tasks + new_item
    CSV.open('todo.csv', 'w') do |csv|
      csv << @set_of_tasks.each {|task| task}
    end
  end


  # def delete_list_item
  #   @set_of_tasks.each_with_index do |row, index|
  #     if ARGV[1] == (index + 1)
  #       @set_of_tasks.delete_at(index)
  #       @set_of_tasks
  #       puts "Deleted #{row}"
  #     end
  #   end
  #   CSV.open('todo.csv', 'w') do |csv|
  #     csv << @set_of_tasks.map do |row|
  #       row
  #     end
  #   end
  # end

end















