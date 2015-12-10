# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
require 'csv'
require_relative 'ListParser'
require 'byebug'
require_relative 'controller'


include ListParser

class List
attr_reader :list

  def initialize
    @list = build_list
  end

  def add(task_string)
    @list << Task.new(task_string)
  end

  def delete(list_index)
    @list.delete_at(list_index - 1)
    @list
  end

  def complete(list_index)
    completed_task = @list[list_index - 1].task
    @list[list_index - 1] = Task.new("<complete> " +completed_task)
    @list
  end

  def to_s
  @list.map.with_index{|task, task_i| "#{task_i + 1}. #{task}"}.join("\n")
  end
end


class Task
attr_reader :task
  def initialize(task)
    @task = task
  end

  def to_s
    @task
  end
end




