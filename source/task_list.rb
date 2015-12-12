class TaskList
attr_accessor :tasks

  def initialize(tasks)
    @tasks = tasks
   end

def print_tasks
  @tasks
end

  def add_task(task_string)
    self.tasks << Task.new({content: task_string})
  end

  def delete_task(task_string)
    self.tasks.each do |task|
      if task.content == task_string
        self.tasks.delete(task)
      end
    end
  end

  def check_off_task(task_string)
    self.tasks.each do |task|
      if task.content == task_string
        task.completed = true
      end
    end
  end


end

