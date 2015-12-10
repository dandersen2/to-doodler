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

  def delete(task)
    self.tasks.
  end

  def to_s
    list_string = ''
    self.tasks.each_with_index do |line, index|
      list_string << (index+1).to_s + ". " + line.to_s + "\n"
    end
    list_string
  end
end

class Task
  attr_reader :task #:task_id

  def initialize(task)
    # @task_id = task_id
    @task = task
  end

  def to_s
    self.task
  end
end
