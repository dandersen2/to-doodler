require 'time'
class Task
  attr_reader :created_at
  attr_accessor :status, :task, :check_box, :completed_at, :tags

  def initialize(task)
    @task = task
    @status = false
    @created_at = Time.new # AFTER end of day
    @completed_at
    @tags = []
    if !(self.task.include?("[ ]") || self.task.include?("[X]"))
      self.task = "[ ] " + self.task
    elsif self.task.include?("[X]")
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


    self.completed_at = Time.new # AFTER end of day
  end

  def to_s
    self.task
  end
end
