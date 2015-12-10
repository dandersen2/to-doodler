require_relative 'task_parser'

class Task
  attr_reader :task_id
  attr_writer :completed

  def initialize(args = {})
    self.completed  = false
    @task_content = args.fetch(:task_content)
    @task_id = args.fetch(:task_id)
    # @completed = []
    # @task_id = parsed_todo.fetch(:task_id, "0000" )
    # @task_id = 345
    # @task_content = parsed_todo.fetch(:content, "No content assigned to this task yet!")
    # @task_content = ""
    # self.completed = false
    # @parsed_list = parsed_todo.fetch()
  end

  def completed(task_id)
    #moves the task (provided in the argument) to a completed tasks data structure
    # Note!: This will require changing the format of todo.csv and the code that parses it.
    # IDEA: take an array called complete that is included in the pretty printed version and just put an X into it instead of a " " empty space ???
  end

  def completed?(task_id)
    @completed
  end

end





# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
