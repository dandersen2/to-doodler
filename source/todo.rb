# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

require 'pry'
require 'csv'

# model: list of tasks
class ToDoList
  attr_reader :list, :title, :task, :task_id, :task_status

  def initialize(list={})
    @title = list[:title]
    @task = list[:task]
    @task_id = list[:task_id]
    @task_status  = list[:task_status]
  end

  def compiled_list
    list
  # is this necessary? or should anything else happen in this class?
  end


end

# model: info for task
class Task
  attr_writer :task, :task_id, :task_status, :list

  def initialize(list ={})
    @title = list[:title]
    @task = list[:task]
    @task_id = list[:task_id]
    @task_status  = list[:task_status]
  end

  def complete_list
    list[@task_id].each do |key, value|
     # if !(list[key]has_value?)
      list[value] = list.length
     end
  end

  def complete_task?
# Complete a particular task on a TODO list ???
    list[@task_status].each do |key, value|
       if value == true
         puts "#{key} is complete"
       else
         puts "#{key} is incomplete"
         list[@task_status] = false
       end
    end
# ???take info from TaskParse and assign task_id_no and task_status???
end


# parser for tasks
class TaskParse
  attr_reader :file, :task
  attr_writer :task_id, :task_status, :list

  def initialize(file)
    @file = file
    @task = task
  end

# Parse the command-line arguments and take the appropriate action  ???
# Parse the todo.csv file and wrap each entry in easier-to-manipulate Ruby objects
  def parse_tasks_from_file
    CSV.each('todo.csv') do |row|
      list << Task.new({task: row})
    end
  end

  def write_to_file
    # write to the todo.txt file
  end

end

# controller: gather user input and take the appropriate action
class Controller
  attr_reader :list, :title, :task, :task_id, :task_status

  def initialize(list={})
    @title = list[:title]
    @task = list[:task]
    @task_id = list[:task_id]
    @task_status  = list[:task_status]
  end

  def get_task
# get input and push Task.new into list
  end

  def add
# Add a task to a TODO list--list.add(Task.new("walk the dog"))
    @list << Task.new
  end

  def delete
# Delete a task from TODO list
# if @task_status == false
  end
end

# view: display information to the user
class View
  attr_reader :list, :title, :task, :task_id, :task_status

  def initialize(list={})
    @title = list[:title]
    @task = list[:task]
    @task_id = list[:task_id]
    @task_status  = list[:task_status]
  end

  def display
  end
end

p shopping_list = ToDoList.new({title:"Shopping List"})
p task1 = Task.new({task:"get bread"})
p task2 = Task.new({task:"get apples"})
shopping_list.compiled_list
shopping_list.complete_task?
# p task1 = Task.new({task:"get bread", task_id: 1, task_status: false})
# p task2 = Task.new({task:"get apples", task_id: 2, task_status: false})



