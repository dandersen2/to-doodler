require 'CSV'

class Task
  attr_reader :id, :task

  def initialize(args = {})
    @id = args[:id] || "#"
    @task = args[:task] || "Do Nothing"
    @completed = args.fetch(:completed, false)
  end

  def to_s
    "#{@id}. #{@task}"
  end

end
