require 'csv'

class List
  # include TaskParsable
  attr_reader :tasks, :task_file

  def initialize(file)
    @task_file = file
    @tasks = []
    parse_file_to_tasks
  end

  def parse_file_to_tasks
    # Convert CSV file to list of tasks by line
      #For each line in file, make new task instance, add to @tasks as string
    if self.task_file
      CSV.foreach(self.task_file) do |row|
        self.tasks << Task.new(row.join(' ')) # Use #join in case of in-line comma
      end
    end
  end

  def add(task)
    added_task = Task.new(task)
    self.tasks << added_task
    # CSV.open('todo.csv') do |file|
    #   file << [added_task.to_s]
    # end
  end

  def delete(task_number)
    deleted_task = self.tasks.delete_at(task_number - 1)
    "Deleted \"#{deleted_task.to_s}\" from you TODO list..."
  end

  def complete_task(task_number)
    self.tasks[task_number-1].complete
    "Completed \"#{tasks[task_number-1].to_s}"
  end

  def to_s
    list_string = ''
    self.tasks.each_with_index do |task, index|
      list_string << (index+1).to_s + ". "
      if task.status
        list_string << "[X]  "
      else
        list_string << "[ ]  "
      end
      list_string << task.to_s + "\n"
    end
    list_string
  end
end

class Task
  attr_reader :task
  attr_accessor :status

  def initialize(task)
    # @task_id = task_id
    @task = task
    @status = false
  end

  def complete
    self.status = true
  end

  def to_s
    self.task
  end
end
