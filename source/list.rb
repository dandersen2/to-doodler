require_relative 'task'

class List
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def add_task(task)
    self.tasks << task
  end

  public

  def find_task(task_number)
    self.tasks.find{|row| row.number == task_number}
  end

end
