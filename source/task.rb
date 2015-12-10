class Task
  attr_reader :task_id, :task

  def initialize(args = {})
    @task_id = args[:task_id]
    @task = args[:task] || "empty task"
    @completed = args.fetch(:completed, false)
  end

end
