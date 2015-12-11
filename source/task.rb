require_relative 'todo'

class Task

attr_reader :task_item

  def initialize(task_item = {})
    @task_item = task_item.fetch(:task_item)
  end

  def to_s
    @task_item
  end

end