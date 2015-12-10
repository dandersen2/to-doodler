require 'csv'
require 'pry'
class Task
  attr_reader :file, :task_array
  attr_writer :complete
  def initialize(file)
    @file = file
    @task_array = []
    @complete = false
  end
  def add_tasks
    CSV.foreach(@file) do |row|
      @task_array << row
      # binding.pry
    end
    @task_array
  end
  def complete?
    #working idea @complete = true
  end

  def update_task
  end
end
x = Task.new("todo.csv")
p x.add_tasks
