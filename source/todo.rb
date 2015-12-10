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

  def review_todo_list
    @set_of_tasks
  end

  def add_task_to_list(new_task)
    @set_of_tasks << Task.new(new_task)
  end

end

binding.pry

puts















