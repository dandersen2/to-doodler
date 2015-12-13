require 'csv'
require_relative 'task'
require_relative 'parser'
class List
  include Parser
  attr_reader :file, :task_array
  def initialize(file)
    @file = file
    @task_array = []
  end

  def add_task(new_task)
    @task_array << new_task
  end

  def remove_task(index)
    @task_array.delete_at(index)
  end

  def finish_task(index)
    @complete == true
    @task_array[index].name = "(completed) #{@task_array[index].name}"
  end
end
