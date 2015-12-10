class Task
  attr_reader :task_id, :task

  def initialize(args = {})
    @task_id = args[:task_id] || "#"
    @task = args[:task] || "Do Nothing"
    @completed = args.fetch(:completed, false)
  end

  def to_s
    "#{@task_id}. #{@task} -- Complete: #{@completed}"
  end
end

test = Task.new
puts test
