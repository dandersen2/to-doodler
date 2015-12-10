require 'CSV'

class Task
  attr_reader :id, :task

  def initialize(args = {})
    @id = args[:id] || "#"
    @task = args[:task] || "Do Nothing"
    @completed = args.fetch(:completed, false)
  end

  def to_s
    "#{@id}. #{@task} -- Complete: #{@completed}"
  end

  def write_task_to_csv
    CSV.open("todo.csv", "ab") do |csv|
    csv << [task]
    end
  end

end


# test = Task.new(task: ["Go to the gym"])
# puts test
