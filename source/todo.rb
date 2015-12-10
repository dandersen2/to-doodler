# EXAMPLE
# $ ruby todo.rb add Bake a delicious blueberry-glazed cheesecake
# $ ruby todo.rb list
# $ ruby todo.rb delete <task_id>
# $ ruby todo.rb complete <task_id>

# # Remember, there are four high-level responsibilities, each of which have
# multiple sub-responsibilities:
# # 1. Gathering user input and taking the appropriate action (controller)
# # 2. Displaying information to the user (view)
# # 3. Reading and writing from the todo.txt file (persisting models to non-volatile
#   storage, aka "the hard drive")
# # 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# # Note that (4) is where the essence of your application lives.
# # Pretty much every application in the universe has some version of
# responsibilities (1), (2), and (3).
require 'pry'
require 'CSV'

# Initialize an empty TODO list
# list = List.new

# Add a task to a TODO list
# list.add(Task.new("walk the dog"))

# Get all the tasks on a TODO list
# tasks = list.tasks

# Delete a particular task from a TODO list
# tasks.delete_at(task_id)

# Complete a particular task on a TODO list
# tasks.completed? = true

# Parse the command-line arguments and take the appropriate action
# input = "new list", "add", "list", "delete", "complete" + task_id for add, delete, and complete

# Parse the todo.csv file and wrap each entry in easier-to-manipulate Ruby objects


class TodoList
end

class Task
  attr_reader :task_id, :task

  def initialize(args = {})
    @task_id = args[:task_id]
    @task = args[:task] || "empty task"
    @completed = args.fetch(:completed, false)
  end

end

class TodoController
end

class TodoView
end

def parse_tasks_objects_from_file(file)
  CSV.read(file).map.with_index do |row, index|
  p Task.new(task_id: index+1, task: row)
  end
end

parse_tasks_objects_from_file('todo.csv')

