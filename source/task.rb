class Task
  attr_reader :task
  def initialize#have some input that we can grab from the csv or if no input given maybe default to argv?
    @task = ARGV
  end

  def print
    @task = self.task
  end

end
