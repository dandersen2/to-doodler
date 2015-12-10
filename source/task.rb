class Task
  attr_reader :task
  def initialize
    @task = ARGV
  end

  def print
    @task = self.task.join
  end

end
