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
    "Added \"#{task.to_s}\" to list..."
  end

  def delete(task_number)
    deleted_task = self.tasks.delete_at(task_number - 1)
    TaskParsable.rewrite(self.tasks)
    "Deleted \"#{deleted_task.to_s[4..-1]}\" from your TODO list..."
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

  def delete_completed
    self.tasks.select! {|task| !task.status}
    TaskParsable.rewrite(self.tasks)
  end

  # AFTER end of day
  def list_outstanding
    self.tasks.select{|task| !task.status}.sort_by {|task| task.created_at}
  end
  # AFTER end of day
  def list_completed
    self.tasks.select{|task| task.status}.sort_by {|task| task.completed_at}
  end
  # AFTER end of day
  def tag_task(index, tag_args)
    tag_args.map {|tag| self.tasks[index - 1].tags << tag}
    TaskParsable.rewrite(self.tasks)
  end
  # AFTER end of day
  def filter_by_tag(tag_arg)
    self.tasks.select{|task| task.tags.include?(tag_arg)}
  end

end
