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

class Task

attr_reader :task_item

  def initialize(task_item = {})
    @task_item = task_item.fetch(:task_item)
  end

  def to_s
    @task_item
  end

end


class List

attr_reader :task_file
# attr_writer :set_of_tasks

  def initialize(task_file)
    @task_file = task_file
  end


  def parse_list_items_from_file
    @set_of_tasks = []
    CSV.foreach(@task_file) {|row| @set_of_tasks << Task.new({:task_item => row[0]}).to_s}
    @set_of_tasks
  end
# binding.pry

  # def to_s
  #   @set_of_tasks #.each {|task| puts task}
  # end

  def display_list
    if ARGV[0] == "list"
      parse_list_items_from_file.each_with_index {|item, index| puts "#{index + 1}. #{item}"}
    end
  end

  # def add_task_to_list()
  #   @set_of_tasks << Task.new(ARGV).to_s
  #   puts "Appended #{Task.new(ARGV).to_s} to your TODO list..."
  # end

  def delete_list_item
    if ARGV[0] == "delete"
      # puts "delete!!"
      parse_list_items_from_file.each_with_index do |row, index|
        if ARGV[1] == (index + 1)
          parse_list_items_from_file.delete_at(index)
          puts "Deleted '#{row}' from your TODO list..."
        end
      end
    # if parse_list_items_from_file.include?(current_task)
    #   parse_list_items_from_file.delete(current_task) {"That task is not in your To-Do List"}
    end
  end

end


binding.pry

puts















