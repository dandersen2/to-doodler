class Task
  attr_writer :completed

  def initialize(task)
    @task = task
  end

  def completed?
    self.completed = false
  end
end
