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
    puts task_item
  end

end


class List

attr_reader :task_file, :set_of_tasks
# attr_writer :set_of_tasks

  def initialize(task_file)
    @task_file = task_file
    @set_of_tasks = []
  end

  def parse_list_items_from_file
    CSV.foreach(@task_file) {|row| @set_of_tasks << Task.new({:task_item => row[0]})}
    @set_of_tasks
  end
binding.pry

  def to_s
    parse_list_items_from_file
  end

  def review_todo_list
    puts to_s
  end

  def add_task_to_list(new_task)
    @set_of_tasks << Task.new(new_task)
    puts "Appended #{new_task} to your TODO list..."
  end

  # def remove_task_from_list(current_task)
  #   if @set_of_tasks.include?(:task_item => current_task)
  #     @set_of_tasks.delete(current_task) {"That task is not in your To-Do List"}
  #   end
  # end

end


binding.pry

puts















