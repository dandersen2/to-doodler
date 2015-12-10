class List
  attr_reader :tasks, :task_file

  def initialize(file)
    @task_file = file
    @tasks = []
    parse_file_to_tasks

    # @tasks = read(file)
  end

  def parse_file_to_tasks
    @tasks = TaskParsable.read
  end

  def add(task)
    self.tasks << Task.new(task)
    TaskParsable.rewrite(self.tasks)

  end

  def delete(task_number)
    deleted_task = self.tasks.delete_at(task_number - 1)
    TaskParsable.rewrite(self.tasks)
    "Deleted \"#{deleted_task.to_s}\" from you TODO list..."
  end

##########TRY TO

  def delete_completed
    # self.tasks.each_with_index do |task, index|
    #   task.delete(index + 1) if task.status == true
    # end

    self.tasks.select! do |task|
      !task.status
    end
  end
  def complete_task(task_number)
    self.tasks[task_number-1].complete
    TaskParsable.rewrite(self.tasks)
    "Completed \"#{tasks[task_number-1].to_s}"
  end

  def to_s
    list_string = "\n"
    self.tasks.each_with_index do |task, index|
      list_string << (index+1).to_s + ". " +  task.to_s  + "\n"
    end
    list_string
  end
end

class Task
  # attr_reader
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
