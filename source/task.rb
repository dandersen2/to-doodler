class Task
  attr_accessor :status, :task, :check_box

  def initialize(task)
    # @task_id = task_id
    @task = task
    @status = false
    if !(self.task.include?("[ ]") || self.task.include?("[X]"))
      self.task = "[ ] " + self.task
      self.status = true
    end
  end

  def update_check_box
    self.check_box = "[X] " if @status == true
    self.task.gsub!("[ ]", "[X]")
  end

  def complete
    self.status = true
    self.update_check_box
    # self.task.gsub("[ ]", "[X]")
  end

  # def format_task

  # end

  def to_s
    self.task
  end
end
