require 'pry'

class Task
  attr_writer :completed

  def initialize(task)
    @task = task
  end

  def completed?
    self.completed = false
  end

  def to_s
    "#{@task}"
  end
end

# my_task = Task.new('stuff')

# puts my_task
