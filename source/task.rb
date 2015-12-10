class Task
  # attr_reader :completed
  attr_writer :completed

  def initialize(task)
    @task = task
    self.completed = [ ]
  end

  def completed?
    @completed
  end

  def complete_task
    @completed = [X]
    @task += ' -- completed'
  end

  def to_s
    "#{@task}"
  end
end
