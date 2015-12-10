class List
  attr_reader :tasks

  def initialize(args={})
    @tasks = []
  end

  def add(task)
    self.tasks << task
  end

  def delete(task)
    self.tasks.delete(task)
  end

  # def complete(task)
  #   self.tasks.task.completed? = true
  # end
end

# List.new(array_of_task_objects_built_from_our_csv_parser)
